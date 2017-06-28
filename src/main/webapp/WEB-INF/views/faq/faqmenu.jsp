<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <h1>FAQ</h1>
                </div>
            </div>
        </div>
    </section>
    <div class="container" >
    <div class="navbar" id="cssmenu" >
    	<ul class="nav" style="text-align:center; margin-bottom:15px;">
        	<li><a href="${pageContext.request.contextPath}/notice/noticeList.do"><img src="${pageContext.request.contextPath}/resources/images/customerCenter/exclamation.png" alt="" style=" width:30px; height:30px; padding-bottom: 11px" /><div>공지사항</div></a></li>
            <li><a href="${pageContext.request.contextPath}/faq.do"><img src="${pageContext.request.contextPath}/resources/images/customerCenter/faq.png" alt="" style=" width:30px; height:30px; padding-bottom: 11px" /><div>FAQ</div></a></li>
            <li><a href="${pageContext.request.contextPath}/consulting.do"><img src="${pageContext.request.contextPath}/resources/images/customerCenter/chat.png" alt="" style=" width:30px; height:30px; padding-bottom: 11px" /><div>실시간상담</div></a></li>
        </ul>        
	</div>
</div>	
</body>
</html>