<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$("[data-toggle='popover']").popover();
		

	});
</script>
</head>
<body>



<div class="container">
	<h3> 나의 타이틀 </h3> <br>
		<div>			
			<c:forTokens items="${memberInfo.mem_tig_nm }" delims="," var="item">
				<c:forTokens items="${item }" delims="_" var="title">
					<c:if test="${title eq 'CSS' || title eq 'HTML' || title eq 'JSP' || title eq 'JavaScript' || title eq 'OS' || title eq 'SQL' || title eq 'JAVA' }" var="subject2">
						<c:set value="${title }" var="subject" />
					</c:if>
					<c:if test="${title eq 'H' || title eq 'M' || title eq 'B' }" var="grade2">
						<c:set value="${title }" var="grade" />
						<c:choose>
							<c:when test="${grade eq 'H' }">
								<c:set value="고급" var="high" />
								<c:set value="80%" var="Hrate" />
								<a href="#"  data-trigger="hover" data-toggle="popover" title="${subject }  ${high } " data-content="${subject } 문제의 정답률 ${Hrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:when>
							<c:when test="${grade eq 'M' }">
								<c:set value="중급" var="mid" />
								<c:set value="50%" var="Mrate" />
								<a href="#"  data-trigger="hover" data-toggle="popover" title="${subject }  ${mid } " data-content="${subject } 문제의 정답률 ${Mrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:when>
							<c:when test="${grade eq 'B' }">
								<c:set value="초급" var="basic" />
								<c:set value="30%" var="Brate" />
								<a href="#"  data-trigger="hover" data-toggle="popover" title="${subject }  ${basic } " data-content="${subject } 문제의 정답률 ${Brate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:when>
						</c:choose>
					</c:if>
				</c:forTokens>
			</c:forTokens>
		</div>
	<hr>
	<h3> 타이틀 목록 </h3> <br>
		<div>
			<a href="#"  data-trigger="hover" data-toggle="popover" title="CSS 고급 " data-content="CSS문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/CSS_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="CSS 중급 " data-content="CSS문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/CSS_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="CSS 초급 " data-content="CSS문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/CSS_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="HTML 고급 " data-content="HTML문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/HTML_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="HTML 중급 " data-content="HTML문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/HTML_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="HTML 초급 " data-content="HTML문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/HTML_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="운영체제 고급 " data-content="운영체제문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/OS_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="운영체제 중급 " data-content="운영체제문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/OS_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="운영체제 초급 " data-content="운영체제문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/OS_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JSP 고급 " data-content="JSP문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JSP_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JSP 중급 " data-content="JSP문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JSP_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JSP 초급 " data-content="JSP문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JSP_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JavaScript 고급 " data-content="JavaScript문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JavaScript_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JavaScript 중급 " data-content="JavaScript문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JavaScript_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JavaScript 초급 " data-content="JavaScript문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JavaScript_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="SQL 고급 " data-content="SQL 문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/SQL_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="SQL 중급 " data-content="SQL 문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/SQL_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="SQL 초급 " data-content="SQL 문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/SQL_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JAVA 고급 " data-content="JAVA 문제의 정답률 80% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JAVA_H.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JAVA 중급 " data-content="JAVA 문제의 정답률 50% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JAVA_M.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#"  data-trigger="hover" data-toggle="popover" title="JAVA 초급 " data-content="JAVA 문제의 정답률 30% 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JAVA_B.png" style="width:75px; heigth:75px" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
</div>
</body>
</html>