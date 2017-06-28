package kr.or.plzdvl.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.plzdvl.member.vo.MemberVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
@Component
public class EchoHandler extends TextWebSocketHandler{
    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    // 방번호 채팅인원
    private static Map<Integer, List<WebSocketSession>> chatSession = new HashMap<Integer, List<WebSocketSession>>();
    // 관리자 세션
    private static WebSocketSession adminSession;
    // 유저 세션
    private static WebSocketSession memberSession;
    
   /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
       //채팅안의 리스트를 저장할 변수
       List<WebSocketSession> socketList = new ArrayList<WebSocketSession>(); 
       Map<String, Object> map = session.getAttributes();
       MemberVO memberInfo = (MemberVO)map.get("LOGIN_MEMBERINFO");
       
       int roomNum = (int)map.get("roomNum");
       String admin = "admin";
       if(admin.equals(memberInfo.getMem_id().trim())){
    	   adminSession = session;
       }else{
    	   memberSession = session;
       }
       		socketList.clear();
       		socketList.add(adminSession);
       		socketList.add(memberSession);
          chatSession.put(roomNum, socketList);
          
        logger.info("{}방에  {} 연결됨", roomNum, session.getId());
    }
    /**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
       //채팅안의 리스트를 저장할 변수
       List<WebSocketSession> socketList = new ArrayList<WebSocketSession>(); 
       Map<String, Object> map = session.getAttributes();
       int roomNum = (int)map.get("roomNum");  
       
       logger.info("{}방에서 {}로 부터 {} 받음", roomNum, session.getId(), message.getPayload());
       
       // 해당 방번호값에 인원들 리스트불러오기
       socketList = chatSession.get(roomNum);
       for( WebSocketSession sessions : socketList){
          sessions.sendMessage(new TextMessage(roomNum+"-"+message.getPayload()));
          
       }
       
        
    }
    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
       List<WebSocketSession> socketList = new ArrayList<WebSocketSession>();
       Map<String, Object> map = session.getAttributes();
       int roomNum = (int)map.get("roomNum");
       socketList = chatSession.get(roomNum);
       socketList.remove(session);
        logger.info("{} 연결 끊김", session.getId());
    }
    
    
}

