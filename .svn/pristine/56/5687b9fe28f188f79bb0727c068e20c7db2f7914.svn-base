<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/main.css">
<title>관리자</title>
<style>
.chat_area {
  float: left;
  height: 350px;
  overflow-x: hidden;
  overflow-y: auto;
  width: 100%;
}
.chat-body1 p {
  padding: 10px;
}
#messageForm{
    border-radius: 10px;
	width:85%;
	height:60px;
}
ul{
   list-style:none;
}
.chat{
 border : 1px solid #2dcc70;
 border-radius: 10px;
}
#messageSend{
    width: 20%;
    height: 50px;
    border-radius: 10px;
    margin-bottom: 10px
}

</style>
</head>
<body style="padding-top: 30px">
		<div class="container chat">

			<div class="chat_area">
				<ul class="list-unstyled">
					<li><div class='chat-body1'><p><font size="4"><strong>${message}</strong></font></p></div></li>
				</ul>
			</div>
			<div class="message_write">
				<center><input type="text" id="messageForm" style="font-size:15pt;"></center>
				<center><button type="button" class="btn btn-success " id="messageSend">전송</button>
				<input type="hidden" name="roomNum" value="${roomNum}"></center>
			</div>
		</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
<script type="text/javascript">

$(function(){
	var sock= new SockJS("${pageContext.request.contextPath}/ws/echo");
	//websocket을 지정한 URL로 연결
	
	//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
	sock.onmessage = onMessage;
	//websocket 과 연결을 끊고 싶을때 실행하는 메소드
	sock.onclose = onClose;
	
	function sendMessage(){
	    //websocket으로 메시지를 보내겠다.
	    sock.send("관리자 : "+$('#messageForm').val());
	    $("#messageForm").val("");
	}
	  
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){
		var roomList = '${roomSession.roomList}';
		var dataContent = evt.data;
		var message = dataContent.split("-");
		var flag = true;
		var roomCut = roomList.slice(1,-1);
		var	roomListArray = roomCut.split(",");
		roomListArray.forEach( function(v,i){
			if(v.trim()==message[0].trim()){
				flag = false;
			}
		});
		
		if(flag){
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/adminAddchattingList.do",
					dataType:"json",
					data:{roomList : message[0]},
					success:function(result){
						}
					});
			window.open("${pageContext.request.contextPath}/adminAddchatting.do?roomNum="+message[0]+"&message="+message[1], "채팅 문의"+message[0], "width=360, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
			return false;
		}
		
		$(".list-unstyled").append("<li><div class='chat-body1'><p><strong><font size=4>"+message[1]+"</font></p></strong></div></li>");
		$(".chat_area").scrollTop($(".chat_area")[0].scrollHeight);
	}
	
	function onClose(evt){
	$(".list-unstyled").append("<strong><font size=4>연결 끊김</font></strong>");
	}
	
	$("#messageSend").click(function(){
		var roomNum = $(this).siblings("input[name=roomNum]").val();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/roomNum.do",
			dataType:"json",
			data : {adminRoomNum:roomNum},
			success:function(){
				}
			});
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