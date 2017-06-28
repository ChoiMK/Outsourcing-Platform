<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>PlzDvl</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
<title>Insert title here</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sl-slide.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/sl-slide.css">
	<!-- dataTable -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datatable/dataTables.bootstrap.min.css">
    <!-- summernote -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote.css" >
    <!-- sweetalert2 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert2/sweetalert2.min.css" >
	<!-- datepicker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/datepicker/css/bootstrap-datepicker.css" >
	<!-- bootstrap-slider -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-slider/css/bootstrap-slider.css" >
	<!-- movetext -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wordsrotator-master/jquery.wordrotator.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wordsrotator-master/jquery.wordrotator.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/wordsrotator-master/animate.css">
	<!-- fullcalendar -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.css">
	<!-- star.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/star.css">
	
	
	
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
     <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/bootstrap/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/resources/bootstrap/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/resources/bootstrap/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/resources/bootstrap/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/resources/bootstrap/images/ico/apple-touch-icon-57-precomposed.png">
<style>
hr{
	border: 0;
    height: 1px;
    background: #333;
    background-image: linear-gradient(to right, #ccc, #5bb75b, #ccc);
    margin: 20px 0;
}

.mem_type:hover, .mem_coms:hover{
	background-color:#5bb75b;
}


</style>
</head>
<body>
 <!--Header-->
    <header class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a id="logo" class="pull-left" href="${pageContext.request.contextPath}/main.do"></a>
                <div class="nav-collapse collapse pull-right">
                    <ul class="nav">
                        <li><a href="${pageContext.request.contextPath}/project/projectList.do">프로젝트</a></li>
                        <li><a href="${pageContext.request.contextPath}/freelancer/freelancerList.do">프리랜서</a></li>
                        <li><a href="${pageContext.request.contextPath}/project/projectForm.do">프로젝트등록</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/adminDvrTest/adminDvrTestList.do">개발Tip 문제 등록</a></li> 
                        <li><a href="${pageContext.request.contextPath}/notice/noticeList.do">고객센터</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">성진 <i class="icon-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="career.html">Career</a></li>
                                <li><a href="blog-item.html">Blog Single</a></li>
                                <li><a href="faq.html">FAQ</a></li>
                                <li><a href="pricing.html">Pricing</a></li>
                                <li><a href="404.html">404</a></li>
                                <li><a href="typography.html">Typography</a></li>
                                <li><a href="registration.html">Registration</a></li>
                                <li class="divider"></li>
                                <li><a href="privacy.html">Privacy Policy</a></li>
                                <li><a href="terms.html">Terms of Use</a></li>
                            </ul>
                        </li>
                        
                        <c:if test="${!empty LOGIN_MEMBERINFO}">
                        	<li class="dropdown"style="padding-left:50px;">
								<a data-hover="dropdown" href="#" class="dropdown-toggle">
								<i class="icon-bell"></i>
								</a>
							</li>
                        	<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-left:0px;"> 
									<span class="hidden-xs">${LOGIN_MEMBERINFO.mem_nm}</span>
									<i class="icon-angle-down"></i>
								</a>
							
							<ul class="dropdown-menu">
								<li><a id="profile" href="${pageContext.request.contextPath}/baseMng.do">마이페이지</a></li>
								<li><a href="${pageContext.request.contextPath}/join/logout.do">로그아웃</a></li>
							</ul>
						  </li>
						  
                        </c:if>
                         
                        <c:if test="${empty LOGIN_MEMBERINFO}">
	                        <li class="login">
	                            <a data-toggle="modal" href="#loginForm"><i class=" icon-lock "></i></a>
	                        </li>
                        </c:if>
                    </ul>        
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </header>
    <!-- /header -->
  
  <!-- 로그인 -->  
<div class="modal hide fade in " id="loginForm"  aria-hidden="false">
    <div class="modal-header" style="background:#2dcc70;">
        <i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
        <div><h3 style="height:50px; color:white;">로그인</h3></div>
    </div>
    <div class="modal-body">
        <form class="form-inline" action="${pageContext.request.contextPath}/join/loginCheck.do" method="post" name="loginForm" id="form-login">
            <h5>아이디/비밀번호를 입력하세요</h5><br/>
            <input type="text" class="input-small" name="mem_id" id="mem_id" placeholder="아이디">
            <input type="password" class="input-small" name="mem_pass" id="mem_pass" placeholder="패스워드">
            <label class="checkbox">
                <input type="checkbox" id="rememberid"> 아이디 저장
            </label>
            <button type="submit" class="btn btn-success">로그인</button>
        </form>
        <hr>
        <h5>네이버 계정으로 로그인하기</h5><br/>
        <div id="naver_id_login"> </div>
        <hr>
        
        <a class="join" data-toggle="modal" href="#joinForm"><span style="font-size:15px;">회원가입</span></a>&nbsp;</span>
       	<a class="pwsel" href="#idSelect" data-toggle="modal"><span style="font-size:15px;">비밀번호 찾기</span></a>&nbsp;
       	<a class="idsel" href="#idSelect" data-toggle="modal"><span style="font-size:15px;">아이디 찾기</span></a>
    </div>
</div>
	<!-- 회원가입 -->
	<div class="modal hide fade in" id="joinForm" aria-hidden="false">
		<div class="modal-header"style="background:#2dcc70;">
			<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
			<div><h3 style="height:50px; color:white;">회원가입</h3></div>
		</div>
		<div class="modal-body">
			<form action='${pageContext.request.contextPath}/member/insertMemberInfo.do' name="joinForm" method="POST">
				
				<div class="form-group">
						<label for="user_id" class="control-label"><h4>아이디</h4></label>
						<input type="text" style="width:170px;" id="mem_id" name="mem_id" placeholder="아이디">
				</div>

				<div class="form-group">
						<label for="password" class="control-label"><h4>비밀번호</h4></label>
						<input type="password" style="width:170px;" id="mem_pw" name="mem_pw" placeholder="비밀번호">
				</div>

				<div class="form-group">
						<label for="password_confirm" class="control-label"><h4>비밀번호 확인</h4></label>
						<input type="password" style="width:170px;" id="mem_pw_confirm" name="mem_pw_confirm" placeholder="비밀번호 확인">
						<font name="check" size="2" color="red"></font> 
				</div>

				<div class="form-group">
						<label for="username" class="control-label"><h4>이름</h4></label>
						<input type="text" style="width:170px;" id="mem_nm" name="mem_nm" placeholder="이름">
				</div>

				<div class="form-group">
						<label for="email" class="control-label"><h4>E-mail</h4></label>
						<input type="text" style="width:170px;" id="mem_mail" name="mem_mail" placeholder="E-mail">
				</div>
				
				<div class="form-group">
						<label for="phone" class="control-label"><h4>전화번호</h4></label>
						<input type="text" style="width:170px;" id="mem_tel" name="mem_tel" placeholder="전화번호">
				</div>
				
				<div class="control-group">
					<div class="controls">
					     <p><h4>이용목적</h4></p>
						<button type="button" id="client" class="btn btn-info btn-lg mem_type" name="mem_type" value="C">클라이언트</button>
						<button type="button" id="freelancer"class="btn btn-info btn-lg mem_type" name="mem_type" value="F">프리랜서</button>
					</div>
				</div>
				
				<div class="control-group">
					<div class="controls" id="clfr">
						
					</div>
				</div>

				 <div class="modal-footer">
						<button type="reset" class="btn btn-success btn-lg pull-right " style="width:80px;height:40px;">취소</button>
						<button type="submit" class="btn btn-success btn-lg pull-right" style="width: 80px;height:40px;">회원등록</button>
				 </div>
			</form>
		</div>
	</div>
	
	
	<!-- 아이디 비번 찾기 -->
	<div class="modal hide fade in" id="idSelect" aria-hidden="false">
		<div class="modal-header"style="background:#2dcc70;">
			<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
			<div><h3 id="findMember" style="height:50px; color:white;"></h3></div>
		</div>
		<div class="modal-body">
			<form action='${pageContext.request.contextPath}/join/idSelect.do' name="idSelectForm" method="POST">
				
				<div class="form-group" id="memberID">
						<label for="user_id" class="control-label"><h4>아이디</h4></label>
						<input type="text" style="width:170px;" id="mem_id" name="mem_id" placeholder="아이디">
				</div>
				
				<div class="form-group" id="memberNM">
						<label for="user_nm" class="control-label"><h4>이름</h4></label>
						<input type="text" style="width:170px;" id="mem_nm" name="mem_nm" placeholder="이 름">
				</div>

				<div class="form-group" id="memberMail">
						<label for="email" class="control-label"><h4>E-mail</h4></label>
						<input type="text" style="width:170px;" id="mem_mail" name="mem_mail" placeholder="E-mail">
				</div>
				
				 <div class="modal-footer" >
						<button type="reset" class="btn btn-success btn-lg pull-right" style="width:80px;height:40px;">취소</button>
						<button type="submit" class="btn btn-success btn-lg pull-right" style="width: 80px;height:40px;">완료</button>
				 </div>
			</form>
		</div>
	</div>



<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/main.js"></script>
<!-- Required javascript files for Slider -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.ba-cond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.slitslider.js"></script>
<!-- dataTable -->
<script src="${pageContext.request.contextPath}/resources/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/datatable/dataTables.bootstrap.min.js"></script>
<!-- summernote -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote.js"></script>
<!-- naver -->
<script src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js"></script>
<!-- sweetalert2 -->
<script src="${pageContext.request.contextPath}/resources/sweetalert2/sweetalert2.min.js"></script>
<!-- datepicker -->
<script src="${pageContext.request.contextPath}/resources/datepicker/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/datepicker/locales/bootstrap-datepicker.kr.min.js"></script>
<!-- bootstrap-slider -->
<script src="${pageContext.request.contextPath}/resources/bootstrap-slider/bootstrap-slider.js"></script>
<!-- move text -->
<script src="${pageContext.request.contextPath}/resources/wordsrotator-master/jquery.wordrotator.js"></script>
<!-- alert -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/alert.js"></script>
<!-- jquery.form.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<!-- fullcalendar -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fullcalendar/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fullcalendar/ko.js"></script>
<!-- jquery.cookie.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js"></script>
<!-- star.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/star.js"></script>

<script type="text/javascript">
if (eval('${!empty param.messageCon}')) {
	swal(
			  '${param.messageTit}',
			  '${param.messageCon}',
			  '${param.messageType}'
			);
}
	var naver_id_login = new naver_id_login("RNGerTbZNU0UbMRphrsn",
			"http://127.0.0.1/plzdvl/join/naver/callback.do");
	var state = naver_id_login.getUniqState();
	naver_id_login
			.setDomain("http://127.0.0.1/plzdvl/join/naver/header.do");
	naver_id_login.init_naver_id_login();
	
	var mem_id = $.cookie('mem_id');
	if(mem_id != undefined) {
        //아이디에 쿠키값을 담는다
        $("#mem_id").val(mem_id);
        //아이디저장 체크박스 체크를 해놓는다
        $("#rememberid").prop("checked",true);
    }
	
	if (eval("${param.backup == 'idback'}")) {
		$('#idSelect').modal();
		$("#memberID").css('display','none');
		$("#findMember").text("아이디 찾기");
	}else if (eval("${param.backup == 'pwback'}")) {
		$('#idSelect').modal();
		$("#memberNM").css('display','none');
		$("#findMember").text("비밀번호 찾기");
	}else if (eval("${param.backup == 'login'}")) {
		$('#loginForm').modal();
	}
	
	$(function() {
		
		$(".idsel").on('click', function() {
			$('#loginForm').modal('hide');
			$("#memberID").css('display','none');
			$("#memberNM").css('display','block');
			$("#memberMail").css('display','block');
			$("#findMember").text("아이디 찾기");
			
		});
		
		$(".pwsel").on('click', function() {
			$('#loginForm').modal('hide');
			$("#memberID").css('display','block');
			$("#memberNM").css('display','none');
			$("#memberMail").css('display','block');
			$("#findMember").text("비밀번호 찾기");
			
		});

$('form[name=idSelectForm]').submit(function() {
		swal({
			  title: '이메일 전송중...',
			  text: '잠시만 기다려 주세요.',
			  timer: 10000
			})
	});

		$(".join").on('click', function() {
			$('#loginForm').modal('hide');
		});

	var mem_type = "";
	$(".mem_type").click(function(){
		mem_type = $(this).val();
		if(mem_type == "C"){
			alert(mem_type);
			$("#client").attr("class", "btn btn-success btn-lg");
			$("#freelancer").attr("class", "btn btn-info btn-lg");
			$('button[name=mem_coms]').remove();
		}else{
			alert(mem_type);
			$("#freelancer").attr("class","btn btn-success btn-lg");
			$("#client").attr("class", "btn btn-info btn-lg");
			var btn = "<button type='button' id='personal' class='btn btn-info btn-lg mem_coms' name='mem_coms' value='C'>개인</button>";
			btn += "<button type='button' id='team' class='btn btn-info btn-lg mem_coms' name='mem_coms' value='T'>팀</button>";
			$("#clfr").html(btn);
		}
	});	
	
	var mem_coms = "";
	$(document).on('click','button[name=mem_coms]',function(){
		mem_coms = $(this).val();
		alert(mem_coms);
		if(mem_coms == "C"){
			 $("#personal").attr("class", "btn btn-success btn-lg");
	         $("#team").attr("class", "btn btn-info btn-lg");
		}else{
			 $("#team").attr("class", "btn btn-success btn-lg");
	         $("#personal").attr("class", "btn btn-info btn-lg");
		}
	});
		
		
	$('form[name=joinForm]').submit(function() {
			$(this).append('<input type="hidden" name="mem_type" value="'+mem_type+'"/>');
			$(this).append('<input type="hidden" name="mem_coms" value="'+mem_coms+'"/>');
	});
		
		
		
		$('#mem_pw').keyup(function() {
			$('font[name=check]').text('');
		});
		$('#mem_pw_confirm').keyup(function() {
			if ($('#mem_pw').val() != $('#mem_pw_confirm').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("비밀번호를 다시 확인하시기 바랍니다.");
			} else {
				$('font[name=check]').text('');
			}
		});

		$('form[name=loginForm]').submit(function() {
					if ($('input[name=mem_id]').val() == '') {
						tryId();
						return false;
					}else{
						//아이디저장 체크되어있으면 쿠키저장
			            if($("#rememberid").prop("checked")) {
			                $.cookie('mem_id', $("#mem_id").val());
			            //아이디저장 미체크면 쿠키에 정보가 있던간에 삭제
			            } else {
			                $.removeCookie("mem_id");
			            }
					}
					if ($('input[name=mem_pass]').val() == '') {
						tryPass();
						return false;
					}
				});

		$('#naever_login')
				.click(
						function() {
							$(location)
									.attr(
											'href',
											'https://nid.naver.com/nidlogin.login?oauth_token=GgdNbUvr9RCAc4A3&consumer_key=RNGerTbZNU0UbMRphrsn&logintp=oauth2&url=https%3A%2F%2Fnid.naver.com%2Foauth2.0%2Fauthorize%3Fresponse_type%3Dtoken%26oauth_token%3DGgdNbUvr9RCAc4A3%26state%3D920c2b5f-0d6b-45d1-ac4d-ebda6d6e10e6%26client_id%3DRNGerTbZNU0UbMRphrsn%26redirect_uri%3Dhttp%253A%252F%252F192.168.201.9%252Fplzdvl%252Fjoin%252Fnaver%252Fcallback.do%26locale%3D%26inapp_view%3D%26oauth_os%3D%28null%29&locale=&inapp_view=');
						});

	});
</script>
</body>
</html>