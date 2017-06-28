<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개발Tip 문제 리스트</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<style type="text/css">


}
</style>
<script type="text/javascript">
	$(function() {
		$(document).ready(function() {
			$('#td').DataTable();
		});
		
		$('#insertBtn').click(function(){
			if(eval('${empty LOGIN_MEMBERINFO}')){
			 	BootstrapDialog.show({
		 	    title: '경고 합니다.',
		 	    message: '로그인 하지 않으면 사용할 수 없습니다.'
		 		});
				return false;
			}else{
			$(location).attr('href', '${pageContext.request.contextPath}admin/adminDvrTest/adminDvrTestForm.do');
			}
		});
		
		
		$('.newTr').click(function(){
			var re_num = $("td:eq(0)",this).text();
//			var re_num = $("td:eq(0)",this).find('input').val();
//			alert(re_num);
		$(location).attr('href', '${pageContext.request.contextPath}admin/adminDvrTest/adminDvrTestView.do?re_num=' + re_num );
		});
		
		
	});
</script>

</head>
<body>
	<div class="container">
	<h1>자료실</h1>
	</div>
	
		<div class="col-sm-9">
	  <div id="myTabContent2" class="tab-content">
	    <div role="tabpanel" class="tab-pane fade active in " id="home2" aria-labelledby="home-tab2">
			
		<!--   ---------------------------------문제 테이블 리스트 시작----------------------------    -->
		<div id="freeboardList_content">
			<div class="panel panel-blue">
				<table id="td" class="table table-bordered table-hover"
					style="background-color: #e1f3f7">
					<thead>
						<tr>
							<th scope="col" width="5%">번호</th>
							<th scope="col" width="65%">과목</th>
							<th scope="col" width="10%">내용</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${adminDvrTestQueList }" var="adminDvrTestQueInfo">
							<tr class='newTr'>							
								<td>${adminDvrTestQueInfo.test_num}</td>
								<td>${adminDvrTestQueInfo.test_sub}</td>
								<td>${adminDvrTestQueInfo.test_con}</td>								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" id='insertBtn' class="btn btn-info form-control pull-right" >문제등록</button>
			</div>
			
		</div>	
     
			<!-- -----------------------문제 테이블 끝-------------------------------- -->
			
	    </div> 
	 
	    
	  </div>
	</div> 
		



</body>
</html>