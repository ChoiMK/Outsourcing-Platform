<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<style>
.dataTables_info{
   display:none;
}
</style>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$('#td').DataTable();
		});
		
		$('.newTr').click(function(){
			var re_num = $("td:eq(0)",this).text();
//			var re_num = $("td:eq(0)",this).find('input').val();
//			alert(re_num);
		$(location).attr('href', '${pageContext.request.contextPath}/freelancer/freelancerView.do?mem_id=' + mem_id );
		});
		
		
	});
</script>

</head>
<body>
<div class="center container"  >
	<div align="right">
		<table>
			<tr>
				<td>
					<a id="memberAll" href="${pageContext.request.contextPath }/member/memberList.do" style="margin-right: 20px;"><h4 style="display: inline-block;">전체</h4></a>
				</td>
				<td>
					<a id="memberClient" href="${pageContext.request.contextPath }/member/memberList.do?mem_type=F" style="margin-right: 20px;"><h4 style="display: inline-block;">프리랜서</h4></a>
				</td>
				<td>
					<a id="memberFreelancer" href="${pageContext.request.contextPath }/member/memberList.do?mem_type=C" style="margin-right: 20px;"><h4 style="display: inline-block;">클라이언트</h4></a>
				</td>
			</tr>
		</table>
	</div>
</div>
		<!--   ---------------------------------회원관리 리스트 시작----------------------------    -->
		<div id="freeboardList_content" class="container">
			<div class="panel panel-blue">
				<table id="td" class="table table-bordered table-hover" style="background-color: #e1f3f7">
					<thead>
						<tr>
							<th scope="col" width="20%">아이디</th>
							<th scope="col" width="20%">회원이름</th>
							<th scope="col" width="20%">이메일</th>
							<th scope="col" width="20%">전화번호</th>
							<th scope="col" width="20%">회사크기</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${memberList }" var="memberList">
						<tr class='newTr'>							
							<td>${memberList.mem_id }</td>
							<td>${memberList.mem_nm }</td>
							<td>${memberList.mem_mail }</td>
							<td>${memberList.mem_tel }</td>
							<td>${memberList.mem_coms }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>	
			<!-- -----------------------회원관리 테이블 끝-------------------------------- -->
</body>
</html>