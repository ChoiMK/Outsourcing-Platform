<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

table {
	margin: 20px 20px 20px 20px;
	width : 97%;
}

proTit {
	width: 97%;
}

.serport_btn:hover {
	background-color: #e83570;
}

.bodyst {
	padding: 8px;
	line-height: 20px;
	vertical-align: middle;
	background-color: white;
	border-radius: 10px;
}

.hproperty {
	display: inline-block;
}

.topTit {
	text-align: left;
	margin-left: 50px;
}
</style>
</head>
<body>
	<br>
	<br>
	<div class="container">
		<h3 class="hproperty">
			<strong>프로젝트 상세정보</strong>
		</h3>
		<hr>
	</div>
	<div class="container bodyst" style="min-height: 500px; overflow: hidden;">
		
		<div style=" float:left;width:80%;">
			<a style="color: #152d2c;">	<h2 class='proTit topTit hproperty'> <strong>${projectInfo.pro_tit}</strong></h2></a>
		</div>
		
		<div style=" float:right;width:10%;height:60px;">
			<h3 style="color:#2dcc70;" class='hproperty' style="text-align:left;">${projectInfo.pro_cod_wht }</h3>
		</div>
		
		<br><br><br><hr style="background:#a19d9d; height:2px;margin-right: 39px;margin-left: 49px;"><br>
		
		<table style="width:100%;margin-left: 0px;margin-right: 0px; margin-top: auto;">
			<tr>
				<th style="color:#a19d9d;">분야</th>
				<th style="color:#a19d9d;">예상기간</th>
				<th style="color:#a19d9d;">예상비용</th>
				<th style="color:#a19d9d;">모집마감일</th>
			</tr>
			<tr>
				<td style=" text-align:center;width:25%;"><h3 class="hproperty">${projectInfo.pro_dtn }</h3></td>
				<td style=" text-align:center;width:25%;"><h3 class="hproperty">${projectInfo.pro_term}일</h3></td>
				<td style=" text-align:center;width:25%;"><h3 class="hproperty">${projectInfo.pro_bud }</h3></td>
				<c:set var="pro_dea_date" value="${projectInfo.pro_dea_date }"/>
				<td style="text-align:center;width:25%;"><h3 class="hproperty">${d_day }일 남음</h3></td>
			</tr>
		</table>
		
		
		
		
		<div class="topTit hproperty" style="width:100%;">
			<h5 class="hproperty" style="color:#a19d9d;">관련기술 :</h5>
			<c:forTokens items="${projectInfo.pro_need_tec }" delims="," var="item">
				<a class="btn btn-mini btn-primary">${item }</a>
			</c:forTokens>
		</div>
		
		<br>
		
		<div class="topTit hproperty">
			<h5 class="hproperty" style="color:#a19d9d;">기획상태 :</h5>
			<h5 class="hproperty">${projectInfo.pro_plan_cod }</h5>
		</div>
		
		<hr>
		<div style="margin-left: 30px;">상세 정보</div>
		<div style="margin-left: 30px;">${projectInfo.pro_con }</div>
	</div>
	<div class="container">
		<div style="margin: -50px 15px 0 0;" align="right">
			<input type="button" class="serport_btn btn btn-info" name="delprojectbtn" value="삭제하기" />
			<input type="button" class="serport_btn btn btn-info" name="supportbtn" value="지원하기" />
			<input type="button" class="serport_btn btn btn-info" name="moveprojectList" value="프로젝트목록" />
		</div>
		<br> <br> <br>
		
		<h3 class="hproperty">
			<strong>프로젝트문의 </strong>
		</h3>
		
		<hr>
		<div id="commListbody">
		
		<c:forEach items="${commtList }"  var="commtInfo">
		
		<c:if test="${commtInfo.com_dep == 0 }">
		<div>
		<div class="bodyst" style="width: 100%;">
			<table>
				<tr>
					<td style = "vertical-align: top; width: 30px;">
					
					
					
					
					<c:if test="${!empty commtInfo.mem_profile }" > 
                     	<img src="http://192.168.201.222/file/${commtInfo.mem_profile}" class="img-responsive img-circle" style="width: 50px; height: 50px;"> 
                    </c:if> 
                    <c:if test="${empty commtInfo.mem_profile }">
                    	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">
                    </c:if>
					<span style="margin-left: 10px;">${commtInfo.mem_nm}</span>
					<br><br>
					<div>
						${commtInfo.com_con}
					</div>
						<br><br>
						<div style="margin: -30px 15px 0 0;" align="right">
							<input class="btn btn-info serport_btn" name="replaybtn" align="right" type="button" value="댓   글">
							<input type="hidden" name="com_num" value="${commtInfo.com_num }"/>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<br>
		</div>
		</c:if>
		
		<c:if test="${commtInfo.com_dep != 0 }">
		<div>
			<div  class="bodyst" style="width: 100%;">
			<table>
				<tr>
					<td style = "vertical-align: top; width: 30px;">
						<div style="margin-top: 12px;">
							<i class="icon-level-up icon-2x icon-rotate-90"
								style="margin-top: -30px;"></i>
						</div>
					</td>
					<td>
						<div style="margin-left: 15px;">
							<c:if test="${!empty commtInfo.mem_profile }" > 
                     			<img src="http://192.168.201.222/file/${commtInfo.mem_profile}" class="img-responsive img-circle" style="width: 50px; height: 50px;"> 
                    		</c:if> 
                    		<c:if test="${empty commtInfo.mem_profile }">
                    			<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">
                    		</c:if>
							<span style="margin-left: 10px;">${commtInfo.mem_nm}</span>
							<br><br>
							${commtInfo.com_con}
						</div>
						<br><br>
					</td>
				</tr>
			</table>
		</div>
		<br>
		</div>
		</c:if>
		</c:forEach>
		
		</div>
		
		<form id="insertcmtForm" class = "insertcmtFormt" action="${pageContext.request.contextPath}/insertcommt.do" method="post" >
		<div class="bodyst" style="height: 225px; width: 100%;">
			<div><input type="hidden" name="pro_num" value="${projectInfo.pro_num }">
					<c:if test="${!empty mem_profile }" > 
                     	<img src="http://192.168.201.222/file/${mem_profile}" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;"> 
                    </c:if> 
                    <c:if test="${empty mem_profile }">
                    	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;">
                    </c:if>
				<textarea style="resize: none; margin: 20px 0px 10px 50px; width: 800px; height: 140px;" name="com_con"></textarea>
				<br>
			</div>
			<div class="hproperty" style="width:100px; margin: 10px 0 0 46px; text-align: center;">
				<h4 class="hproperty"><strong>${LOGIN_MEMBERINFO.mem_nm}</strong></h4>
			</div>
			<div style="margin: -30px 15px 0 0;" align="right">
				<input class="btn btn-info serport_btn" align="right" type="button" name="submitbtn" value="작성하기">
			</div>
		</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			// 현재 로그인한 회원이 작성자가 아니면 삭제 버튼을 숨긴다.
			if(eval("${LOGIN_MEMBERINFO.mem_id}" != "${projectInfo.mem_id}")){
				$("input[name=delprojectbtn]").hide();
			}
			// 현재 로그인한 회원이 작성자가 맞거나 클라이언트면 지원하기 버튼을 숨긴다.
			if(eval("${LOGIN_MEMBERINFO.mem_id}" == "${projectInfo.mem_id}") || "${LOGIN_MEMBERINFO.mem_type}" == "C"){
				$("input[name=supportbtn]").hide();
			}
			
			$("input[name=moveprojectList]").click(function(){
				$(location).attr('href','${pageContext.request.contextPath}/project/projectList.do');
			});
			
			$("input[name=delprojectbtn]").click(function(){
				var pro_num = $("input[name='pro_num']").val();
				
				swal({
					  title: '프로젝트 삭제',
					  text: "프로젝트를 삭제 하시겠습니까?",
					  type: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'OK'
					}).then(function () {
						$(location).attr('href','${pageContext.request.contextPath}/project/delproject.do?pro_num='+pro_num);
					}).catch(swal.noop);
				
			});
			
			$("input[name=supportbtn]").click(function(){
				var pro_num = $("input[name='pro_num']").val();
				swal({
					  title: '프로젝트 지원중 ...',
					  text: '잠시만 기다려 주세요.',
					  timer: 10000,
					  showConfirmButton: false
					});
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/insertSuppert.do",
					dataType:"json",
					data:{pro_num : pro_num},
					success:function(data){
						swal(
								  data.messageTit,
								  data.messageCon,
								  data.messageType
								);
				 	     }
				});

			});
			
			// 등록과 리스트를 가져와 출력
			$("input[name='submitbtn']").click(function() {
				$('#insertcmtForm').ajaxSubmit({
					dataType:'json',
					success:function(data){
					var htmlCode = "";
					// 댓글이면 깊이가 1
					$.each(data.commtList, function(i,v){
						
						// 댓글이 아니라면 출력
						if(v.com_dep == 0 || v.com_dep == '0' ){
						htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                                ';
						htmlCode += '	<table>                                                                                                                                                                  ';
						htmlCode += '		<tr>                                                                                                                                                                 ';
						htmlCode += '			<td>        ';
						if(v.mem_profile != null){
	             		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
						}else{
	            		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
						}
						htmlCode += '			<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                                ';
						htmlCode += '			<br><br>                                                                                                                                                         ';
						htmlCode += '			<div> '+v.com_con+'                                                                                                                                                            ';
						htmlCode += '			</div>                                                                                                                                                           ';
						htmlCode += '				<br><br>                                                                                                                                                    ';
						htmlCode += '				<div style="margin: -30px 15px 0 0;" align="right">                                                                                                          ';
						htmlCode += '					<input class="btn btn-info serport_btn" name="replaybtn" align="right" type="button" value="댓   글"> <input type="hidden" name="com_num" value="'+v.com_num+'"/>                                                    ';
						htmlCode += '				</div>                                                                                                                                                       ';
						htmlCode += '			</td>                                                                                                                                                            ';
						htmlCode += '		</tr>                                                                                                                                                                ';
						htmlCode += '	</table>                                                                                                                                                                 ';
						htmlCode += '</div>                                                                                                                                                                       ';
						htmlCode += '<br></div>                                                                                                                                                                         ';
						}
						
					// 댓글이면 출력
					else{
						
					htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                              ';
					htmlCode += '	<table>                                                                                                                                                                ';
					htmlCode += '		<tr>                                                                                                                                                               ';
					htmlCode += '			<td  style = " width: 30px; vertical-align: top; ">                                                                                                                           ';
					htmlCode += '				<div style="margin-top: 12px;">                                                                                                                            ';
					htmlCode += '					<i class="icon-level-up icon-2x icon-rotate-90"                                                                                                        ';
					htmlCode += '						style="margin-top: -30px;"></i>                                                                                                                    ';
					htmlCode += '				</div>                                                                                                                                                     ';
					htmlCode += '			</td>                                                                                                                                                          ';
					htmlCode += '			<td>                                                                                                                                                           ';
					htmlCode += '				<div style="margin-left: 15px;">                                                                                                                           ';
					if(v.mem_profile != null){
	             		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
						}else{
	            		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
						}
					htmlCode += '					<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                      ';
					htmlCode += '					<br><br>'+v.com_con+'                                                                                                                                               ';
					htmlCode += '				</div>                                                                                                                                                     ';
					htmlCode += '				<br><br>                                                                                                                                                   ';
					htmlCode += '			</td>                                                                                                                                                          ';
					htmlCode += '		</tr>                                                                                                                                                              ';
					htmlCode += '	</table>                                                                                                                                                               ';
					htmlCode += '</div>                                                                                                                                                                    ';
					htmlCode += '<br></div>                                                                                                                                                                      ';
						
					}
					});
					
					$('#commListbody').html(htmlCode);
			 	     }
			
			 	});
				
				$("textarea[name='com_con']").val('');
				
			});
			
			
			// 댓글 버튼 클릭시 폼 생성
			$(document).on('click','input[name="replaybtn"]',function(){
				
				$('.insertcmtFormt').hide();
				$('.insertReplyt').hide();
				var commtprimary = $(this).siblings("input[name='com_num']").val();
				var htmlCode ="";
				htmlCode +='<form id="insertReply" class="insertReplyt" action="${pageContext.request.contextPath}/insertreplycommt.do" method="post" >                                ';
				htmlCode +='  <input type="hidden" name="com_num" value="'+commtprimary+'"/>                                                         ';
				htmlCode +='<div class="bodyst" style="height: 225px; width: 100%;">                                                                         ';
				htmlCode +='	<div><input type="hidden" name="pro_num" value="${projectInfo.pro_num }">                                                                                                                        ';
				htmlCode +='<c:if test="${!empty mem_profile }" >                                                                                                                                                           ';
				htmlCode +='        	<img src="http://192.168.201.222/file/${mem_profile}" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;">                  ';
				htmlCode +='       </c:if>                                                                                                                                                                                  ';
				htmlCode +='       <c:if test="${empty mem_profile }">                                                                                                                                                      ';
				htmlCode +='       	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;">       ';
				htmlCode +='       </c:if>                                                                                                                                                                                  ';
				htmlCode +='		<textarea style="resize: none; margin: 20px 0px 10px 50px; width: 800px; height: 140px;" name="com_con"></textarea>      ';
				htmlCode +='		<br>                                                                                                                     ';
				htmlCode +='	</div>                                                                                                                       ';
				htmlCode +='	<div class="hproperty" style="width:100px; margin: 10px 0 0 46px; text-align: center;">                                                                       ';
				htmlCode +='		<h4 class="hproperty"><strong>${LOGIN_MEMBERINFO.mem_nm}</strong></h4>                                                                                      ';
				htmlCode +='	</div>                                                                                                                       ';
				htmlCode +='	<div style="margin: -30px 15px 0 0;" align="right">                                                                          ';
				htmlCode +='		<input class="btn btn-info serport_btn" align="right" type="button" name="replysubmit" value="댓글작성">                   ';
				htmlCode +='		<input class="btn btn-info serport_btn" align="right" type="button" name="replycancel" value="취소">                   ';
				htmlCode +='	</div>                                                                                                                       ';
				htmlCode +='</div>                                                                                                                           ';
				htmlCode +='</form>                                                                                                                          ';
				$(this).parent().parent().parent().parent().parent().parent().parent().append(htmlCode);
				
			});
			
			// 댓글 작성하기 버튼 클릭시 보내주고 리스트 불러오기
			$(document).on('click','input[name="replysubmit"]',function(){
				$('#insertReply').ajaxSubmit({
					dataType:'json',
					success:function(data){
					var htmlCode = "";
					// 댓글이면 깊이가 1
					$.each(data.commtList, function(i,v){
						
						// 댓글이 아니라면 출력
						if(v.com_dep == 0 || v.com_dep == '0' ){
						htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                                ';
						htmlCode += '	<table>                                                                                                                                                                  ';
						htmlCode += '		<tr>                                                                                                                                                                 ';
						htmlCode += '			<td>        ';    
						if(v.mem_profile != null){
		             		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
						}else{
		            		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
						}
						htmlCode += '			<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                                ';
						htmlCode += '			<br><br>                                                                                                                                                         ';
						htmlCode += '			<div> '+v.com_con+'                                                                                                                                                            ';
						htmlCode += '			</div>                                                                                                                                                           ';
						htmlCode += '				<br><br>                                                                                                                                                    ';
						htmlCode += '				<div style="margin: -30px 15px 0 0;" align="right">                                                                                                          ';
						htmlCode += '					<input class="btn btn-info serport_btn" name="replaybtn" align="right" type="button" value="댓   글"><input type="hidden" name="com_num" value="'+v.com_num+'"/>                                                    ';
						htmlCode += '				</div>                                                                                                                                                       ';
						htmlCode += '			</td>                                                                                                                                                            ';
						htmlCode += '		</tr>                                                                                                                                                                ';
						htmlCode += '	</table>                                                                                                                                                                 ';
						htmlCode += '</div>                                                                                                                                                                       ';
						htmlCode += '<br></div>                                                                                                                                                                         ';
						}
						
					// 댓글이면 출력
					else{
						
					htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                              ';
					htmlCode += '	<table>                                                                                                                                                                ';
					htmlCode += '		<tr>                                                                                                                                                               ';
					htmlCode += '			<td style = "width: 30px; vertical-align: top; ">                                                                                                                           ';
					htmlCode += '				<div style="margin-top: 12px;">                                                                                                                            ';
					htmlCode += '					<i class="icon-level-up icon-2x icon-rotate-90"                                                                                                        ';
					htmlCode += '						style="margin-top: -30px;"></i>                                                                                                                    ';
					htmlCode += '				</div>                                                                                                                                                     ';
					htmlCode += '			</td>                                                                                                                                                          ';
					htmlCode += '			<td>                                                                                                                                                           ';
					htmlCode += '				<div style="margin-left: 15px;">                                                                                                                           ';
					if(v.mem_profile != null){
	             		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
					}else{
	            		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
					}
					htmlCode += '					<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                      ';
					htmlCode += '					<br><br>'+v.com_con+'                                                                                                                                               ';
					htmlCode += '				</div>                                                                                                                                                     ';
					htmlCode += '				<br><br>                                                                                                                                                   ';
					htmlCode += '			</td>                                                                                                                                                          ';
					htmlCode += '		</tr>                                                                                                                                                              ';
					htmlCode += '	</table>                                                                                                                                                               ';
					htmlCode += '</div>                                                                                                                                                                    ';
					htmlCode += '<br></div>                                                                                                                                                                      ';
						
					}
					});
					
					$('#commListbody').html(htmlCode);
			 	     }
			
				
			 	});
				
				$("textarea[name='com_con']").val('');
				$('.insertReplyt').hide();
				$('#insertcmtForm').show();
			});
			
			$(document).on('click','input[name="replycancel"]',function(){
				$('.insertReplyt').hide();
				$('#insertcmtForm').show();
			});

		});
	</script>
</body>
</html>