<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.tableSize{
	width: 1170px;
	min-height: 250px;
	height: auto;
}

table{
	width: 100%;
    height: 100%;
    
}
.tableSize { 
	border-bottom: 2px solid #000000 !important;
	width:1146px;
 } 

.detailList {
	margin-bottom: 20px;
}

.detailList > ul > li > a {
	color: #666666;
  padding-right: 20px;
  font-size: 15px;
  text-decoration: none;
  text-transform: uppercase;
  font-weight: 500;
  transition: color .2s ease;
  
}
.detailList > ul > li:hover > a,
.detailList > ul > li.active > a {
  color: #2dcc70;
/*   border-bottom: 2px solid #000000 !important; */
}

.detailList > ul > li {
	display: inline-block;
}

th {
	border-bottom:  1px solid #444444;
	background-color: #f5f5f5;
}

#projectoutput #estimate {
	background-color: white;
}
.centerSort {
	text-align: center;
}
tbody > tr > td {
padding: 12px 12px;

}
.hproperty {
display: inline-block;
}
.whtBtn:hover {
	background-color: #e83570;
}
.freeBtn:hover {
	background-color: #e83570;
}
</style>


</head>
<body>
<br><br>
<div class="container">
	<div id="projectoutput" class="box">
		<h4 style="padding-top: 10px;padding-left: 20px;">프로젝트 현황</h4>
		<hr style="
    margin-bottom: 6px;
    margin-top: 6px;
    width: 1120px;
    background-color: gray;
">
		<div class ="tableSize">
		<div class ="detailList" style="margin-bottom: 6px;">
			<ul>
				<li><a style="cursor:pointer" class="allList">전체</a></li>
	        	<li><a style="cursor:pointer"class="recruiting">모집중</a></li>
	            <li><a style="cursor:pointer"class="deadline">모집마감</a></li>
	            <li><a style="cursor:pointer"class="progress">진행</a></li>
	            <li><a style="cursor:pointer"class="complete">완료</a></li>
	            <li><a style="cursor:pointer"class="hold">보류</a></li>
	        </ul>
				
		</div>
		<table>
					<thead>
						<tr>
							<th style="width: 50%"><h5 style="margin-bottom: 0px;">제목</h5></th>
							<th><h5 style="margin-bottom: 0px;">분야</h5></th>
							<th><h5 style="margin-bottom: 0px;">기획상태</h5></th>
							<th><h5 style="margin-bottom: 0px;">기간</h5></th>
							<th><h5 style="margin-bottom: 0px;">지원자</h5></th>
							<th><h5 style="margin-bottom: 0px;">상태</h5></th>
						</tr>
					</thead>
					<fr>
					<tbody class="outputList">
					<c:forEach items="${projectList }" var="projectInfo" varStatus="status">
						<tr>
							<td><h4 class="hproperty" style="width:74%"><a href="${pageContext.request.contextPath}/project/projectView.do?pro_num=${projectInfo.pro_num }">${fn:substring(projectInfo.pro_tit,0,22)} . . .</a></h4>
							<div class = "hproperty" style="width:25%; text-align: right;">
							<c:if test="${!empty projectInfo.pro_gress_con }">
							<input type="button" class="btn btn-info whtBtn selectAddbtn1${status.count}" value="${projectInfo.pro_gress_con }">&nbsp;&nbsp;
							</c:if>
							<c:if test="${empty projectInfo.pro_gress_con }">
							<input type="button" class="btn btn-info whtBtn selectAddbtn1${status.count}" value="지원자선택">&nbsp;&nbsp;
							</c:if>
							<input type="button" class="btn btn-info whtBtn selectAddbtn2${status.count}" value="삭제">
							<input type="hidden" value="${projectInfo.pro_num}" name="pro_num"/></div></td>
							<td class="centerSort"><h4>${projectInfo.pro_dtn}</h4></td>
							<td class="centerSort"><h4>${projectInfo.pro_plan_cod}</h4></td>
							<td class="centerSort"><h4>${projectInfo.pro_term} 일</h4></td>
							<td class="centerSort supportCnt${status.count} "><h4></h4><input type="hidden" name="pro_num" value="${projectInfo.pro_num}"></td>
							<td class="centerSort pro_cod_wht${status.count}"><h4>${projectInfo.pro_cod_wht}</h4></td>
						</tr>
						<script type="text/javascript">
						$(function(){
							var pro_num = $(".supportCnt${status.count}>input[name=pro_num]").val();
							$.ajax({
								type:"POST",
								url:"${pageContext.request.contextPath}/supportCnt.do",
								dataType:"json",
								data:{pro_num : pro_num},
								success:function(data){
									$(".supportCnt${status.count}>h4").html(data.suppotCnt+' 명');
							 	     }
							});
							if($(".pro_cod_wht${status.count}>h4").text()=='모집중'){
								$(".selectAddbtn1${status.count}").hide();
								$(".selectAddbtn2${status.count}").hide();
							}else if($(".pro_cod_wht${status.count}>h4").text()=='모집마감'){
								$(".selectAddbtn2${status.count}").hide();
							}else if($(".pro_cod_wht${status.count}>h4").text()=='진행'){
								$(".selectAddbtn1${status.count}").val("마감");
								$(".selectAddbtn2${status.count}").val("취소");
							}else if($(".pro_cod_wht${status.count}>h4").text()=='완료'){
								$(".selectAddbtn1${status.count}").hide();
								$(".selectAddbtn2${status.count}").hide();
							}else if($(".pro_cod_wht${status.count}>h4").text()=='보류'){
								$(".selectAddbtn1${status.count}").hide();
								$(".selectAddbtn2${status.count}").val("프로젝트 삭제");
							}
							
							
						});
						</script>
					</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
	<br><br>
	<div id="estimate" class="box">
		<h4 style="padding-top: 10px;padding-left: 20px;">견적문의</h4>
		<div class ="tableSize" >
			<div class ="detailList">
			</div>	
			<table>
				<thead>
					<tr>
							<th style="width: 50%"><h5 style="margin-bottom: 0px;">제목</h5></th>
							<th><h5 style="margin-bottom: 0px;">분야</h5></th>
							<th><h5 style="margin-bottom: 0px;">기획상태</h5></th>
							<th><h5 style="margin-bottom: 0px;">기간</h5></th>
							<th><h5 style="margin-bottom: 0px;">상태</h5></th>
					</tr>	
				</thead>
					<tbody class="estprojectList">
					<c:forEach items="${projectestList }" var="projectestInfo">
						<tr>
							<td><h4 class="hproperty" style="width:74%"><a class="moveListView" href="${pageContext.request.contextPath}/project/projectView.do?pro_num=${projectestInfo.pro_num }">${fn:substring(projectestInfo.pro_tit,0,22)} . . .</a></h4>
							<div class = "hproperty" style="width:25%; text-align: right;">
							<input type="button" class="btn btn-info freeBtn selectAddbtn3${status.count}" value="지원"/>&nbsp;&nbsp;
							<input type="button" class="btn btn-info freeBtn selectAddbtn3${status.count}" value="삭제"/>
							<input type="hidden" name="${projectestInfo.pro_num}" value="${projectestInfo.pro_num}"/>
							</td></div>
							<td class="centerSort"><h4>${projectestInfo.pro_dtn}</h4></td>
							<td class="centerSort"><h4>${projectestInfo.pro_plan_cod}</h4></td>
							<td class="centerSort"><h4>${projectestInfo.pro_term} 일</h4></td>
							<td class="centerSort"><h4>${projectestInfo.pro_cod_wht}</h4></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
				<div class="modal hide fade in " id="selectSupport" aria-hidden="false">
					<div class="modal-header" style="background: #2dcc70; height:80px;">
					<img src="${pageContext.request.contextPath}/resources/images/logoWhite.png"/>
						<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
						<div>
							<h3 class="findMember" style="height: 50px; color: white;"></h3>
						</div>
					</div>
					<div class="modal-body">
						<form name="supportMeetSet" class="form-inline" method="post" >
							<h5>화상미팅 하실 프리랜서를 선택하세요</h5>
							<br />
							<div id="supportSelectmodal">
							
							
							</div>
									<br>
									<br> <input type="button" value="확인"> 
									<input type="reset" value="취소">
						</form>
					</div>
				</div>
				
				
				<div class="modal hide fade in " id="supportProgress" aria-hidden="false">
					<div class="modal-header" style="background: #2dcc70; height:80px;">
					<img src="${pageContext.request.contextPath}/resources/images/logoWhite.png"/>
						<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
						<div>
							<h3 class="findMember" style="height: 50px; color: white;"></h3>
						</div>
					</div>
					<div class="modal-body">
						<form name="supportProgressSet" class="form-inline" method="post" >
							<h5>프로젝트를 진행 할 지원자를 선택하세요</h5>
							<br />
							<div id="supportProgressmodal">
							
							</div>
									<br>
									<br> <input type="button" value="확인"> 
									<input type="reset" value="취소">
						</form>
					</div>
				</div>
				
				<div class="modal hide fade in " id="resultSupport" aria-hidden="false">
					<div class="modal-header" style="background: #2dcc70; height:80px;">
					<img src="${pageContext.request.contextPath}/resources/images/logoWhite.png"/>
						<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
						<div>
							<h3 class="findMember" style="height: 50px; color: white;"></h3>
						</div>
					</div>
					<div class="modal-body">
						<form name="freeEnd" class="form-inline" method="post" >
							<h5>프리랜서를 평가해주세요</h5>
							<br />
							<div id="resultContents">
							
							</div>
									<br>
									<br> <input type="button" value="확인"> 
									<input type="reset" value="취소">
									<input type="hidden" name="">
						</form>
					</div>
				</div>
</div>

<br><br>
<script type="text/javascript">
$(function(){
	// 클라이언트면 견적문의 리스트를 뽑지않음 
	if(eval("${LOGIN_MEMBERINFO.mem_type}" == "C")){
		$('#estimate').hide();
	}else if(eval("${LOGIN_MEMBERINFO.mem_type}" == "F")){
		$('.whtBtn').hide();
	}
	
	var pro_num = ""
	
	// 프로젝트의 위에 a태그의 상태를 눌렀을때 처리할 아작스통신(전체, 모집중, 모집마감......) 
	$('#projectoutput a').click(function(){
		var pro_cod_wht = $(this).text();
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/project/projectreload.do",
			dataType:"json",
			data:{pro_cod_wht : pro_cod_wht},
			success:function(data){
										$(".outputList").html("");
				$.each(data.projectList, function(i,v){
										var htmlCode ="";
										htmlCode+='<tr>                                                                                                                               ';
										htmlCode+='<td><h4 class="hproperty" style="width:74%"><a href="${pageContext.request.contextPath}/project/projectView.do?pro_num='+v.pro_num+'">'+v.pro_tit.substring(0,22)+' . . .</a></h4> ';
										htmlCode+='<div class = "hproperty" style="width:25%; text-align: right;">';
										if(v.pro_gress_con != null ){
											htmlCode+='<input type="button" class="btn btn-info whtBtn selectAddbtn1'+i+'" value="'+v.pro_gress_con+'">&nbsp;&nbsp; ';
										}else{
											htmlCode+='<input type="button" class="btn btn-info whtBtn selectAddbtn1'+i+'" value="지원자선택">&nbsp;&nbsp; ';
										}
										htmlCode+='<input type="button" class="btn btn-info whtBtn selectAddbtn2'+i+'" value="삭제"> ';
										htmlCode+='<input type="hidden" name="pro_num" value="'+v.pro_num+'"></div></td>  ';
										htmlCode+='<td class="centerSort"><h4>'+v.pro_dtn+'</h4></td>                                                                        ';
										htmlCode+='<td class="centerSort"><h4>'+v.pro_plan_cod+'</h4></td>                                                                   ';
										htmlCode+='<td class="centerSort"><h4>'+v.pro_term+' 일</h4></td>                                                                    ';
										htmlCode+='<td class="centerSort supportCnt'+i+'"><h4></h4><input type="hidden" name="pro_num" value="'+v.pro_num+'"></td>';
										htmlCode+='<td class="centerSort pro_cod_wht'+i+'"><h4>'+v.pro_cod_wht+'</h4></td>                                                                    ';
										htmlCode+='</tr>                                                                                                                           ';
										$(".outputList").append(htmlCode);
										
										var pro_num = $(".supportCnt"+i+">input[name=pro_num]").val();
										$.ajax({
											type:"POST",
											url:"${pageContext.request.contextPath}/supportCnt.do",
											dataType:"json",
											data:{pro_num : pro_num},
											success:function(data){
											$(".supportCnt"+i+">h4").html(data.suppotCnt+' 명');
									 	     }
										});
										
										if($(".pro_cod_wht"+i+">h4").text()=='모집중'){
											$(".selectAddbtn1"+i).hide();
											$(".selectAddbtn2"+i).hide();
										}else if($(".pro_cod_wht"+i+">h4").text()=='모집마감'){
											$(".selectAddbtn2"+i).hide();
										}else if($(".pro_cod_wht"+i+">h4").text()=='진행'){
											$(".selectAddbtn1"+i).val("마감");
											$(".selectAddbtn2"+i).val("취소");
										}else if($(".pro_cod_wht"+i+">h4").text()=='완료'){
											$(".selectAddbtn1"+i).hide();
											$(".selectAddbtn2"+i).hide();
										}else if($(".pro_cod_wht"+i+">h4").text()=='보류'){
											$(".selectAddbtn1"+i).hide();
											$(".selectAddbtn2"+i).val("프로젝트 삭제");
										}
								});
						}
		});
		
	});
	
	// 클라이언트가 버튼을 클릭했을때 처리할 버튼 이벤트 ('지원자선택, 진행, 마감.....')
	$(document).on('click','.whtBtn',function(){
		
		// 클릭한 버튼이 지원자 선택이라면 그 프로젝트에 지원한 프리랜서의 지원자를 체크박스로 모달창에 띄워준다.
		if($(this).val()=='지원자선택'){
			
			pro_num = $(this).siblings("input[type=hidden]").val();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/supportList.do",
				dataType:"json",
				data:{pro_num : pro_num},
				success:function(data){
					var htmlCode = "";
					$.each(data.supportList, function(i,v){
						htmlCode += '<div class="checkboxMeeting"><input type="checkbox" class="supportMeet" name ="me_free_nm" value="'+v.mem_id+'('+v.mem_nm+')"/>&nbsp;<h4 class="hproperty">'+v.mem_id+'('+v.mem_nm+')</h4>';
						htmlCode += ' 미팅 날짜 신청 :  <input type="text" class="meet_date"/><input type="hidden" name="me_cnt_nm" value="${LOGIN_MEMBERINFO.mem_id}"><br>';
						htmlCode += '<input type="hidden" name="me_mem_id" value="${LOGIN_MEMBERINFO.mem_id}"><input type="hidden" name ="me_free_nm" value="'+v.mem_id+'('+v.mem_nm+')"></div>';
						});
 				    	$("#supportSelectmodal").html(htmlCode);
			 	     }
			});
						 $("#selectSupport").modal().show();
						 $(".modal-backdrop").show();
						 
		// 클릭한 버튼이 프로젝트진행 이라면 미팅을 본 프리랜서를 체크박스로 모달창에 띄워준다.				 
		}else if($(this).val()=='프로젝트진행'){
			
			pro_num = $(this).siblings("input[type=hidden]").val();
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/project/projectInfo.do",
				dataType:"json",
				data:{pro_num : pro_num},
				success:function(data){
					var htmlCode =""
					var datavalue = data.projectInfo.pro_sup_mem_id.split(',');
					for(i=0; i< datavalue.length; i++){
						
						htmlCode += '<input type="checkbox" class="supportCheck" value="'+datavalue[i]+'"/>&nbsp;<h4 class="supportCheck hproperty">'+datavalue[i]+'</h4><br>';
					}
					
 				    	$("#supportProgressmodal").html(htmlCode);
			 	     }
			});
						 $("#supportProgress").modal().show();
						 $(".modal-backdrop").show();
		// 클릭한 버튼이 마감일 시
		}else if($(this).val()=='마감'){
			pro_num = $(this).siblings("input[type=hidden]").val();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/project/projectInfo.do",
				dataType:"json",
				data:{pro_num : pro_num},
				success:function(data){
					var datavalue = data.projectInfo.pro_sup_mem_id.split(',');
					var htmlCode =""
					for(i=1; i<= datavalue.length; i++){
						var datacut = datavalue[i-1].trim().split('(');
						$.ajax({
							type:"POST",
							url:"${pageContext.request.contextPath}/freelancer/freeInfo.do",
							async : false,
							dataType:"json",
							data:{mem_id : datacut[0]},
							success:function(data){
								if(data.freelancerInfo.file_save_nm !=null){
									htmlCode += '<img class="img-responsive img-circle" src="http://192.168.201.222/file/'+data.freelancerInfo.file_save_nm+'" style="width: 50px; height: 50px;">';
								}else{
									htmlCode += '<img class="img-responsive img-circle pull-lfet" src="${pageContext.request.contextPath}/resources/images/profile.png" style="width: 50px; height: 50px;">';
								}
							}
						});
						
						htmlCode += '&nbsp;<h4 class="supportCheck hproperty" style="width: 150px;">'+datavalue[i-1]+'</h4>&nbsp;'; 
						htmlCode += '<input type="hidden" name="mem_id" value="'+datacut[0]+'">';
						htmlCode +='<span class="star-input">                                                                   ';
						htmlCode +='  <span class="input">                                                                      ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p1'+i+'" value="0.5"><label for="p1'+i+'">0.5</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p2'+i+'" value="1.0"><label for="p2'+i+'">1.0</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p3'+i+'" value="1.5"><label for="p3'+i+'">1.5</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p4'+i+'" value="2.0"><label for="p4'+i+'">2.0</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p5'+i+'" value="2.5"><label for="p5'+i+'">2.5</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p6'+i+'" value="3.0"><label for="p6'+i+'">3.0</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p7'+i+'" value="3.5"><label for="p7'+i+'">3.5</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p8'+i+'" value="4.0"><label for="p8'+i+'">4.0</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p9'+i+'" value="4.5"><label for="p9'+i+'">4.5</label>     ';
						htmlCode +='    <input type="radio" name="star-input'+i+'" id="p10'+i+'" value="5.0"><label for="p10'+i+'">5.0</label>  ';
						htmlCode +='  </span>                                                                                   ';
						htmlCode +='  <h4 class="hproperty"><output>0.0</output><input type="hidden" name="starnum" for="star-input"></input>점</h4>                                              ';
						htmlCode +='</span><br><br><input type="hidden" name="pro_num" value="'+pro_num+'">                                                                                     ';
					}
						$('#resultContents').html(htmlCode);
			 	     }
			});
			
			 $("#resultSupport").modal().show();
			 $(".modal-backdrop").show();
			

		}else if($(this).val()=='취소'){
			pro_num = $(this).siblings("input[type=hidden]").val();
			var pro_cod_wht = '보류';
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/project/projectUpdate.do",
				dataType:"json",
				data:{pro_num : pro_num, pro_cod_wht: pro_cod_wht},
				beforeSend:function(){
			 		swal({
						  title: '프로젝트를 취소합니다.',
						  text: '잠시만 기다려 주세요...',
						  timer: 20000,
						  showConfirmButton: false
						});
			    },complete:function(){
					swal.close();
					$('#projectoutput .hold').click();
				},
				success:function(){
					}
			});
			
		}else if($(this).val()=='프로젝트 삭제'){
			pro_num = $(this).siblings("input[type=hidden]").val();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/project/delajaxproject.do",
				async : false,
				dataType:"json",
				data:{pro_num : pro_num},
				success:function(){
					}
			});
			$('#projectoutput .allList').click();
		}
		
		
	});
	
	// 프리랜서가 버튼을 클릭했을 때 처리할 이벤트('지원','삭제')
	$(document).on('click','.freeBtn',function(){
		if($(this).val()=='지원'){
			pro_num = $(this).siblings('input[type=hidden]').val();
			$(location).attr('href','${pageContext.request.contextPath}/project/projectView.do?pro_num='+pro_num);
		}else if($(this).val()=='삭제'){
			pro_num = $(this).siblings("input[type=hidden]").val();
			var est_req = 'Z';
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/project/projectUpdate.do",
				dataType:"json",
				data:{pro_num : pro_num, est_req : est_req},
				success:function(){
					$(location).attr('href','${pageContext.request.contextPath}/projectMng.do');	
					}
			});
		}
		
	});
	
	// 클라이언트가 지원자 선택버튼을 눌렀을때 모달안에 프리랜서들을 출력하고 버튼상태를 아작스통신을 이용하여 바꿔주는 클릭 이벤트
	$("form[name=supportMeetSet] input[type=button]").click(function(){
		var appendCode = "";
		var htmlCode = "";
		var $form = $('<form></form>');
			$(".supportMeet:checked").each(function() {
				
				htmlCode += $(this).val()+',';
			});
			
			var pro_sup_mem_id = htmlCode.slice(0,-1);
			
			var pro_gress_con = '프로젝트진행';
			
				$.ajax({
						type:"POST",
						url:"${pageContext.request.contextPath}/project/projectUpdate.do",
						dataType:"json",
						data:{pro_num : pro_num, pro_sup_mem_id : pro_sup_mem_id, pro_gress_con : pro_gress_con },
						success:function(data){}
					});
			
			$form.attr('action', '${pageContext.request.contextPath}/mettingInsert.do');
			$form.attr('method', 'post');
			$form.appendTo('body');
			$(".supportMeet:checked").each(function() {
			    $form.append($(this).parent().html());
				var date = $(this).siblings(".meet_date").val();
			    $form.append('<input type="hidden" name ="me_date" value="'+date+'">');
			});
			$form.submit();
			swal({
				  title: '화상미팅 설정중입니다.',
				  text: '잠시만 기다려 주세요...',
				  timer: 60000,
				  showConfirmButton: false
				});

			
		});
	
	// 클라이언트가 진행 프로젝트 진행 버튼을 눌렀을 때 프로젝트의 상태를 진행으로 바꿔주고 진행 상태 목록으로 이동하는 이벤트
	$("form[name=supportProgressSet] input[type=button]").click(function(){
		var htmlCode = "";
			$(".supportCheck:checked").each(function() {
				htmlCode += $(this).val()+',';
			});
			var pro_sup_mem_id = htmlCode.slice(0,-1);
			var pro_cod_wht = "진행"
				$.ajax({
						type:"POST",
						url:"${pageContext.request.contextPath}/project/projectUpdate.do",
						dataType:"json",
						data:{pro_num : pro_num, pro_sup_mem_id : pro_sup_mem_id, pro_cod_wht : pro_cod_wht, pro_st_date : "1" },
					 	beforeSend:function(){
					 		swal({
								  title: '프로젝트를 진행합니다.',
								  text: '잠시만 기다려 주세요...',
								  timer: 20000,
								  showConfirmButton: false
								});
					    },
					    complete:function(){
					    	 swal.close();
					    	$("#supportProgress").hide();
							$(".modal-backdrop").hide();
					    	$('#projectoutput .progress').click();
					    },
						success:function(data){
					 	}
					});
			

		});
	
	 $("#supportSelectmodal").on("click",".meet_date", function(){
		 $(this).datetimepicker({
          language:  'ko',
          linkFormat: "yyyy-mm-dd hh:ii",
          autoclose: 1,
          todayHighlight: 1
       }).datetimepicker( "show" );
	 });
	 
	 $(document).on("click","input[type=radio]", function(){
		 $(this).parent().siblings("h4").children("input[name=starnum]").val($(this).val());
		 $(this).parent().siblings("h4").children("output").val($(this).val());
	 });
	 
	 $("form[name=freeEnd] input[type=button]").click(function(){
		 pro_num = $(this).siblings("#resultContents").children("input[name=pro_num]").val();
		 var $form = $('<form></form>');
		 	$form.attr('action', '${pageContext.request.contextPath}/member/updatestarInfo.do');
			$form.attr('method', 'post');
			$form.appendTo('body');
			$form.append($(this).parent().html());
			
			var pro_cod_wht = '완료';
			$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/project/projectUpdate.do",
			dataType:"json",
			data:{pro_num : pro_num, pro_cod_wht: pro_cod_wht},
			beforeSend:function(){
		 		swal({
					  title: '프로젝트를 종료합니다.',
					  text: '잠시만 기다려 주세요...',
					  timer: 20000,
					  showConfirmButton: false
					});
		    },complete:function(){
				swal.close();
				$form.submit();
			},
			success:function(){
				}
			});
			
			
		
		});

	});
</script>
</body>
</html>