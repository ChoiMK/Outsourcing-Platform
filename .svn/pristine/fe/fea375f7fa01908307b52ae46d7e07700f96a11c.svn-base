<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.4.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/naverLogin_implicit-1.0.3.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("RNGerTbZNU0UbMRphrsn", "http://192.168.201.222/plzdvl/join/naver/callback.do");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   $("input[name=mem_id]").val(naver_id_login.getProfileData('email'));
   $("input[name=mem_mail]").val(naver_id_login.getProfileData('email'));
   $("input[name=mem_nm]").val(naver_id_login.getProfileData('name'));
   
   $('#memberform').submit();
   }
</script>
<form id="memberform" action="${pageContext.request.contextPath}/member/naverinsertMember.do" method="get">
<input type="hidden" name ="mem_id"><br>
<input type="hidden" name ="mem_nm"><br>
<input type="hidden" name ="mem_mail"><br>
</form>
</body>
</html>
