package com.group6.shopping.chatting.handler;

import com.group6.shopping.chatting.vo.Room;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.*;
@Component
public class SocketHandler extends TextWebSocketHandler implements RoomList {

    @Autowired
    private S3Service s3Service;


    List<HashMap<String, Object>> rls = new ArrayList<>(); //웹소켓 세션을 담아둘 리스트 ---roomListSessions
    SimpleDateFormat date = new SimpleDateFormat ( "yyyy-MM-dd-HH-mm-ss");
    private static final String FILE_UPLOAD_PATH = "C:/sixstore/";
    static int fileUploadIdx = 0;
    static String fileUploadSession = "";
    static String username="";
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        //메시지 발송
        String msg = message.getPayload(); //JSON형태의 String메시지를 받는다.
        JSONObject obj = jsonToObjectParser(msg); //JSON데이터를 JSONObject로 파싱한다.

        String rN = (String) obj.get("roomNumber"); //방의 번호를 받는다.
        String msgType = (String) obj.get("type"); //메시지의 타입을 확인한다.
        /* System.out.println(obj.get("userName"));*/

        HashMap<String, Object> temp = new HashMap<String, Object>();
        if (rls.size() > 0) {
            for (int i = 0; i < rls.size(); i++) {
                String roomNumber = (String) rls.get(i).get("roomNumber"); //세션리스트의 저장된 방번호를 가져와서
                if (roomNumber.equals(rN)) { //같은값의 방이 존재한다면
                    temp = rls.get(i); //해당 방번호의 세션리스트의 존재하는 모든 object값을 가져온다.
                    fileUploadIdx = i;
                    fileUploadSession = (String) obj.get("sessionId");
                    username = (String) obj.get("userName");
                    break;
                }
            }
            if (!msgType.equals("fileUpload")) { //메시지의 타입이 파일업로드가 아닐때만 전송한다.
                //해당 방의 세션들만 찾아서 메시지를 발송해준다.
                for (String k : temp.keySet()) {
                    if (k.equals("roomNumber")) { //다만 방번호일 경우에는 건너뛴다.
                        continue;
                    }

                    WebSocketSession wss = (WebSocketSession) temp.get(k);
                    if (wss != null) {
                        try {
                            wss.sendMessage(new TextMessage(obj.toJSONString()));
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }

    /*@Override*/
    public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
        //바이너리 메시지 발송

        ByteBuffer byteBuffer = message.getPayload();

        byte[] bytes =new byte[byteBuffer.remaining()];
     /*   String uploadFolderPath = getFolder();*/

        Date time=new Date();
        String datename=date.format(time);
        //파일 이름은 유저이름+날짜
        String fileName =username+"@"+datename+".jpg" ;


        File dir = new File(FILE_UPLOAD_PATH);
        if(!dir.exists()) {
            dir.mkdirs();
        }

        File file = new File(FILE_UPLOAD_PATH, fileName);
        FileOutputStream out = null;
        FileChannel outChannel = null;
        try {
            byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
            out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 연다.
            outChannel = out.getChannel(); //채널을 열고
            byteBuffer.compact(); //파일을 복사한다.
            outChannel.write(byteBuffer); //파일을 쓴다.
            s3Service.uploadFile(bytes, fileName);

        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            try {
                if(out != null) {
                    out.close();
                }
                if(outChannel != null) {
                    outChannel.close();
                }
            }catch (IOException e) {
                e.printStackTrace();
            }
        }

        byteBuffer.position(0); //파일을 저장하면서 position값이 변경되었으므로 0으로 초기화한다.
        //파일쓰기가 끝나면 이미지를 발송한다.
        HashMap<String, Object> temp = rls.get(fileUploadIdx);
        for(String k : temp.keySet()) {
            if(k.equals("roomNumber")) {
                continue;
            }
            WebSocketSession wss = (WebSocketSession) temp.get(k);
            try {
                wss.setBinaryMessageSizeLimit(500000);
                wss.setTextMessageSizeLimit(500000);

                JSONObject cuobj = new JSONObject();
                cuobj.put("type", "file");
                cuobj.put("sessionId", session.getId());
                wss.sendMessage(new TextMessage(cuobj.toJSONString()));
                wss.sendMessage(new BinaryMessage(byteBuffer)); //초기화된 버퍼를 발송한다.
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //소켓 연결
        super.afterConnectionEstablished(session);

        WebSocketSession customer;

        session.setBinaryMessageSizeLimit(500000);
        session.setTextMessageSizeLimit(500000);

        boolean flag = false;
        int canchat=0;
        String url = session.getUri().toString();
        String roomNumber = url.split("/chating/")[1];
        int idx = rls.size(); //방의 사이즈를 조사한다.
        if(rls.size() > 0) {
            for(int i=0; i<rls.size(); i++) {
                String rN = (String) rls.get(i).get("roomNumber");
                if(rN.equals(roomNumber)) {
                    flag = true;
                    idx = i;
                    break;
                }
            }
        }
        int sessionsize=0;

        if(flag) { //존재하는 방이라면 세션만 추가한다.

            HashMap<String, Object> map = rls.get(idx);
            for (Map.Entry<String, Object> tmp : map.entrySet()) {
                if(tmp.getKey() != "roomNumber") {
                    customer = (WebSocketSession) tmp.getValue();
                    JSONObject cuobj = new JSONObject();
                    cuobj.put("type", "getId");
                    cuobj.put("sessionId", customer.getId());
                    cuobj.put("canchat", 1 + "");
                    customer.sendMessage(new TextMessage(cuobj.toJSONString()));
                }
            }
            map.put(session.getId(), session);

            sessionsize=map.size();
            if(sessionsize<=1){
                canchat=0;
            }else {
                canchat=1;
            }
        }else { //최초 생성하는 방이라면 방번호와 세션을 추가한다.
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("roomNumber", roomNumber);
            map.put(session.getId(), session);
            rls.add(map);
            if(sessionsize<=1){
                canchat=0;
            }else {
                canchat=1;
            }
        }

        JSONObject obj = new JSONObject();
        obj.put("type", "getId");
        obj.put("sessionId", session.getId());
        obj.put("canchat", String.valueOf(canchat));
        session.sendMessage(new TextMessage(obj.toJSONString()));
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        //소켓 종료
        if(rls.size() > 0) { //소켓이 종료되면 해당 세션값들을 찾아서 지운다.
            for(int i=0; i<rls.size(); i++) {
                rls.get(i).remove(session.getId());
                rls.remove(i);
            }

        }
        Iterator iter=roomList.iterator();
        while(iter.hasNext()) {
            Room tmp=(Room)iter.next();
            if(tmp.getUserSessionId().equals(session.getId())){
                iter.remove();
            }
        }


            super.afterConnectionClosed(session, status);
    }

    private static JSONObject jsonToObjectParser(String jsonStr) {
        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return obj;
    }
}