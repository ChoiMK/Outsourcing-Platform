<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.dataTables_info{
   display:none;
}
</style>
</head>
<body>
<div id="freeboardList_content" class="container">
	<div class="panel panel-blue">
		<table id="td" class="table table-bordered table-hover" style="background-color: #e1f3f7">
			<thead>
				<tr>
					<th scope="col" width="5%">번호</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
				</tr>
			</thead>
			 <tbody>
			 <c:forEach items="${noticeList }" var="noticeInfo">
       		  <tr class ='newTr' >
				<td>${noticeInfo.nbod_num}</td>
       		  	<td style="cursor:pointer;">${noticeInfo.nbod_tit}</td>
				<td>${noticeInfo.mem_id}</td>
				<td>${noticeInfo.nbod_inst_date}</td>
         </tr>
      		</c:forEach>   
		</tbody>
		</table>
		<c:if test="${LOGIN_MEMBERINFO.mem_type eq 'A' }">
			<div class="pull-right"><input type="button" value="등록" id="insert"></div>
		</c:if>
	</div>
</div>
<script type="text/javascript">
$(function(){
	 $(document).ready(function() {
	        $('#td').DataTable({
	        	"language" : {
	    			"lengthMenu" : '공지글 수 : <select>'
	    				+ '<option value="10">10</option>'
	    				+ '<option value="20">20</option>'
	    				+ '<option value="50">50</option>'
	    				+ '<option value="-1">All</option>'
	    				+ '<select>'
	        	}
	        });
	    });
	
	
	 $("#insert").click(function(){
		 $(location).attr('href','${pageContext.request.contextPath}/notice/noticeForm.do');
	 });

	 $('tbody tr').click(function() {
		var num = $(this).children().first().text();
		location.href = '${pageContext.request.contextPath}/notice/noticeView/' + num + '.do';
	 });

	
});
</script>
</body>
</html>