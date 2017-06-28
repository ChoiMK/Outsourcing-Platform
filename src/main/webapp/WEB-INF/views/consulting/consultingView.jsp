<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.chat_area {
  float: left;
  height: 300px;
  overflow-x: hidden;
  overflow-y: auto;
  width: 100%;
}
.chat-body1 p {
  padding: 10px;
}
#messageForm{
    border-radius: 10px;
	width:90%;
	height:70px;
}
ul{
   list-style:none;
}
.chat{
 border : 1px solid #2dcc70;
 border-radius: 10px;
}
#messageSend{
    width: 25%;
    height: 50px;
    border-radius: 10px;
    margin-bottom: 10px
}
</style>

</head>
<body>
<c:if test="${LOGIN_MEMBERINFO.mem_id ne 'admin'}">
		<div class="container chat">
			<div class="chat_area">
				<ul class="list-unstyled">

				</ul>
			</div>
			<div class="message_write">
				<center><input type="text" id="messageForm"  style="font-size:20pt;"  value=""></center>
				<center><button type="button" class="btn btn-success " id="messageSend">전송</button></center>
			</div>
		</div>
</c:if>		
<script type="text/javascript">
var roomArray = new Array();

$(function(){
	
	var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
	//websocket을 지정한 URL로 연결
	var sock= new SockJS("${pageContext.request.contextPath}/ws/echo");
	
	//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
	sock.onmessage = onMessage;
	//websocket 과 연결을 끊고 싶을때 실행하는 메소드
	sock.onclose = onClose;
	
	
	function sendMessage(){
	    //websocket으로 메시지를 보내겠다.
		sock.send(mem_id+" : "+$('#messageForm').val());
	    //채팅폼 클리어
	    $("#messageForm").val("");
	}
	  
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){  //변수 안에 function자체를 넣음.
		var dataContent = evt.data;
		var message = dataContent.split("-");
		var flag = true;
		
		for(var i=0; i<roomArray.length; i++){
			if(roomArray[i] == message[0]){
				flag = false;
			}
		}
		if(flag){
			roomArray.push(message[0]);	
			if(mem_id=='admin'){
			window.open("${pageContext.request.contextPath}/adminAddchatting.do?roomNum="+message[0]+"&message="+message[1], "채팅 문의"+message[0], "width=360, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
			}
		}
		
		$(".list-unstyled").append("<li><div class='chat-body1'><p><font size=5>"+message[1]+"</font></p></div></li>");
		$(".chat_area").scrollTop($(".chat_area")[0].scrollHeight);
	}
	function onClose(evt){
		$(".list-unstyled").append("<font size=5>연결 끊김</font>");
		}
	
	$("#messageSend").click(function(){
	    sendMessage();
	});	
	
	 $("#messageForm").keydown(function (key) {
         if (key.keyCode == 13) {
            $("#messageSend").click();
         }
      });
	
});


</script>
		
		
</body>
</html>