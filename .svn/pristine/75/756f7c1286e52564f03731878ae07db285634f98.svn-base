<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
<style type="text/css">

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
			$(location).attr('href', '${pageContext.request.contextPath}/reference/referenceForm.do');
			}
		});
		
		
		$('.newTr').click(function(){
			var re_num = $("td:eq(0)",this).text();
//			var re_num = $("td:eq(0)",this).find('input').val();
//			alert(re_num);
		$(location).attr('href', '${pageContext.request.contextPath}/reference/referenceView.do?re_num=' + re_num );
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
			
		<!--   ---------------------------------자료실 테이블 리스트 시작----------------------------    -->
		<div id="freeboardList_content">
			<div class="panel panel-blue">
				<table id="td" class="table table-bordered table-hover"
					style="background-color: #e1f3f7">
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
								<td>${referenceInfo.re_tit}</td>
								<td>${referenceInfo.mem_id}</td>
								<td>${referenceInfo.re_inst_date}</td>
								<td>${referenceInfo.re_luc}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" id='insertBtn' class="btn btn-info form-control pull-right" >자료실 등록</button>
			</div>
			
		</div>	
     
			<!-- -----------------------자료실 테이블 끝-------------------------------- -->
			
	    </div> 
	 
	    
	  </div>
	</div> 
		



</body>
</html>