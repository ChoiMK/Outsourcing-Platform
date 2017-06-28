<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#nav-arrows{
		z-index:1;
	}
	.wordsrotator_wordIn, .wordsrotator_wordOut {padding: 0 500px;}
	
	#div_hover:hover {
   background-color: #ffffff;
   color:#666;ㅇ
	}
	
</style>
</head>
<body>
<!--Slider-->
    <section id="slide-show">
     <div id="slider" class="sl-slider-wrapper">

        <!--Slider Items-->    
        <div class="sl-slider">
            <!--Slider Item1-->
            <div class="sl-slide item1" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
                <div class="sl-slide-inner">
                    <div class="container">
                        <img src="${pageContext.request.contextPath}/resources/images/slider/image1.png" />
<!--                         <h2>Creative Ideas</h2> -->
                    </div>
                </div>
            </div>
            <!--/Slider Item1-->

            <!--Slider Item2-->
            <div class="sl-slide item2" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
                <div class="sl-slide-inner">
                    <div class="container"><br/>
                        <center><img class="" src="${pageContext.request.contextPath}/resources/images/slider/image2.png" /></center>
                    </div>
                </div>
            </div>
            <!--Slider Item2-->

            <!--Slider Item3-->
            <div class="sl-slide item3" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
                <div class="sl-slide-inner">
                   <div class="container">
                    <img class="pull-right" src="${pageContext.request.contextPath}/resources/images/slider/image3.png"  />
                    <h2>Reliable service</h2>
                </div>
            </div>
        </div>
        <!--Slider Item3-->

    </div>
    <!--/Slider Items-->

    <!--Slider Next Prev button-->
    <nav id="nav-arrows" class="nav-arrows">
        <span class="nav-arrow-prev"><i class="icon-angle-left"></i></span>
        <span class="nav-arrow-next"><i class="icon-angle-right"></i></span> 
    </nav>
    <!--/Slider Next Prev button-->

</div>
<!-- /slider-wrapper -->           
</section>
<!--/Slider-->

<section class="main-info " style="background-color:#333333;padding-bottom: 11px;padding-top: 11px;">
    
    <div class="container center">
        		<table  style="font-size: 15px; color:#ffffff; width:88%;height: 115px;">
        			<tr>
        				<td >등록된 포트폴리오</td>
        				<td >등록된 프로젝트</td>
        				<td >등록된 회원</td>
        			</tr>	
        			<tr>
        				<td style="font-size: 50px;" id="counter3"></td>
        				<td style="font-size: 50px;" id="counter2"></td>
        				<td style="font-size: 50px;" id="counter1"></td>
        			</tr>
        		</table>
        	</div>
</section>

<!--Services-->
<section id="services" style="background-color : #f6f6f6;">
    <div class="container">
        <div class="center gap">
            <h3 style="color:#2dcc70;">제발개발 프로젝트</h3>
        </div>
        
        <c:forEach items="${projectList }" var="projectList" varStatus="status">
        	<div class="row-fluid">
        		<c:if test="${status.count <= 4 }">
        			<c:if test="${status.count != 1 }" >
        				<div class="span4" style="margin-left:30px;width:270px; background-color:#ffffff">
        			</c:if>
        			<c:if test="${status.count == 1 }" >
        				<div class="span4" style="width:270px; background-color:#ffffff; bordr-radius: 50%;">
       				 </c:if>
	        	<div class="media" style="width:270px;">
	        		<div class="media-body" id="div_hover" style="width:270px;">
	        		
	        		<div style="text-align: left; color:#2dcc70; padding-left: 12px;">
	        			<br>
	        			<img src="${pageContext.request.contextPath}/resources/images/file.png" style="width:20px;height:20px;">프로젝트 분야 : ${projectList.pro_dtn }
	        		</div>
	        		<br>
	        		
	        			<h4 class="media-heading" style="text-align: center; color:black;">${fn:substring(projectList.pro_tit,0,18)}..</h4>
	        			<hr>
	        			<div style="height:210px;padding-left: 28px;border-right-width: 28px;padding-right: 28px;"">
	        				<p>${fn:substring(projectList.pro_con,0,150)} . . .</p>
	        			</div>
	        			
	        			<hr>
	        			<div>
	        			
	        				<p id="supporter${status.count }" style="padding-left:18px;"></p>
	        			</div>
	        			<div>
	        				<p style="padding-left:18px;">금액 : ${projectList.pro_bud }</p><input type="hidden" id="${status.count }" value="${projectList.pro_num }" />
	        			</div>
	        			<script type="text/javascript">
	        				$(function(){
	        					var pro_num = $("#${status.count}").val();
	       						$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/supportCnt.do",
									dataType : "json",
									data : { pro_num : pro_num },
									success : function(data) {
										$("#supporter${status.count }").html('지원자수 : '+data.suppotCnt+'명');
									}
								});
							});
						</script>	
					</div>
				</div>
				</c:if>
			</div>            
		</c:forEach>
	</div>
</section>
<!--/Services-->

<section id="recent-works"  style="padding-top: 37px; padding-bottom: 32px;">
    <div class="container">
        <div class="center">
            <h3>포트폴리오</h3>
            <p class="lead">제발개발에 등록된 회원들의 포트폴리오입니다.</p>
        </div>  
        <div class="gap"></div>
        <ul class="gallery col-4">
        	<c:forEach items="${portfolioFileList }" var="portfolioFileList" varStatus="status">
        		<c:if test="${status.count <= 4 }">
		            <!--Item 1-->
		            <li>
		                <div class="preview">
		                    <img alt=" " src="http://192.168.201.222/file/${portfolioFileList.file_save_nm }" style="width:270px; height:150px;">
		                    <div class="overlay">
		                    </div>
		                    <div class="links">
		                        <a data-toggle="modal" href="#modal-1${status.count }" style="margin-left: 24px;"><i class="icon-eye-open"></i></a>                         
		                    </div>
		                </div>
		                <div class="desc">
		                    <h5>${portfolioFileList.po_tit }</h5>
		                </div>
		                <div id="modal-1${status.count }" class="modal hide fade">
		                    <a class="close-modal" href="javascript:;" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></a>
		                    <div class="modal-body">
		                        <img src="http://192.168.201.222/file/${portfolioFileList.file_save_nm }" alt=" " width="100%" style="max-height:400px">
		                    </div>
		                </div>                 
		            </li>
		            <!--/Item 1--> 
            	</c:if>
 			</c:forEach>    
        </ul>
        
    </div>

</section>

<section id="clients" class="main" style="
    padding-top: 37px;
    padding-bottom: 32px;">
    <div class="container">
        <div class="row-fluid">
            <div class="span2">
                <div class="clearfix">
                    <h4 class="pull-left">제발개발 타이틀</h4>
                    <div class="pull-right">
                        <a class="prev" href="#myCarousel" data-slide="prev"><i class="icon-angle-left icon-large"></i></a> <a class="next" href="#myCarousel" data-slide="next"><i class="icon-angle-right icon-large"></i></a>
                    </div>
                </div>
                <p>제발개발에서 제공하는 문제를 풀고 타이틀을 획득하여 자신의 프로필에 추가해 보세요.</p>
            </div>
            <div class="span10">
                <div id="myCarousel" class="carousel slide clients">
                  <!-- Carousel items -->
                  <div class="carousel-inner">
                    <div class="active item">
                        <div class="row-fluid">
                            <ul class="thumbnails">
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/CSS_H.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JavaScript_H.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/OS_H.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/HTML_H.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JSP_H.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JAVA_H.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/SQL_H.png" style="width:100px; height:100px;"></li>
                            </ul>
                        </div>
                    </div>

                    <div class="item">
                        <div class="row-fluid">
                            <ul class="thumbnails">
                                 <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/CSS_M.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JavaScript_M.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/OS_M.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/HTML_M.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JSP_M.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JAVA_M.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/SQL_M.png" style="width:100px; height:100px;"></li>
                            </ul>
                        </div>
                    </div>

                    <div class="item">
                        <div class="row-fluid">
                            <ul class="thumbnails">
                                 <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/CSS_B.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JavaScript_B.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/OS_B.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/HTML_B.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JSP_B.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/JAVA_B.png" style="width:100px; height:100px;"></li>
                                <li class="span3" style="width:110px;"><img src="${pageContext.request.contextPath}/resources/images/Titleimages/SQL_B.png" style="width:100px; height:100px;"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /Carousel items -->

            </div>
        </div>
    </div>
</div>
</section>

<!-- <input type="text" id="message"/> -->
<!--     <input type="button" id="sendBtn" value="전송"/> -->
<!--     <div id="data"> -->
<!-- </div> -->


<!-- SL Slider -->
<script type="text/javascript"> 
$(function() {
	$("#myWords").wordsrotator({
//         words: ['','제','제발','제발개', '제발개발','제발개발에', '제발개발에서','제발개발에서 최', '제발개발에서 최고','제발개발에서 최고의', '제발개발에서 최고의 프','제발개발에서 최고의 프리', '제발개발에서 최고의 프리랜','제발개발에서 최고의 프리랜서','제발개발에서 최고의 프리랜서가 ','제발개발에서 최고의 프리랜서가 당', '제발개발에서 최고의 프리랜서가 당신','제발개발에서 최고의 프리랜서가 당신을', '제발개발에서 최고의 프리랜서가 당신을 기', '제발개발에서 최고의 프리랜서가 당신을 기다', '제발개발에서 최고의 프리랜서가 당신을 기다립', '제발개발에서 최고의 프리랜서가 당신을 기다립니', '제발개발에서 최고의 프리랜서가 당신을 기다립니다.' ]
		   words: ['', '제', '제발', '제발개', '제발개발']
    });
	
    var Page = (function() {
        var $navArrows = $( '#nav-arrows' ),
        slitslider = $( '#slider' ).slitslider( {
            autoplay : true
        } ),
        init = function() {
            initEvents();
        },
        initEvents = function() {
        	
            $navArrows.children( ':last' ).on( 'click', function() {
                slitslider.next();
                return false;
            });
            $navArrows.children( ':first' ).on( 'click', function() {
                slitslider.previous();
                return false;
            });
        };
        return { init : init };
    })();
    Page.init();
    
});


function numberCounter(target_frame, target_number) {
    this.count = 0; this.diff = 0;
    this.target_count = parseInt(target_number);
    this.target_frame = document.getElementById(target_frame);
    this.timer = null;
    this.counter();
};
    numberCounter.prototype.counter = function() {
        var self = this;
        this.diff = this.target_count - this.count;
    
        if(this.diff > 0) {
            self.count += Math.ceil(this.diff / 5);
        }
    
        this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    
        if(this.count < this.target_count) {
            this.timer = setTimeout(function() { self.counter(); }, 20);
        } else {
            clearTimeout(this.timer);
        }
    };
    
    new numberCounter("counter3", ${portfolioCount});
    new numberCounter("counter2", ${projectCount});
    new numberCounter("counter1", ${freelancerCount});

</script>
<!-- /SL Slider -->


</body>
</html>