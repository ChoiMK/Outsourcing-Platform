<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.bodyst {
	padding: 8px;
	line-height: 20px;
	vertical-align: middle;
	background-color: white;
	border-radius: 10px;
	margin-bottom:50px;
}
#inquery{
    width: 124px;
    height: 33px;
	margin-top:85px;
}


</style>
</head>
<body>
	
	<div class="container bodyst">
		<div class="pull-left center"> 
		<c:if test="${!empty freelancerInfo.file_save_nm}">
			<img class="img-responsive img-circle"
				src="http://192.168.201.222/file/${freelancerInfo.file_save_nm}"
				style="width: 150px; height: 150px;">
		</c:if>
		<c:if test="${empty freelancerInfo.file_save_nm}">
			<img class="img-responsive img-circle pull-lfet"
				src="${pageContext.request.contextPath}/resources/images/profile.png"
				style="width: 150px; height: 150px;">
		</c:if>
		
                <h1>${freelancerInfo.mem_nm}</h1>
        </div>
        <h3 class="mem_self">
        	${fn:substring(freelancerInfo.mem_self,0,30)} . . .
		</h3>
        <hr style="margin-top:30px;">
        <div>
        							<c:choose>
							<c:when test="${freelancerInfo.mem_tig_nm eq null }">
								<a href="#" data-placement="top"  data-trigger="hover" data-toggle="popover" title="타이틀 없음" data-content="${freelancerInfo.mem_nm }님이 획득한 타이틀이 없습니다."><img src="${pageContext.request.contextPath}/resources/images/Titleimages/noTitle.png" style="width:75px; heigth:75px; padding-right: 20px; padding-left: 20px;" /></a>
							</c:when>
							<c:otherwise>
								<c:forTokens items="${freelancerInfo.mem_tig_nm }" delims="," var="item">
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
													<a href="#" data-placement="top"  data-trigger="hover" data-toggle="popover" title="${subject }  ${high } " data-content="${subject } 문제의 정답률 ${Hrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px; padding-right: 20px; padding-left: 20px;" /></a>
												</c:when>
												
												<c:when test="${grade eq 'M' }">
													<c:set value="중급" var="mid" />
													<c:set value="50%" var="Mrate" />
													<a href="#" data-placement="top"  data-trigger="hover" data-toggle="popover" title="${subject }  ${mid } " data-content="${subject } 문제의 정답률 ${Mrate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px;padding-right: 20px; padding-left: 20px;" /></a>
												</c:when>
												
												<c:when test="${grade eq 'B' }">
													<c:set value="초급" var="basic" />
													<c:set value="30%" var="Brate" />
													<a href="#" data-placement="top" data-trigger="hover" data-toggle="popover" title="${subject }  ${basic } " data-content="${subject } 문제의 정답률 ${Brate} 이상시 타이틀 획득"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/${item }.png" style="width:75px; heigth:75px; padding-right: 20px; padding-left: 20px;" /></a>
												</c:when>
											</c:choose>
										</c:if>
									</c:forTokens>
								</c:forTokens>
							</c:otherwise>
						</c:choose>
        </div>
		<button type="button" class="btn btn-success pull-right" id="inquery" style="margin-top: 0px;">견적문의</button>
	</div>
	
	<div class="container bodyst">
		<img src="${pageContext.request.contextPath}/resources/images/freelancer/self.png" alt="" style=" width:70px; height:40px;" /><span style="font-family:'Jeju Gothic', sans-serif; font-size:20pt">자기소개</span>
		<hr>
		${freelancerInfo.mem_self}
	</div>
	
	<div class="container bodyst">
		<img src="${pageContext.request.contextPath}/resources/images/freelancer/skillInfo.png" alt="" style=" width:55px; height:40px; padding-left:10px" /><span style="font-family:'Jeju Gothic', sans-serif; font-size:20pt; padding-top: 0px; border-top-width:30px">&nbsp;&nbsp;기술정보</span>
		<hr>
		<c:forEach items="${freelancerTecInfo}" var="technologyList" varStatus='stat'>
			<div style="display: inline-block; width: 230px;">
				<center>
					<div class="btn btn-info disabled" 
						id="${technologyList.tec_info_lan }">${technologyList.tec_info_lan }
					</div>
				</center>
			</div>
			<c:if test='${stat.count % 5 == 0}'>
				</br></br>
			</c:if>
		</c:forEach>
	</div>
	
	<div class="container bodyst">
		<img src="${pageContext.request.contextPath}/resources/images/freelancer/career2.png" alt="" style=" width:30px; height:30px;" /><span style="font-family:'Jeju Gothic', sans-serif; font-size:20pt">경력정보</span>
		<hr>
		<table id="carinfoTable" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>회사명</th>
						<th>기간</th>
						<th>근무부서</th>
						<th>담당업무</th>
						<th>직위</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${freelancerCarInfo }" var="carinfoList">
					<tr>
						<td>${carinfoList.car_com_nm }</td>
						<td>${carinfoList.car_date }</td>
						<td>${carinfoList.car_work_dep }</td>
						<td>${carinfoList.car_cha_task }</td>
						<td>${carinfoList.car_spot }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
	
	<div class="container bodyst">
		<img src="${pageContext.request.contextPath}/resources/images/freelancer/portfolio.png" alt="" style=" width:50px; height:50px;padding-bottom: 0px; padding-left: 15px;" /><span style="font-family:'Jeju Gothic', sans-serif; font-size:20pt">&nbsp;&nbsp;포트폴리오</span>
		<hr>
		<ul class="gallery col-4"> 
          			<c:forEach items="${freelancerPorInfo }" var="portfolioitemList" varStatus="status">
            		<li>
                		<div class="preview">
                    		<img src="http://192.168.201.222/file/${portfolioitemList.file_save_nm}" style="width:270px; height:200px;">
                   			<center>
	                   			<div class="links"  >
	                        		<a data-toggle="modal"  href="#${portfolioitemList.file_num }">
	                        			<i class="icon-eye-open"></i>
	                        		</a>
	                   			</div>
                   			</center>
               			</div>
						<div id="${portfolioitemList.file_num }" class="modal hide fade">
						<i class="icon-remove" data-dismiss="modal" aria-hidden="true"></i>
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
	</div>
	
	<script type="text/javascript">
		$(function(){
			
			$("[data-toggle='popover']").popover();
			
			$('button[type=button]').click(function(){
				$(location).attr('href','${pageContext.request.contextPath}/project/projectForm.do?estmem_id=${param.mem_id}');
				
			});
		});
	</script>
</body>
</html>