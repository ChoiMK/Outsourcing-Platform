<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 개발Tip 문제등록</title>
<style type="text/css">
.pro_plan_cod:hover{
background-color:#5bb75b;
}

#cssmenu.align-center > ul {
  font-size: 0;
  text-align: center;
}

#cssmenu > ul > li > a {
  padding: 17px 29px;
  font-size: 19px;
  text-decoration: none;
  text-transform: uppercase;
  font-weight: 500;
  color: #2dcc70;
  font-weight: 700;
  -webkit-transition: color .2s ease;
  -moz-transition: color .2s ease;
  -ms-transition: color .2s ease;
  -o-transition: color .2s ease;
  transition: color .2s ease;
}
#cssmenu > ul > li:hover > a,
#cssmenu > ul > li.active > a {
  color: #000000;
  border-bottom: 2px solid #2dcc70 !important;
}

#cssmenu ul ul li.has-sub > a::after {
  position: absolute;
  top: 13px;
  right: 10px;
  width: 4px;
  height: 4px;
  border-bottom: 1px solid #15263f;
  border-right: 1px solid #15263f;
  content: "";
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
  -webkit-transition: border-color 0.2s ease;
  -moz-transition: border-color 0.2s ease;
  -ms-transition: border-color 0.2s ease;
  -o-transition: border-color 0.2s ease;
  transition: border-color 0.2s ease;
}
</style>
</head>
<body>
	<section class="title">
        <div class="container">
            <div class="row-fluid">
                <div class="span6">
                    <h1>개발Tip 문제등록</h1>
                </div>
                <div class="span6">
                    <ul class="breadcrumb pull-right">
                    </ul>
                </div>
            </div>
        </div>
    </section>
    
    <!---------------------------content의 content 시작  ---------------------------->
	<div class="container">
		<div class="navbar" id="cssmenu">
    	<ul class="nav">
        	<%-- <li><a href="${pageContext.request.contextPath}/reference/referenceList.do"><img src="${pageContext.request.contextPath}/resources/images/developTip/folder.png" alt="" style=" width:30px; height:30px; padding-bottom: 11px; padding-left:15px;" /><div>자료실</div></a></li> --%>
            <li><a href="${pageContext.request.contextPath}/admin/adminDvrTest/dvrTestList.do"><img src="${pageContext.request.contextPath}/resources/images/developTip/evaluation.png" alt="" style=" width:30px; height:30px; padding-bottom: 11px; padding-left:42px;" /><div>개발자테스트 문제 관리</div></a></li>
        </ul>        
		</div>
	</div>	
	<!---------------------------content의 content 끝  ---------------------------->
    
    
    
</body>
</html>