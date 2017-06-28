package kr.or.plzdvl.common;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import kr.or.plzdvl.alarm.service.alarmService;
import kr.or.plzdvl.alarm.vo.AlarmVO;
import kr.or.plzdvl.member.vo.MemberVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class AlarmHandler extends TextWebSocketHandler {
	private static Logger logger = LoggerFactory.getLogger(AlarmHandler.class);
	// 접속한 유저들을 맵에 담음
	private static Map<String, WebSocketSession> sessions  = new HashMap<String, WebSocketSession>();
	int alarmCount;
	String al_chk_wht = "N";
	
	@Autowired
	private alarmService service;
		
	    @Override
	    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	    	//로그인한 회원의 세션을 가져온다
	    	Map<String, Object> map = session.getAttributes();
	        MemberVO memberInfo = (MemberVO)map.get("LOGIN_MEMBERINFO");
	        // 회원의 아이디를 담을 맵 생성
	        String mem_id = memberInfo.getMem_id();
	        //맵에 회원의 세션을 넣음
	        sessions.put(mem_id, session);
	        
	        Timer timer = new Timer();
	        TimerTask timerTask = new TimerTask() {
				@Override
				public void run() {
					for( String key : sessions.keySet()){
				    		 try {
				    			    Map<String, String> params = new HashMap<String, String>();
				    		        params.put("mem_id", key);
				    				params.put("al_chk_wht", al_chk_wht);
				    		        // 해당 회원의 알람을 가져옴
				    				List<AlarmVO> alarmList = service.alarmList(params);
				    		        //안읽은 알람갯수를 구해옴
				    		        alarmCount = alarmList.size();
								    sessions.get(key).sendMessage(new TextMessage(String.valueOf(alarmCount)));
							} catch (IOException e) {
								e.printStackTrace();
							} catch (Exception e) {
								e.printStackTrace();
							}
				         }
				}
			};
			timer.schedule(timerTask,1000,3000);
	       
	    }
	 
	 	/**
	     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
	     */
	    @Override
	    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	    }
	       
	    /**
	     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	     */
	    @Override
	    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	    	Map<String, Object> map = session.getAttributes();
	        MemberVO memberInfo = (MemberVO)map.get("LOGIN_MEMBERINFO");
	        String mem_id = memberInfo.getMem_id();
	        sessions.remove(mem_id);
	    	logger.info("{} 연결 끊김", session.getId());
	    }
	 
}
