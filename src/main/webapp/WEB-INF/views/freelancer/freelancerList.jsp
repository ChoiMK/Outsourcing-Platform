<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.star-input>.input>label {
    cursor: default; 
}
.icon-3x{
	width:38px; 
	height:15px;
	color:#2dcc70;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div class="center container">
	<div id="ajaxList">
		<c:forEach items="${freelancerList}" var="freelancerInfo" varStatus="status">
			<ul class="gallery col-4" >
				<li id="enters">
					<div id="previewDiv" class="preview" style="border: 1px solid #2dcc70; padding: 10px;">
						<c:if test="${freelancerInfo.mem_coms eq 'T'}">
							<i class="icon-group pull-right icon-3x" ></i>
						</c:if>
						<c:if test="${freelancerInfo.mem_coms eq 'C'}">
							<i class="icon-user pull-right icon-3x" ></i>
						</c:if>
						<c:if test="${!empty freelancerInfo.file_save_nm}">
							<img class="img-responsive img-circle" src="http://192.168.201.222/file/${freelancerInfo.file_save_nm}" style="width: 200px; height: 200px;">
						</c:if>
						<c:if test="${empty freelancerInfo.file_save_nm}">
							<img class="img-responsive img-circle" src="${pageContext.request.contextPath}/resources/images/profile.png" style="width: 200px; height: 200px;">
						</c:if>
					
							
						<h3>
							<a class="name" href="#">${freelancerInfo.mem_nm}
							<input type="hidden" name="mem_id" value="${freelancerInfo.mem_id}" />
							</a>
						</h3>
						<div>
							<span id="starview${status.count}" class="star-input"> <span
								class="input"> </span> <output>
								<b>${freelancerInfo.mem_grd}</b>점</output> 
						   <script type="text/javascript">
							$(function(){
								$('#starview${status.count}>span').append('<input type="checkbox" checked="checked" onclick="return false" name="star-input" id="p'+${freelancerInfo.mem_grd}*2+'" value="'+${freelancerInfo.mem_grd}+'"><label for="p'+${freelancerInfo.mem_grd}*2+'">'+${freelancerInfo.mem_grd}+'</label>');
							});		
						</script>
							</span>
						</div>
						<hr>
						<c:choose>
							<c:when test="${freelancerInfo.mem_tig_nm eq null }">
								<a href="#" data-placement="top"  data-trigger="hover" data-toggle="popover" title="타이틀 없음" data-content="${freelancerInfo.mem_nm }님이 획득한 타이틀이 없습니다."><img src="${pageContext.request.contextPath}/resources/images/Titleimages/noTitle.png" style="width:40px; heigth:40px" /></a>
							</c:when>
							<c:otherwise>
								<c:forTokens items="${freelancerInfo.mem_tig_nm }" delims="," var="item" begin="0" step="1" end="2">
									<c:forTokens items="${item }" delims="_" var="title">
										
										<c:if test="${title eq 'CSS' || title eq 'HTML' || title eq 'JSP' || title eq 'JavaScript' || title eq 'OS' || title eq 'SQL' || title eq 'JAVA' }" var="subject2">
											<c:set value="${title }" var="subject" />
										</c:if>
										
										<c:if test="${title eq 'H' || title eq 'M' || title eq 'B' }" var="grade2">
											<c:set value="${title }" var="grade" />
											<c:choose>
												<c:when test="${grade eq 'H' }">
													<c:set value="고급" var="high" />
													<c:set value="80%" var="Hrate" />
													<a href="#" data-placement="top"  data-container="body"  data-trigger="hover" data-toggle="popover" title="${subject }  ${high } " data-content="${subject } 문제의 정답률 ${Hrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:40px; max-height:40px;margin-left: 15px; margin-right: 15px; " /></a>
												</c:when>
												
												<c:when test="${grade eq 'M' }">
													<c:set value="중급" var="mid" />
													<c:set value="50%" var="Mrate" />
													<a href="#" data-placement="top"  data-container="body" data-trigger="hover" data-toggle="popover" title="${subject }  ${mid } " data-content="${subject } 문제의 정답률 ${Mrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:40px; max-height:40px;margin-left: 15px; margin-right: 15px; " /></a>
												</c:when>
												
												<c:when test="${grade eq 'B' }">
													<c:set value="초급" var="basic" />
													<c:set value="30%" var="Brate" />
													<a href="#" data-placement="top" data-container="body" data-trigger="hover" data-toggle="popover" title="${subject }  ${basic } " data-content="${subject } 문제의 정답률 ${Brate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:40px; max-height:40px;margin-left: 15px; margin-right: 15px;  " /></a>
												</c:when>
											</c:choose>
										</c:if>
									</c:forTokens>
								</c:forTokens>
							</c:otherwise>
						</c:choose>
						
					</div>
				</li>
			</ul>
		</c:forEach>
		</div>

	</div>
<script type="text/javascript">
$(function(){
	
	$("[data-toggle='popover']").popover();
	
	$(document).on('click','.name',function(){
		var mem_id = $(this).find('input').val(); 
		$(location).attr('href','${pageContext.request.contextPath}/freelancer/freelancerView.do?mem_id='+mem_id);
	});
	
	var endNum = 8;
	var index = 9;
	$(window).scroll(function(){
		$("[data-toggle='popover']").popover();
		
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	    	$.ajax({
	    		
				type:"POST",
				url:"${pageContext.request.contextPath}/freelancer/freelancerList.do",
				dataType:"json",
				data:{endNum : endNum},
				success:function(result){
					
					$.each(result.freelancerList, function(i,v){
						
					var htmlCode = "";
					htmlCode +=	"<ul class='gallery col-4' >   ";
					htmlCode +=	"				<li id='enters'>  ";
					htmlCode +=	"					<div class='preview' style='border: 1px solid #2dcc70; padding: 10px;'>          ";
													if(v.mem_coms =='T'){
					htmlCode +=	"						<i class='icon-group pull-right icon-3x'></i>	";
													}
													if(v.mem_coms =='C'){
			        htmlCode +=	"						<i class='icon-user pull-right icon-3x'></i>	";
													}
													if(v.file_save_nm != null){
				    htmlCode +=	"                      <img class='img-responsive img-circle' src='http://192.168.201.222/file/"+v.file_save_nm+"' style='width: 200px; height: 200px;'>  ";
													}
													if(v.file_save_nm == null){
					htmlCode +=	" 					   <img class='img-responsive img-circle' src='${pageContext.request.contextPath}/resources/images/profile.png' style='width: 200px; height: 200px;'> ";
													}
					htmlCode +=	"						<h3> ";
					htmlCode +=	"							<a class='name' href='#'>"+v.mem_nm+"<input type='hidden' name='mem_id' value="+v.mem_id+" /> </a> ";                                                                                                                                                                                                                                                                                             
					htmlCode +=	"						</h3>   ";
					htmlCode +=	"						<div>   ";
					htmlCode +=	"							<span id='starview"+index+"' class='star-input'>  ";
					htmlCode +=	"							<span class='input'> </span> <output><b>"+v.mem_grd+"</b>점</output> ";
					htmlCode +=	"							</span>    ";                                                                                                                                                                                                                                                                                                                                        
					htmlCode +=	"						</div>    ";                                                                                                                                                                                                                                                                                                                                             
					htmlCode +=	"						<hr>     ";                                                
													if(v.mem_tig_nm == null){
					htmlCode += " 						<a href='#' data-placement='top'  data-trigger='hover' data-toggle='popover' title='타이틀 없음' data-content='"+v.mem_nm +"님이 획득한 타이틀이 없습니다.'><img src='${pageContext.request.contextPath}/resources/images/Titleimages/noTitle.png' style='width:40px; height:40px;' /></a>";
													} else {
														var titleList = v.mem_tig_nm;
														var array = titleList.split(',');
														for(var i=0; i < array.length; i++) {
															if( i > 2 ) {
																
															} else {
																var title = array[i];
																var titleArray = title.split('_');
																var subject = titleArray[0];
																var grade = titleArray[1];
																if( grade == "H") {
																	var Hrate = "80%";
																	var high = "고급";
					htmlCode += " 									<a href='#' data-placement='top'  data-trigger='hover' data-container='body' data-toggle='popover' title='"+subject+" "+high+"' data-content='"+subject+" 문제의 정답률 "+Hrate+" 이상시 타이틀 획득'><img src='${pageContext.request.contextPath}/resources/images/Titleimages/"+title+".png' style='width:40px; max-height:40px; padding-right: 20px; padding-left: 20px;' /></a>";													
																}  else if ( grade == "M" ) {
																	var Mrate = "50%";
																	var mid = "중급";
					htmlCode += " 									<a href='#' data-placement='top'  data-trigger='hover' data-container='body' data-toggle='popover' title='"+subject+" "+mid+"' data-content='"+subject+"'문제의 정답률'"+Mrate+"'이상시 타이틀 획득'><img src='${pageContext.request.contextPath}/resources/images/Titleimages/"+title+".png' style='width:40px; max-height:40px; padding-right: 20px; padding-left: 20px;' /></a>";
																}  else if ( grade == "B" ) {
																	var Brate = "30%";
																	var basic = "초급";
					htmlCode += " 									<a href='#' data-placement='top'  data-trigger='hover' data-container='body' data-toggle='popover' title='"+subject+" "+basic+"' data-content='"+subject+" 문제의 정답률 "+Brate+" 이상시 타이틀 획득'><img src='${pageContext.request.contextPath}/resources/images/Titleimages/"+title+".png' style='width:40px; max-height:40px; padding-right: 20px; padding-left: 20px;' /></a>";
																}
															}
														}
													}
					htmlCode +=	"					</div>    ";
					htmlCode +=	"				</li>    ";
					htmlCode +=	"			</ul>   ";
	              	 
						$("#ajaxList").append(htmlCode);
		              	$('#starview'+index+'>span').append('<input type="checkbox" checked="checked" onclick="return false" name="star-input" id="p'+v.mem_grd*2+'" value="'+v.mem_grd+'"><label for="p'+v.mem_grd*2+'">'+v.mem_grd+'</label>');
		              	index++;
					});
						endNum += 8;
					}
	    	});
	    }
	});
	
	
	
	
});
	
</script>


</body>
</html>