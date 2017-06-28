<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
.dataTables_info{
   display:none;
}
</style>
<body>
<div class="center container">
<br>
	<div style="text-align: center; margin-left: 950px;">
		<table>
			<tr>
				<td>
					<a id="projectAll" href="http://192.168.201.222/plzdvl/project/projectList.do" style="margin-right: 20px;"><h4 style="display: inline-block;">전체</h4></a>
				</td>
				<td>
					<a id="projectDvl" href="http://192.168.201.222/plzdvl/project/projectList.do?pro_dtn=개발" style="margin-right: 20px;"><h4 style="display: inline-block;">개발</h4></a>
				</td>
				<td>
					<a id="projectDesign" href="http://192.168.201.222/plzdvl/project/projectList.do?pro_dtn=디자인" style="margin-right: 20px;"><h4 style="display: inline-block;">디자인</h4></a>
				</td>
				<td>
					<a id="projectPlan" href="http://192.168.201.222/plzdvl/project/projectList.do?pro_dtn=기획" style="margin-right: 20px;"><h4 style="display: inline-block;">기획</h4></a>
				</td>
		</table>
	</div>
<table id="projectlist"  class="table" cellspacing="0" width="100%" >
<thead><tr><th></th></tr></thead>
<tbody>
<c:forEach items="${projectList}" var="projectInfo" varStatus="status">
<tr><td>
	
             <div class="box"; style="padding-left: 40px;">
            	<h2 class="ProjectTit" style="color:black; cursor:pointer; display: inline-block;">${projectInfo.pro_tit}</h2><br>
                <input type="hidden" name="pro_num" value="${projectInfo.pro_num}"/>
             	
             	<table style="width:100%; background-color:#ffffff;">
             		<tr>
             			<td style="width:7%; text-align: center; border-top: 1px solid #ffffff;">금액<br>
             				<img style="width:50px; height:50px;" src="${pageContext.request.contextPath}/resources/images/projectimages/money-bag.png" />
             			</td>
             			<td style="text-align:center;padding-bottom: 8px;border-top-width: 0px;padding-top: 25px;padding-left: 0px;border-left-width: 0px; width:15%">
             				<h3>${projectInfo.pro_bud}</h3>
             			</td>
             			
             			<td style="width:7%; text-align: center; border-top: 1px solid #ffffff;">기간<br>
             				<img style="width:50px; height:50px;" src="${pageContext.request.contextPath}/resources/images/projectimages/calendar.png" />
             			</td>
             			<td style="text-align:center;padding-bottom: 8px;border-top-width: 0px;padding-top: 25px;padding-left: 0px;border-left-width: 0px; width:5%">
             				<h3>${projectInfo.pro_term }일</h3>
             			</td>
             			
             			<td style="width:7%; text-align: center; border-top: 1px solid #ffffff;">
             				기획상태<br>
             				<img style="width:50px; height:50px;" src="${pageContext.request.contextPath}/resources/images/projectimages/tactics.png" />
             			</td>
             			<td style="text-align:center;padding-bottom: 8px;border-top-width: 0px;padding-top: 25px;padding-left: 0px;border-left-width: 0px; width:20%">
             				<h3>${projectInfo.pro_plan_cod}</h3>
             				<input type="hidden" name="pro_num" id="${status.count }" value="${projectInfo.pro_num }" />
             			</td>
             			
             			
             			
             			<td style="width:7%; text-align: center; border-top: 1px solid #ffffff;">
             				지원자<br>
             				<img style="width:50px; height:50px;" src="${pageContext.request.contextPath}/resources/images/projectimages/collaboration.png" />
             			</td>
             			<td style="text-align:center;padding-bottom: 8px;border-top-width: 0px;padding-top: 25px;padding-left: 0px;border-left-width: 0px; width:5%">
             				<h3 id="supporter${status.count }" ></h3>
             			</td>
             			
             			<td style="width:7%; text-align: center; border-top: 1px solid #ffffff;">
             				모집마감<br>
             				<img style="width:50px; height:50px;" src="${pageContext.request.contextPath}/resources/images/projectimages/deadline.png" />
             			</td>
             			<td style="text-align:center;padding-bottom: 8px;border-top-width: 0px;padding-top: 25px;padding-left: 0px;border-left-width: 0px; width:10%">
             				<h3 id="dday${status.count }"></h3>
             			</td>
             			
             			<script type="text/javascript">
	             			$(function(){
	             				var pro_num = $("#${status.count}").val();
	             				$.ajax({
	             					type : "POST",
	             					url : "${pageContext.request.contextPath}/supportCnt.do",
	             					dataType : "json",
	             					data : { pro_num : pro_num },
	             					success : function(data) {
	             						$("#supporter${status.count }").html(data.suppotCnt+'명');
	             					}
	             				});
	             			});
	             		</script>	
	             		
	             		<script type="text/javascript">
	             			$(function(){
	             				var pro_num = $("#${status.count}").val();
	             				$.ajax({
	             					type : "POST",
	             					url : "${pageContext.request.contextPath}/project/DdayCnt.do",
	             					dataType : "json",
	             					data : { pro_num : pro_num },
	             					success : function(data) {
	             						$("#dday${status.count }").html(data.DdayCnt+'일 남음');
	             					}
	             				});
	             			});
	             		</script>
             		<tr>
             	</table>
             	<br>
               	 요구기술 :
               	 <c:forTokens items="${projectInfo.pro_need_tec }" delims="," var="item">
				<a class="btn btn-mini btn-default">${item }</a>
			</c:forTokens>
             </div>
	
</td>
</tr>
</c:forEach>
</tbody>
</table>
<script type="text/javascript">
$(function(){
	 $(document).ready(function() {
	        $('#projectlist').DataTable({
	        	"language" : {
	    			"lengthMenu" : '프로젝트 수 : <select>'
	    				+ '<option value="10">10</option>'
	    				+ '<option value="20">20</option>'
	    				+ '<option value="50">50</option>'
	    				+ '<option value="-1">All</option>'
	    				+ '<select>'
	        	}
	        });
	     
	        
	        
	        
	        
	    });
	 
	$('.ProjectTit').click(function(){
		var pro_num = $(this).siblings("input[name='pro_num']").val();
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
			
		}else{
			
			$(location).attr('href','${pageContext.request.contextPath}/project/projectView.do?pro_num='+pro_num);
		}
	 });
	
	
});
</script>
</div>
</body>
</html>