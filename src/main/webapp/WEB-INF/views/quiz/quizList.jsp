<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 리스트</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$('#td').DataTable();
		});
		// 테이블을 tr을 클릭했을 시 로그인했으면 View로 넘어가고 아니면 로그인확인 
		$('.newTr').click(function(){
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
				var quiz_num = $("td input[type=hidden]",this).val();
				$(location).attr('href', '${pageContext.request.contextPath}/quiz/quizView.do?quiz_num=' + quiz_num );
			}
		});
	});
</script>

</head>
<body>

	<div style="text-align: center; margin-left: 950px;">
		<table>
			<tr>
				<td>
					<a id="quizAll" href="http://192.168.201.222/plzdvl/quiz/quizList.do" style="margin-right: 20px;"><h4 style="display: inline-block;">전체</h4></a>
				</td>
				<td>
					<a id="quizOS" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=1" style="margin-right: 20px;"><h4 style="display: inline-block;">운영체제</h4></a>
				</td>
				<td>
					<a id="quizHTML" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=4" style="margin-right: 20px;"><h4 style="display: inline-block;">HTML</h4></a>
				</td>
				<td>
					<a id="quizJavaScript" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=2" style="margin-right: 20px;"><h4 style="display: inline-block;">JavaScript</h4></a>
				</td>
				<td>
					<a id="quizJSP" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=7" style="margin-right: 20px;"><h4 style="display: inline-block;">JSP</h4></a>
				</td>
				<td>
					<a id="quizSQL" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=3" style="margin-right: 20px;"><h4 style="display: inline-block;">SQL</h4></a>
				</td>
				<td>
					<a id="quizJAVA" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=6" style="margin-right: 20px;"><h4 style="display: inline-block;">JAVA</h4></a>
				</td>
				<td>
					<a id="quizCSS" href="http://192.168.201.222/plzdvl/quiz/quizList.do?sub_num=5" style="margin-right: 20px;"><h4 style="display: inline-block;">CSS</h4></a>
				</td>
		</table>
	</div>
<!--   ---------------------------------문제 테이블 리스트 시작----------------------------    -->
		<div id="freeboardList_content" class="container">
			<div class="panel panel-blue">
				<table id="td" class="table table-bordered table-hover" style="background-color: #e1f3f7">
					<thead>
						<tr>
							<th scope="col" width="5%">과목</th>
							<th scope="col" width="65%">문제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${quizList }" var="quizList">
							<tr class='newTr'>		
								<td>
									<input type="hidden" value="${quizList.quiz_num }">					
									${quizList.sub_num }
								</td>
								<td>${fn:substring(quizList.quiz_con,0,30)}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" id='insertBtn' class="btn btn-info form-control pull-right" onclick = "location.href = '${pageContext.request.contextPath}/quiz/quizForm.do' ">문제등록</button>
			</div>
		</div>	
<!-- -----------------------문제 테이블 끝-------------------------------- -->
</body>
</html>