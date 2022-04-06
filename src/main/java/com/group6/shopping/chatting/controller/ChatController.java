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
public class ChatController implements RoomList {
    //List<Room> roomList = new ArrayList<Room>();
    static int roomNumber = 0;

   //방페이지 return
    @RequestMapping("/room")
    public ModelAndView room() {
        System.out.println("room 도착");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/chat/room");
        mv.addObject("roomList", roomList);
        return mv;
    }

    //방생성
    // "/member/createRoom"
    @RequestMapping("/createRoom")
    @ResponseBody
    public Room createRoom(String mem_id){
        System.out.println(mem_id);
        Room room = new Room();
        if(mem_id != null && !mem_id.trim().equals("")) {
            room.setRoomNumber(++roomNumber);
            room.setRoomName(mem_id);
            roomList.add(room);
        }
        System.out.println("roomNum: " + room.getRoomNumber() + " roomName: " + room.getRoomName());
        return room;
    }

    @RequestMapping("/updateRoom")
    @ResponseBody
    public String updateRoom(String sId, HttpSession session){
        CustomMemDetails cs = (CustomMemDetails) session.getAttribute("user");
        for(Room tmp : roomList){
            if(tmp.getRoomName().equals(cs.getMem_id())){
                tmp.setUserSessionId(sId);
            }
        }

        return "";
    }

    //방가져오기
    // "/admin/getRoom"
    @RequestMapping("/getRoom")
    public @ResponseBody List<Room> getRoom(@RequestParam HashMap<Object, Object> params){
        return roomList;
    }

    //채팅방
    // "/admin/moveChating"
    @RequestMapping("/moveChating")
    public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
        ModelAndView mv = new ModelAndView();
        int roomNumber = Integer.parseInt((String) params.get("roomNumber"));

        List<Room> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
        if(new_list != null && new_list.size() > 0) {
            mv.addObject("roomName", params.get("roomName"));
            mv.addObject("roomNumber", params.get("roomNumber"));
            mv.setViewName("members/chat/chat");
        }
        return mv;
    }

}