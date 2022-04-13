package com.group6.shopping.chatting.controller;

import com.group6.shopping.chatting.handler.RoomList;
import com.group6.shopping.chatting.vo.Room;
import com.group6.shopping.security.CustomMemDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

//admin, members 권한별로 url 지정하기
@Controller
@RequestMapping("/chat")
public class ChatController implements RoomList {
 /*   List<Room> roomList = new ArrayList<Room>();*/
    static int roomNumber = 0;

   //방페이지 return
    @RequestMapping("/admin/room")
    public ModelAndView room() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/chat/room");
        mv.addObject("roomList", roomList);
        return mv;
    }

    //방생성
    // "/member/createRoom"
    @RequestMapping("/member/createRoom")
    @ResponseBody
    public Room createRoom(String mem_id){
        Room room = new Room();
        if(mem_id != null && !mem_id.trim().equals("")) {
            room.setRoomNumber(++roomNumber);
            room.setRoomName(mem_id);
            roomList.add(room);
        }
       /* System.out.println("roomNum: " + room.getRoomNumber() + " roomName: " + room.getRoomName());*/
        return room;
    }

    //방가져오기
    // "/admin/getRoom"
    @RequestMapping("/admin/getRoom")
    public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
        return roomList;
    }

    //방지우기
    @RequestMapping("/updateroom")
    public @ResponseBody String updateRoom(String sId, HttpSession session){
        CustomMemDetails cs=(CustomMemDetails) session.getAttribute("user");
        for(Room tmp:roomList){
            if(tmp.getRoomName().equals(cs.getMem_id())){
                tmp.setUserSessionId(sId);
            }
        }
        return "";
    }


    //채팅방
    @RequestMapping("/moveChating")
    public ModelAndView chating(@RequestParam HashMap<Object, Object> params, HttpSession session) {
        CustomMemDetails cs = (CustomMemDetails) session.getAttribute("user");
        ModelAndView mv = new ModelAndView();
        if(cs.getMem_id().equals(params.get("roomName")) || cs.getMem_auth().equals("ROLE_ADMIN")){

            int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

            List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
            if(new_list != null && new_list.size() > 0) {
                mv.addObject("roomName", params.get("roomName"));
                mv.addObject("roomNumber", params.get("roomNumber"));
                mv.setViewName("members/chat/chat");
            }
            return mv;
        }else{
            mv.addObject("chatError","옳바르지 못한 접근 입니다");
            mv.setViewName("home");
            return mv;
        }

    }

}