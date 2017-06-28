<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.myarea{
margin: 0 auto;
width: 62%;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<div class="container asdf" >

	<!-- 만약 프리랜서라면 탭부분이 보임 -->
	<c:if test="${memberInfo.mem_type eq 'F' }">
	<div class="col-sm-3">
	  <ul id="myTab2" class="nav nav-tabs tabs-left" role="tablist" >
	    <li role="presentation" class="active"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab" aria-controls="profile1" aria-expanded="true">기본정보</a></li>
	    <li role="presentation" class=""><a href="#profile2" role="tab" id="profile-tab2" data-toggle="tab" aria-controls="profile2" aria-expanded="true">기술정보</a></li>
	    <li role="presentation" class=""><a href="#profile3" role="tab" id="profile-tab3" data-toggle="tab" aria-controls="profile3" aria-expanded="true">경력정보</a></li>
	    <li role="presentation" class=""><a href="#profile4" role="tab" id="profile-tab4" data-toggle="tab" aria-controls="profile4" aria-expanded="true">포트폴리오</a></li>
	  </ul>
	</div>  
	</c:if>
	
	
	<div class="col-sm-9">
	  <div id="myTabContent2" class="tab-content">
	    <div role="tabpanel" class="tab-pane fade active in" id="profile1" aria-labelledby="profile-tab1">
			
			<!------------------------------------기본정보-------------------------------- -->
        <div class="row-fluid-mypage">
            <div class="mypage-span3">
                <div class="box">                 
                    <form id="idPicForm" action="" method="post" enctype="multipart/form-data">
                    		<div class="center">
                     		<c:if test="${!empty fileitem }" > 
                     			<img src="http://192.168.201.222/file/${fileitem.file_save_nm}" class="img-responsive img-circle" style="width:200px; height:200px;"  id="myimg"> 
                    		</c:if> 
                    		<c:if test="${empty fileitem}">
                    			<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width:200px; height:200px;" id="myimg">
                    		</c:if>
                    		</div>
						<input type="hidden" id="fileName" name="fileName"/>
						<input type="hidden" name="mem_id" value="${memberInfo.mem_id }" >
						<span id="hiddenFileInput">
	    					<input type="file" id="idPic" name="idPic" onchange="inputPictureTransfer(this.value);"/>
						</span>
					</form>
					<form id="memberInfo" action="">
                     <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>아이디</td>
                        <td id="ID">${memberInfo.mem_id}</td>
                      </tr>
                      <tr>
                        <td>비밀번호</td>
                        <td id="PW">${memberInfo.mem_pw }</td>
                      </tr>
                      <tr>
                        <td>이름</td>
                        <td id="NM">${memberInfo.mem_nm }</td>
                      </tr>
                      <tr>
                        <td>이메일</td>
                        <td><input type="text" value="${memberInfo.mem_mail }" name="mem_mail"></td>
                      </tr>
                      <tr>
                        <td>전화번호</td>
                        <td><input type="text" value="${memberInfo.mem_tel }" name="mem_tel"></td>
                      </tr>
                      <tr>
                        <td>형태</td>
                        <td>
               				<input type="radio" name="position" id="freelancer" value="F"> 프리랜서
               				<input type="radio" name="position" id="client" value="C"> 클라이언트
                        </td>
                      </tr>
                      <tr>
                       <td>회사크기</td>
                        <td>
                        	<input type="radio" name="coms" id="indivisual" value="C"> 개인
               				<input type="radio" name="coms" id="team" value="T"> 팀
                        </td>
                      </tr>
                        	<input type="hidden" name="mem_pw">
                        	<input type="hidden" name="mem_type">
                        	<input type="hidden" name="mem_coms">
                        	<input type="hidden" name="mem_nm">
                        	
                    </tbody>
                  </table> 
                </div>
            </div>
           
            <div class="span7" id="div-mem-self">
            		<h6>자기소개</h6>
            		<input type="hidden" name="mem_id" value="${memberInfo.mem_id }">
                	<textarea name="mem_self" id="mem_self" class="input-block-level" rows="8" value="${memberInfo.mem_self }"></textarea>
            		<input type="submit" class="btn btn-info btn-lg" value="수정" id="updateMem">
                    <input type="button" class="btn btn-info btn-lg" value="삭제" id="deleteMem">
             </div>
            </form>
      </div>
			<!-- -----------------------기본정보 END-------------------------------- -->
	    </div>
	    
	    <!-------------------------------- 기술정보----------------------------------- -->
	    <div role="tabpanel" class="tab-pane fade " id="profile2">
	    <div class="container">
                  <h4>나의 기술정보</h4></br>
                  <div id="career1">
                  		<c:forEach items="${tecinfoList }" var="tecinfoList" varStatus='stat'>
                  			<div style="display:inline-block; width:230px;"><a class='btn btn-success btn-lg' href="#" name="tech" >${tecinfoList.tec_info_lan }</a></div>
		                  		<c:if test='${stat.count % 5 == 0}'>
			            	  		</br></br>
			              	  	</c:if>
                  		</c:forEach>
                  </div>
            <hr>
            
            <p>추가하실 기술들을 클릭해주세요</p>
	              <c:forEach items="${technologyList }" var="technologyList" varStatus='stat'>
	              		<div style="display:inline-block; width:230px;"><a class="btn btn-info pro_plan_cod insertTech" href="#" name="tech" id="${technologyList.tech }" >${technologyList.tech }</a></div>
	            	  <c:if test='${stat.count % 5 == 0}'>
	            	  </br></br>
	              	  </c:if>
	              </c:forEach>
         </div>
	    </div>
	      
	      <!-- -------------------------기술정보 END -------------------------------------- -->
	    
	    
	    <div role="tabpanel" class="tab-pane fade" id="profile3" aria-labelledby="profile-tab3" >
	    <!-- -------------------------경력정보 -------------------------------------- -->
	    <div class="container">
	    	<div class="row-fluid" >
				<font size=4 > <b>회사명 :</b> </font> <input type="text" name="car_com_nm" style="width:150px;"> &nbsp;&nbsp;&nbsp;&nbsp;
			    <font size=4> <b>기간 :</b> </font> <input type="text" name="car_date" style="width:35px;"> &nbsp;&nbsp;&nbsp;&nbsp;
			    <font size=4> <b>근무부서 :</b> </font> <input type="text" name="car_work_dep" style="width:70px;"> &nbsp;&nbsp;&nbsp;&nbsp;
			    <font size=4> <b>담당업무 :</b> </font> <input type="text" name="car_cha_task" style="width:70px;"> &nbsp;&nbsp;&nbsp;&nbsp;
			    <font size=4> <b>직위 :</b> </font> <input type="text" name="car_spot" style="width:70px;"> &nbsp;&nbsp;&nbsp;&nbsp;
			    <input id="careerAdd" type="button" class="btn btn-info btn-lg" value="등록" style="margin-bottom:12px;">
	    	</div>
	    	
	    <script type="text/javascript">
	    	$(function(){
	    		$('#careerAdd').click(function(){
	    			if($("input[name=car_com_nm]").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '회사명을 입력해 주세요',
	    						  'question'
	    						)
	     				return false;
	     			}
	    			
	    			if($("input[name=car_date]").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '기간을 입력해 주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    			
	    			if($("input[name=car_work_dep]").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '근무부서를 입력해 주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    			
	    			if($("input[name=car_cha_task]").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '담당 업무를 입력해주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    			
	    			if($("input[name=car_spot]").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '직위를 입력해주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    		});
	    	});
	    </script>
	    	
	    	<hr>
			<table id="carinfoTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>회사명</th>
						<th>기간</th>
						<th>근무부서</th>
						<th>담당업무</th>
						<th>직위</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${carinfoList }" var="carinfoList">
					<tr>
						<td>${carinfoList.car_com_nm }</td>
						<td>${carinfoList.car_date }</td>
						<td>${carinfoList.car_work_dep }</td>
						<td>${carinfoList.car_cha_task }</td>
						<td>${carinfoList.car_spot }</td>
						<td><input type="hidden" name="car_num" value="${carinfoList.car_num}" > <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove">X</span></button></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	    </div>
	    </div>
	    
	  
	    	<!-- -------------------------경력정보 END -------------------------------------- -->
	    
	    <div role="tabpanel" class="tab-pane fade" id="profile4" aria-labelledby="profile-tab4">	   
	      <!-- -------------------------포트폴리오------------------------------------------ -->
			<div class="container">
			<table class="table table-bordered">
			    <tbody>
			        <form id="portfolioForm" action="${pageContext.request.contextPath}/portfolio/insertPortfolio.do" method="post" encType="multipart/form-data">
			            <tr>
			                <th>포트폴리오 제목: </th>
			                <td><input type="text" id="po_tit"  name="po_tit" class="form-control"/></td>
			            </tr>
			            <tr>
			                <th>포트폴리오 내용: </th>
			                <td><textarea id="po_con" cols="10"  name="po_con" class="form-control"></textarea></td>
			            </tr>
			            <tr>
			                <th>파일등록: </th>
			                <td><input type="file" name="file" id="fileItem" class="form-control"/></td>
			            </tr>
			            <tr>
			                <td colspan="2">
			                    <input id="ajaxprotBtn" type="button" value="등록" class="btn btn-info btn-lg pull-right"/> 
			                </td>
			            </tr>
			        </form>
			    </tbody>
			</table>
			</div>
			
		<script type="text/javascript">
	    	$(function(){
	    		$('#ajaxprotBtn').click(function(){
	    			if($("#po_tit").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '제목을 입력해 주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    			
	    			if($("#po_con").val() == "") {
	    				swal(
	    						  '등록 실패',
	    						  '포트폴리오 내용을 입력해 주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    			
	    			if($("#fileItem").val() == "") {
	     				swal(
	    						  '등록 실패',
	    						  '파일을 선택해 주세요.',
	    						  'question'
	    						)
	     				return false;
	     			}
	    		});
	    	});
	    </script>
			
			<hr>
			<section id="portfolio" class="container main" style="width:1140px;">    
        		<ul class="gallery col-4" style="margin-right: 0px;"> 
          			<c:forEach items="${portfolioitemList }" var="portfolioitemList" varStatus="status">
            		<li>
                		<div class="preview">
                    		<img src="http://192.168.201.222/file/${portfolioitemList.file_save_nm}" style="width:270px; height:200px;">
                    		<div class="overlay">
                    		</div>
                   			<div class="links" style="height:40px; width:170px; margin-left:-40px; left:78px;" >
                        		<a data-toggle="modal" style="padding-left: 0px; margin-left: 30px;" href="#${portfolioitemList.file_num }"><i class="icon-eye-open"></i></a>
                        		<a id="portfolioDel" href="#" style="background-color:#ff5e00;padding-left: 0px; margin-left: 20px;">x</a>
                			<input type="hidden" name="file_bod_num" value="${portfolioitemList.file_bod_num}"/>
                   			</div>
               			</div>
						<div id="${portfolioitemList.file_num }" class="modal hide fade">
                    		<a class="close-modal" href="javascript:;" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></a>
                    		<div class="modal-body">
                        		<img src="http://192.168.201.222/file/${portfolioitemList.file_save_nm}" width="100%" style="max-height:400px">
                    		</div>
                		</div> 
                		<div class="desc">
                    		<h5>${portfolioitemList.po_tit }</h5>
                    		<small>${portfolioitemList.po_con }</small>
                		</div>
                	</li>         
          			</c:forEach>		
        		</ul> 
    		</section>
			<hr>
	      <!-- -------------------------포트폴리오 END------------------------------------------ -->
	    </div>
	  </div>
	</div> 
<div class="clearfix"></div>
</div>
<script type="text/javascript">
	function inputPictureTransfer(file){
		var mem_id = '${memberInfo.mem_id}';
		// D:\\temp\\a.png
		var filePath = file.split("\\");
		var fileName = filePath[filePath.length-1];
		alert(fileName);
		$('#fileName').val(fileName);
		
		$('#idPicForm').attr('action', '${pageContext.request.contextPath}/idPictureUpload.do');
		$('#idPicForm').attr('enctype', 'multipart/form-data');
		$('#idPicForm').attr('method', 'post');
		$('#idPicForm').ajaxSubmit({
			dataType:'json',
			success:function(data){
				
			$('#myimg').attr('src', 'http://192.168.201.222/file/'+data.saveFileName);
	 		}
	 	});
	}

	$(function(){
		// ----------------------------------------- 기본정보 ------------
		
		
		// 자기소개 
		var member_self = '${memberInfo.mem_self}';
		$("#mem_self").val(member_self);
		
		// 형태
		var member_type = '${memberInfo.mem_type}';
		$('input:radio[name=position]:input[value=' + member_type + ']').attr("checked", true);

		// 회사크기
		var member_coms = '${memberInfo.mem_coms}';
		$('input:radio[name=coms]:input[value=' + member_coms + ']').attr("checked", true);
		
		// 수정 클릭시
		$("#memberInfo").submit(function(){
			 var ID = $('#ID').html();
			 var PW = $('#PW').html();
			 var NM = $('#NM').html();
			 var TYPE = $("input:radio[name=position]:checked").val();
			 var COMS = $("input:radio[name=coms]:checked").val();
			 
			 $('input[name=mem_id]').val(ID);
			 $('input[name=mem_pw]').val(PW);
			 $('input[name=mem_nm]').val(NM);
			 $('input[name=mem_type]').val(TYPE);
			 $('input[name=mem_coms]').val(COMS);
			 var file_save_nm = '${fileitem.file_save_nm}';
			 $('#myimg').attr('src', 'http://192.168.201.222/file/'+file_save_nm);
			 $(this).attr('action','${pageContext.request.contextPath}/updateMember.do');
		});
		
		// 탈퇴 클릭시 
		$('#deleteMem').click(function() {
			alert("회원탈퇴가 완료되었습니다.");
			
			$(location).attr('href','${pageContext.request.contextPath}/deleteMember/${LOGIN_MEMBERINFO.mem_id}.do'); 
		});		
		// ----------------------------------------- 기본정보 ------------
		
		//기술 삭제
		$("#career1").on("click", "a", function() {
 			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/deleteTech.do",
				dataType:"json",
				data:{tech : $(this).text()},
				success:function(result){
					var htmlCode = "";
					$.each(result.tecinfoList, function(i,v){
						htmlCode += "<div style='display:inline-block; width:230px;'><a class='btn btn-success btn-lg' name='tech' >"+v.tec_info_lan+"</a></div>";
						
						if((i+1)%5==0){
							htmlCode += "</br></br>"
						}
					});
	                  	
	                  	$("#career1").html(htmlCode);
					}
			});
 		});
		
		//기술 추가
		$('.insertTech').click(function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/insertTech.do",
				dataType:"json",
				data:{tech : $(this).text()},
				success:function(result){
						var htmlCode = "";
						$.each(result.tecinfoList, function(i,v){
							htmlCode += "<div style='display:inline-block; width:230px;'><a class='btn btn-success btn-lg' name='tech' >"+v.tec_info_lan+"</a></div>";
							
							if((i+1)%5==0){
								htmlCode += "</br></br>"
							}
						});
	                  	
	                  	$("#career1").html(htmlCode);
					}
			});
		});
		
		
		//경력정보 리스트에 추가하여 불러오기
		$('#careerAdd').click(function(){
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/insertCarinfo.do",
				dataType:"json",
				data:{car_com_nm : $(this).siblings('input[name=car_com_nm]').val(),
					  car_date   : $(this).siblings('input[name=car_date]').val(),
					  car_work_dep : $(this).siblings('input[name=car_work_dep]').val(),
					  car_cha_task : $(this).siblings('input[name=car_cha_task]').val(),
					  car_spot : $(this).siblings('input[name=car_spot]').val()
				},
				success:function(result){
					var htmlCode = "";
					$.each(result.carinfoList, function(i,v){
					htmlCode += "	<tr>                                                                               ";
					htmlCode += "  	<td>"+v.car_com_nm+"</td>                                                              ";
					htmlCode += "      <td>"+v.car_date+"</td>                                                             ";
					htmlCode += "      <td>"+v.car_work_dep+"</td>                                                         ";
					htmlCode += "      <td>"+v.car_cha_task+"</td>                                                         ";
					htmlCode += "      <td>"+v.car_spot+"</td>                                                             ";
					htmlCode += "      <td><input type='hidden' name='car_num' value='"+v.car_num+"' >        ";
					htmlCode += "      <button type='submit' class='btn btn-danger'>                                   ";
					htmlCode += "      <span class='glyphicon glyphicon-remove'>X</span>                               ";
					htmlCode += "      </button>                                                                       ";
					htmlCode += "      </td>                                                                           ";
					htmlCode += "   </tr>                                                                              ";
						
					});
	                  	
	                  	$("#carinfoTable>tbody").html(htmlCode);
					}
			});
			
			
		});
		
		
		//경력정보 리스트 삭제해서 불러오기
		$('#carinfoTable>tbody').on('click','button', function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/deleteCarinfo.do",
				dataType:"json",
				data:{car_num : $(this).siblings('input').val()},
				success:function(result){
					var htmlCode = "";
					$.each(result.carinfoList, function(i,v){
					htmlCode += "	<tr>                                                                               ";
					htmlCode += "  	<td>"+v.car_com_nm+"</td>                                                              ";
					htmlCode += "      <td>"+v.car_date+"</td>                                                             ";
					htmlCode += "      <td>"+v.car_work_dep+"</td>                                                         ";
					htmlCode += "      <td>"+v.car_cha_task+"</td>                                                         ";
					htmlCode += "      <td>"+v.car_spot+"</td>                                                             ";
					htmlCode += "      <td><input type='hidden' name='car_num' value='"+v.car_num+"' >        ";
					htmlCode += "      <button type='submit' class='btn btn-danger'>                                   ";
					htmlCode += "      <span class='glyphicon glyphicon-remove'>X</span>                               ";
					htmlCode += "      </button>                                                                       ";
					htmlCode += "      </td>                                                                           ";
					htmlCode += "   </tr>                                                                              ";
						
					});
	                  	
	                  	$("#carinfoTable>tbody").html(htmlCode);
					}
			});
		});
		
		// 포트폴리오 등록하고 리스트 불러오기
		$('#ajaxprotBtn').click(function(){
			$('#portfolioForm').ajaxSubmit({
					dataType:'json',
					success:function(data){
					var htmlCode = "<ul class='gallery col-4'> ";
					$.each(data.portfolioitemList, function(i,v){
	            		htmlCode +='<li>                                                                                                                          ';
	                	htmlCode +='	<div class="preview">                                                                                                     ';
	                	htmlCode +='		<img src="http://192.168.201.222/file/'+v.file_save_nm+'" style="width:270px; height:200px;">          ';
	                    htmlCode +='		<div class="overlay">                                                                                                 ';
	                    htmlCode +='		</div>                                                                                                                ';
	                    htmlCode +='          			<div class="links" style="height:40px; width:170px; margin-left:-40px; left:78px;" > ';
					    htmlCode +='           		<a data-toggle="modal" style="padding-left: 0px; margin-left: 30px;" href="'+v.file_num +'"><i class="icon-eye-open"></i></a> ';
					    htmlCode +='           		<a id="portfolioDel" href="#" style="background-color:#ff5e00;padding-left: 0px; margin-left: 20px;">x</a> ';
	                	htmlCode +='	<input type="hidden" name="file_bod_num" value="'+v.file_bod_num+'"/>                                      ';                                                              
					    htmlCode +='       			</div>';
	               		htmlCode +='	</div>                                                                                                                    ';
						htmlCode +='	<div id="'+v.file_num+'" class="modal hide fade">                                                         ';
	                    htmlCode +='		<a class="close-modal" href="javascript:;" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></a>    ';
	                    htmlCode +='		<div class="modal-body">                                                                                              ';
	                    htmlCode +='    		<img src="http://192.168.201.222/file/'+v.file_save_nm+'" width="100%" style="max-height:400px">   ';
	                    htmlCode +='		</div>                                                                                                                ';
	                	htmlCode +='	</div>                                                                                                                    ';
	                	htmlCode +='	<div class="desc">                                                                                                        ';
	                    htmlCode +='		<h5>'+v.po_tit+'</h5>                                                                                 ';
	                    htmlCode +='		<small>'+v.po_con+'</small>                                                                           ';
	                	htmlCode +='	</div>                                                                                                                    ';
	                	htmlCode +='</li>                                                                                                                         ';
					});
					htmlCode +="</ul>";
					$('#portfolio').html(htmlCode);
			 	     }
			
			 	});
		});
		// 포트폴리오를 삭제하고 리스트 불러오기
		$(document).on('click',"#portfolioDel",function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/portfolio/deletePortfolio.do",
				dataType:"json",
				data:{file_bod_num : $(this).siblings("input[name=file_bod_num]").val()},
				success:function(data){
					var htmlCode = "<ul class='gallery col-4'> ";
					$.each(data.portfolioitemList, function(i,v){
	            		htmlCode +='<li>                                                                                                                          ';
	                	htmlCode +='	<div class="preview">                                                                                                     ';
	                	htmlCode +='		<img src="http://192.168.201.222/file/'+v.file_save_nm+'" style="width:270px; height:200px;">          ';
	                    htmlCode +='		<div class="overlay">                                                                                                 ';
	                    htmlCode +='		</div>                                                                                                                ';
	                    htmlCode +='          			<div class="links" style="height:40px; width:170px; margin-left:-40px; left:78px;" > ';
					    htmlCode +='           		<a data-toggle="modal" style="padding-left: 0px; margin-left: 30px;" href="'+v.file_num +'"><i class="icon-eye-open"></i></a> ';
					    htmlCode +='           		<a id="portfolioDel" href="#" style="background-color:#ff5e00;padding-left: 0px; margin-left: 20px;">x</a> ';
	                	htmlCode +='	<input type="hidden" name="file_bod_num" value="'+v.file_bod_num+'"/>                                      ';                                
					    htmlCode +='       			</div>';
	               		htmlCode +='	</div>                                                                                                                    ';
						htmlCode +='	<div id="'+v.file_num+'" class="modal hide fade">                                                         ';
	                    htmlCode +='		<a class="close-modal" href="javascript:;" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></a>    ';
	                    htmlCode +='		<div class="modal-body">                                                                                              ';
	                    htmlCode +='    		<img src="http://192.168.201.222/file/'+v.file_save_nm+'" width="100%" style="max-height:400px">   ';
	                    htmlCode +='		</div>                                                                                                                ';
	                	htmlCode +='	</div>                                                                                                                    ';
	                	htmlCode +='	<div class="desc">                                                                                                        ';
	                    htmlCode +='		<h5>'+v.po_tit+'</h5>                                                                                 ';
	                    htmlCode +='		<small>'+v.po_con+'</small>                                                                           ';
	                	htmlCode +='	</div>                                                                                                                    ';
	                	htmlCode +='</li>                                                                                                                         ';
					});
					htmlCode +="</ul>";
					$('#portfolio').html(htmlCode);
			 	     }
			});
			
		});

		
		
	});
</script>
</body>
</html>