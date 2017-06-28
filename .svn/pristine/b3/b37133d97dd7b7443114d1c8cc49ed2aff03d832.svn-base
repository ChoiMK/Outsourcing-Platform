package kr.or.plzdvl.chatting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.or.plzdvl.chatting.vo.ChattingVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ChattingController {
	private static int roomNum;
	
	@Autowired
	private HttpSession session; 
	
	
	@RequestMapping("consulting")
	public ModelAndView chat(ModelAndView andView)throws Exception{
		andView.setViewName("consulting/consultingView");
		return andView;
	}
	
	@RequestMapping("roomNum")
	public ModelAndView BangNum(ModelAndView andView,
			String adminRoomNum)throws Exception{
		
		if(adminRoomNum == null || adminRoomNum ==""){
			session.setAttribute("roomNum",roomNum++);
		}else{
			int roomNum = Integer.parseInt(adminRoomNum);
			session.setAttribute("roomNum",roomNum);
		}
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("adminAddchatting")
	public ModelAndView adminAddchatting(ModelAndView andView,
			int roomNum,
			String message)throws Exception{
		if(session.getAttribute("roomSession")==null){
		List<String> roomVOinList = new  ArrayList<String>();
		ChattingVO roomListInfo = new ChattingVO();
		roomVOinList.add("1");
		roomListInfo.setRoomList(roomVOinList);
		session.setAttribute("roomSession",roomListInfo);
		}
		// 받은 방값을 세팅
		session.setAttribute("roomNum",roomNum);
		// 새창을 띄울 jsp
		andView.setViewName("consulting/admin/adminConsultingView");
		// 세팅한 데이터를 전달
		andView.addObject("roomNum",roomNum);
		andView.addObject("message", message);
		return andView;
	}
	
	@RequestMapping("adminAddchattingList")
	public ModelAndView adminAddchattingList(ModelAndView andView,
			String roomList)throws Exception{
		ChattingVO roomListInfo =  (ChattingVO) session.getAttribute("roomSession");
		 List<String> roomVOinList = roomListInfo.getRoomList();
		roomVOinList.add(roomList);
		roomListInfo.setRoomList(roomVOinList);
		session.setAttribute("roomSession",roomListInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("videChat")
	public ModelAndView videoChatView(ModelAndView andView)throws Exception{
		andView.setViewName("videochat/chat/videoChatView");
		return andView;
	}
	
	
}
