<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 리스트</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<style type="text/css">
.dataTables_info{
   display:none;
}
</style>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$('#td').DataTable({
				"language" : {
	    			"lengthMenu" : '자료실 수 : <select>'
	    				+ '<option value="10">10</option>'
	    				+ '<option value="20">20</option>'
	    				+ '<option value="50">50</option>'
	    				+ '<option value="-1">All</option>'
	    				+ '<select>'
	        	}
			});
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
				var re_num = $("td:eq(0)",this).text();
				$(location).attr('href', '${pageContext.request.contextPath}/reference/referenceView.do?re_num=' + re_num );
			}
		});
		
		$('#insertBtn').click(function(){
			if(eval("${LOGIN_MEMBERINFO.mem_id}" == "" || "${LOGIN_MEMBERINFO.mem_id}" == null)) {
 				swal(
						  '등록 실패',
						  '로그인을 해주세요.',
						  'question'
						)
						return false;
 			} else {
 				$(location).attr('href','${pageContext.request.contextPath}/reference/referenceForm.do');
 			}
		});
	});
</script>

</head>
<body>
<!--   ---------------------------------자료실 테이블 리스트 시작----------------------------    -->
		<div id="freeboardList_content" class="container">
			<div class="panel panel-blue">
				<table id="td" class="table table-bordered table-hover" style="background-color: #e1f3f7">
					<thead>
						<tr>
							<th scope="col" width="5%">번호</th>
							<th scope="col" width="65%">제목</th>
							<th scope="col" width="10%">작성자</th>
							<th scope="col" width="10%">작성일</th>
							<th scope="col" width="10%">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${referenceList }" var="referenceInfo">
							<tr class='newTr'>							
								<td>${referenceInfo.re_num}</td>
								<td style="cursor:pointer;">${referenceInfo.re_tit}</td>
								<td>${referenceInfo.mem_id}</td>
								<td>${referenceInfo.re_inst_date}</td>
								<td>${referenceInfo.re_luc}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input type="button" value="등록" id='insertBtn' onclick = "" class="btn btn-info form-control pull-right" >
			</div>
		</div>	
<!-- -----------------------자료실 테이블 끝-------------------------------- -->
</body>
</html>