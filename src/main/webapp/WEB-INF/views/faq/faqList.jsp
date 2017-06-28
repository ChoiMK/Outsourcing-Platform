<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">       

 td {border-bottom:1px solid #dedede; 
 	 padding:7px 2px 5px 2px; 
 	 vertical-align:middle;}
    .title {cursor:pointer;}
    .conts {line-height:1.8;
     padding:10px;}
img {margin-top:-2px;}

.e
{
    width:90px;
    border-right:1px solid #222;
    text-align:center;
    float:left;
    padding-left:2px;
    cursor:pointer;


}
</style>
<!-- <script src="http://cdn.jquerytools.org/1.2.5/jquery.tools.min.js"></script> -->


</head>
<body>
      
     <section id="faqs" class="container">
        <ul class="faq">
        <c:forEach items="${faqList }" var="faqList">
         <li>
            <span class="number">${faqList.faq_num}</span>
            <div class="container">
             	<a class="aa" data-toggle = "collapse" data-target = "#${faqList.faq_num}" >
                <h3 style="cursor:pointer;">${faqList.faq_tit }</h3>
                </a>
                <div id = "${faqList.faq_num}" class="collapse">
                <p>${faqList.faq_con }</p><c:if test="${LOGIN_MEMBERINFO.mem_type eq 'A' }">
                <input type="button" value="삭제" id="delete">
                <input type="hidden" name="faq_num" value="${faqList.faq_num }">
                </c:if>
                </div>
                 <hr>
            </div>
        </li>
        </c:forEach>
		</ul>
		<c:if test="${LOGIN_MEMBERINFO.mem_type eq 'A' }">
			<div class="pull-right"><input type="button" value="등록" id="insert"></div>
		</c:if>
       
      <p>&nbsp;</p>
    </section>
<script type="text/javascript">
$(function(){
	
	$("#insert").click(function(){
		 $(location).attr('href','${pageContext.request.contextPath}/faq/faqForm.do');
	 });
	$('#delete').click(function(){
		var faq_num = $(this).siblings("input[name=faq_num]").val();
		$(location).attr('href', '${pageContext.request.contextPath}/faq/deleteFaq/'+faq_num+'.do');
	});
	
});
</script>
</body>
</html>