<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<style type="text/css">
#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}

/* left: calc( 50% - 160px ); top: calc( 50% - 70px );  */
#my-dialog, #my-dialog2 {
    display: none;
    position: fixed;
    left: calc( 30% ); 
    width: 900px; height: 600px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}

.btn-lg{
	width:210px;
	height:80px;
	border-radius: 10px;
}    
</style>
<script type="text/javascript">
var dvr_sub;
var quiz_num = 0;
	$(function(){
		$("[data-toggle='popover']").popover();
		
		$('.testEx').click(function(){
			if(eval("${LOGIN_MEMBERINFO.mem_id}" == "" || "${LOGIN_MEMBERINFO.mem_id}" == null)){
				swal({
					  title: '로그인 요망',
					  text: "로그인이 필요한 서비스 입니다. 로그인 부탁드립니다.",
					  type: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'OK'
					}).then(function () {
						$("#sessionLogin").click();
					}).catch(swal.noop);
			} else {
				dvr_sub = $(this).text();
				$("#testExTit").html($(this).text());			
				$("#my-dialog,#que").show();
				return dvr_sub;
			}
		});			
		
		
		
		//'다음 문제' 클릭시
		$('#que, #next').click(function(){
			$("#my-dialog,#que").hide();
			$("#QueTit").html(testExTit);
			$("#my-dialog2").show();
			
			if(quiz_num <10){
				
			// 문제 상세보기
			$.ajax({
			url : "${pageContext.request.contextPath}/dvrTest/dvrTestQue.do",
			type : "post",
			data : { //data를 설정하는 방법2
				"dvr_sub" : dvr_sub,
				"quiz_num" : quiz_num
			},
			dataType : "json",
			success : function( test ){
				$("#QueCon").html( test.quizInfo );
				//보기 상세보기
				$.ajax({
					url : "${pageContext.request.contextPath}/dvrTest/dvrTestOpt.do",
					type : "post",
					data : { //data를 설정하는 방법2
// 						"dvr_sub" : dvr_sub,
						"quiz_num" : test.quizNum
					},
					dataType : "json",
					success : function( test ){
						
						var htmlCode ="<table width='80%' style='font-size: 20px; '>";
						
//						alert(test.quizOptInfo.length);					
						for(var i=0;i<test.quizOptInfo.length;i++){
							htmlCode += "<tr><td><input type='radio' name='answer' value='"+test.quizOptInfo[i].opt_con+"'>" + test.quizOptInfo[i].opt_con + "</td></tr>"
						}
						
						htmlCode += "</table>"		;					
						
						$("#OptCon").html( htmlCode );
					},
					error : function (jqXHR, textStatus, errorThrown){
// 						alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
					}
					
				});	
				
				quiz_num++;
			},
			error : function (jqXHR, textStatus, errorThrown){
// 				alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
			}
			
			});			
			
			//선택한 보기
			var answ = $("input[type=radio][name=answer]:checked").val();
// 			alert(answ);			
			
			var aa = quiz_num;
			// 선택한 보기 테이블에 입력
			$('#answerTb').append('<input type="hidden" name="answ['+(aa)+']" value="'+ answ +'"/>');
			


			
				//보기를 선택을 하지 않았을 경우
				if(answ === undefined) 
				{
// 				    alert('보기를 선택하지 않으셨습니다.');
				    
				    // 테이블에 'F'값을 append			    
				}
			
			
			
			}else{ //10번 문제가 끝나면
				
				//'다음'버튼 disabled
				$("#btnDiv1").hide();
			
				var answ = $("input[type=radio][name=answer]:checked").val();
// 				alert("문제풀이 끝!!" + answ);			
				
				var aa = quiz_num;
				// 선택한 보기 테이블에 입력
				$('#answerTb').append('<input type="hidden" name="answ['+(aa)+']" value="'+ answ +'"/>');
				
				
				//'완료'버튼 show
				$("#btnDiv2").show();	
				
				
				//'수고하셨습니다!!' 출력
			
			}
			
			return false;
		});
		
		//'answerTb' submit
		$('#finish').click(function(){
			
			var opt1 =  $('#answerTb input:eq(0)').val();
			var opt2 =  $('#answerTb input:eq(1)').val();
			var opt3 =  $('#answerTb input:eq(2)').val();
			var opt4 =  $('#answerTb input:eq(3)').val();
			var opt5 =  $('#answerTb input:eq(4)').val();
			var opt6 =  $('#answerTb input:eq(5)').val();
			var opt7 =  $('#answerTb input:eq(6)').val();
			var opt8 =  $('#answerTb input:eq(7)').val();
			var opt9 =  $('#answerTb input:eq(8)').val();
			var opt10 =  $('#answerTb input:eq(9)').val();

//			alert($("#answerTb").attr("action"));
// 			$("form[name='answerTb']").submit();
// 			$('#answerTb').submit();
			$.ajax({
				url : "${pageContext.request.contextPath}/dvrTest/insertAnswer.do",
				type : "post",
				data : { 
					"answ1" : opt1,
					"answ2" : opt2,
					"answ3" : opt3,
					"answ4" : opt4,
					"answ5" : opt5,
					"answ6" : opt6,
					"answ7" : opt7,
					"answ8" : opt8,
					"answ9" : opt9,
					"answ10" : opt10,
					"dvr_sub" : dvr_sub
				},
				dataType : "json",
				success : function( test ){
					alert('success');
				},
				error : function (jqXHR, textStatus, errorThrown){
//					alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
				}
				
				});
		});
		
		
		//창닫기 클릭시
		$('#btn-close-dialog,#btn-close-dialog2').click(function(){
			$("#my-dialog,#my-dialog2,#que").hide();
		});

	});
</script>
</head>
<body>
		<div class="container">
		</div>
	
	 <!-- -------------------------개발자 테스트 시작 -------------------------------------- -->
	      <div class="container">
	      	<div>
	      		<div class="left-wrap pull-left" >
<!--                 <h4>내 테스트 현황</h4> -->
<!--                 	<div>			 -->
<%-- 						<c:forTokens items="${memberInfo.mem_tig_nm }" delims="," var="item"> --%>
<%-- 							<c:forTokens items="${item }" delims="_" var="title"> --%>
<%-- 								<c:if test="${title eq 'CSS' || title eq 'HTML' || title eq 'JSP' || title eq 'JavaScript' || title eq 'OS' || title eq 'SQL' || title eq 'JAVA' }" var="subject2"> --%>
<%-- 									<c:set value="${title }" var="subject" /> --%>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${title eq 'H' || title eq 'M' || title eq 'B' }" var="grade2"> --%>
<%-- 									<c:set value="${title }" var="grade" /> --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${grade eq 'H' }"> --%>
<%-- 											<c:set value="고급" var="high" /> --%>
<%-- 											<c:set value="80%" var="Hrate" /> --%>
<%-- 											<a href="#"  data-trigger="hover" data-toggle="popover" title="${subject }  ${high } " data-content="${subject } 문제의 정답률 ${Hrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- 										</c:when> --%>
<%-- 										<c:when test="${grade eq 'M' }"> --%>
<%-- 											<c:set value="중급" var="mid" /> --%>
<%-- 											<c:set value="50%" var="Mrate" /> --%>
<%-- 											<a href="#"  data-trigger="hover" data-toggle="popover" title="${subject }  ${mid } " data-content="${subject } 문제의 정답률 ${Mrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- 										</c:when> --%>
<%-- 										<c:when test="${grade eq 'B' }"> --%>
<%-- 											<c:set value="초급" var="basic" /> --%>
<%-- 											<c:set value="30%" var="Brate" /> --%>
<%-- 											<a href="#"  data-trigger="hover" data-toggle="popover" title="${subject }  ${basic } " data-content="${subject } 문제의 정답률 ${Brate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- 										</c:when> --%>
<%-- 									</c:choose> --%>
<%-- 								</c:if> --%>
<%-- 							</c:forTokens> --%>
<%-- 						</c:forTokens> --%>
<!-- 					</div> -->
				</div>
			</div>
				<hr>
				<h2>테스트할 기술들을 클릭해주세요</h2>
                <ul class="tag-cloud unstyled">
                	<div>
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="java">JAVA</button></li>                						
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="jsp">JSP</button></li>                						
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="htm">HTML</button></li>                						
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="css">CSS</button></li>                						
                	</div>
					<div>
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="sql">SQL</button></li>                						
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="javascript">JavaScript</button></li>                						
                	<li><button class="btn btn-info btn-lg testEx" style="font-size: 25px" id="os">OS</button></li>                						
					</div>										
            </div> 
				    
	      <!-- -------------------------개발자 테스트 끝 -------------------------------------- -->
	    

	<!------------------------- 문제풀이 첫화면 시작 ---------------------------->
	<div id="my-dialog" class="modal hide fade in " aria-hidden="false">
    	<div class="modal-header" style="background:#2dcc70;">
        <div><h3 style="height:50px; color:white;">창내용</h3></div>
    </div>
    	<div class="modal-body">
        <form class="form-inline" action="#" method="post" name="modalForm" id="form-modal">
            <div>
            <h2 id="testExTit" style="color: green; text-align: center"></h2>
		<h4 style="text-align: center">시험을 치르기에 앞서 꼭 읽어주세요.</h4><br>
		<h4> 1. 모든 문제는 객관식 입니다. </h4>
		<h4> 2. 모든 문제는 단수 정답입니다. </h4>
		<h4> 3. 한 문제당 제한되는 풀이 시간은 60초 입니다.</h4>
		<h4> 4. 문제를 풀고 나서 다음 문제로 넘어갔을 경우 이전 문제로 되돌아 갈 수 없습니다.</h4>
		<h4> 5. 합격은 60%이상의 정답률 획득시에 주어지며, 점수 역시 퍼센테이지(%)로 표시됩니다.</h4>
		<h4> 6. 한번 응시한 시험의 경우 0일 이후에 재 응시가 가능합니다.</h4>
		<h4> 7. 문제를 다 푼 후에 문제의 답은 공개하지 않으며 맞은 문항수와 틀린 문항수 만을 알려드립니다.</h4><br>
            </div>            
            <center><button id="que" class="btn btn-success" style="width: 150; height: 100" >문제풀기</button></center>
        </form>
        
        <div id="naver_id_login"> </div>
        <hr>        

    </div>
    	<button id="btn-close-dialog">창 닫기</button>
	</div>
	<div id="dialog-background"></div>
	
	<!----------------------------------- 문제풀이 첫화면 끝 ------------------------------->   
	
	
	
	<!----------------------------------- 문제풀이 모달 시작 ------------------------>
		<div id="my-dialog2" class="modal hide fade in " aria-hidden="false">
    	<div class="modal-header" style="background:#2dcc70;">
        <div><h3 style="height:50px; color:white;">창내용</h3></div>
    </div>
    	<div class="modal-body">
        <form class="form-inline" action="#" method="post" name="modalForm2" id="form-modal2">
            <div>
            <h2 id="QueTit" style="color: green; text-align: center"></h2>
            
            <div id="QueCon">
            	<input type="hidden" value=""  name="quiz_num">   
            </div>
            
            <br>
            <div id="OptCon">
                        
            </div>     
            
            </div>
            
            <div id="btnDiv1">            
            <center><button id="next" class="btn btn-success" style="width: 150; height: 100" href="#">다음문제</button></center>
            </div>
            <div id="btnDiv2" style="display: none">
            <center><button id="finish" class="btn btn-success" style="width: 150; height: 100" onClick="reloadFunction()" >완료</button></center>
            </div>
        </form>
        
        <form id="answerTb" name="answerTb" action="${pageContext.request.contextPath}/dvrTest/insertAnswer.do" method="post">       	
        	
        </form>
        
        <div id="naver_id_login"> </div>
        <hr>              

    </div>
    	<button id="btn-close-dialog2">창 닫기</button>
	</div>
	<div id="dialog-background2"></div>
	
	<!------------------------------------- 문제풀이 모달 끝 -------------------------------->
	
</div>	
</body>
</html>