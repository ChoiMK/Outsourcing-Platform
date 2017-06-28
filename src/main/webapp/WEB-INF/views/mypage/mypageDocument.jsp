<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">

.file_input_button{
	width: 100px;
	position: absolute;
	top: 0px;
	background-color: #33BB00;
	color: #FFFFFF;
	border-style: solid;
}

.file_input_textbox
{
float: left
}

.file_input_div
{
	position: relative;
	width: 100px;
	height: 23px;
	overflow: hidden;
}
.file_input_hidden
{
	font-size: 23px;
	position: absolute;
	right: 0px;
	top: 0px;
	opacity: 0px;
	
filter: alpha(opacity=0);
-ms-filter: "alpha(opacity=0)";
-khtml-opacity: 0;
-moz-opacity: 0;
}

.filebox input[type="file"] 
{ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; } 
.filebox label 
{ display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; } /* named upload */ .filebox .upload-name { display: inline-block; padding: .5em .75em; /* label의 패딩값과 일치 */ font-size: inherit; font-family: inherit; line-height: normal; vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; } 

</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 	$(function(){
 		$("#doc_form").submit(function(){
 			
 			if($("#selectList").val() == "문서 형식을 선택해주세요.") {
 				swal(
						  '등록 실패',
						  '형식을 선택해 주세요.',
						  'question'
						)
 				return false;
 			}
 			
 			if($("#title").val() == "") {
 				swal(
						  '등록 실패',
						  '제목을 입력해 주세요.',
						  'question'
						)
 				return false;
 			}
 			
 			if($("#fileCheck").val() == "") {
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
</head>
<body>
<div class="container">
	<section id="registration-page" class="container">
    <form id="doc_form" action='${pageContext.request.contextPath}/insertDocument.do' method="POST" enctype="multipart/form-data">
		<select id="selectList" name="doc_form_cla">
			<option>문서 형식을 선택해주세요.</option>
			<option>PPT</option>
			<option>EXCEL</option>
			<option>HWP</option>	
			<option>PDF</option>
			<option>TXT</option>
		</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" id="title" name="doc_tit" class="input-xlarge" style="width:250px;" placeholder="서류제목을 작성해주세요."> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="file" style="margin-bottom:10px;" name="fileName" id="fileCheck" >
		<input type="submit" class="btn btn-info btn-lg" value="등록" style="margin-bottom:12px;">
	</form>
  </section>
  <hr size="3" color="green"/>
  <section id="portfolio" class="container main">    
        <ul class="gallery col-4">
           <c:forEach var="documentFileItem" items="${documentFileItem }" varStatus="status">
            <li>
                <div class="preview">
                	<c:set value="${documentFileItem.doc_form_cla }" var="doc_form_cla"></c:set>
                	<c:if test="${doc_form_cla eq 'HWP' }">
                    <img id="doc_img" alt=" " src="${pageContext.request.contextPath}/resources/images/documentimage/word.PNG" style="width:270px; height:150px">
                    </c:if>
                    <c:if test="${doc_form_cla eq 'PPT' }">
                    <img id="doc_img" alt=" " src="${pageContext.request.contextPath}/resources/images/documentimage/ppt.PNG" style="width:270px; height:150px">
                    </c:if>
                    <c:if test="${doc_form_cla eq 'EXCEL' }">
                    <img id="doc_img" alt=" " src="${pageContext.request.contextPath}/resources/images/documentimage/excel.PNG" style="width:270px; height:150px">
                    </c:if>
                    <c:if test="${doc_form_cla eq 'TXT' }">
                    <img id="doc_img" alt=" " src="${pageContext.request.contextPath}/resources/images/documentimage/txt.PNG" style="width:270px; height:150px">
                    </c:if>
                    <c:if test="${doc_form_cla eq 'PDF' }">
                    <img id="doc_img" alt=" " src="${pageContext.request.contextPath}/resources/images/documentimage/pdf.PNG" style="width:270px; height:150px">
                    </c:if>
                    <div class="overlay">
                    
                    <div class="links" style="height:40px; width:134px; margin-left:0px; left:78px;" >
	                        <a href='${pageContext.request.contextPath}/fileDownload/${documentFileItem.file_num}.do'>↓</a><a href='${pageContext.request.contextPath}/deleteDocument.do?file_bod_num=${documentFileItem.file_bod_num}' style="background-color:#ff5e00;padding-left: 0px; margin-left: 30px;">X</a>                                
                    </div>
                    </div>
                </div>
                <div class="desc">
                    <h5>${documentFileItem.doc_tit }</h5>
                    <input type="hidden" value="${documentFileItem.doc_form_cla }" name="doc_form_cla"/> 
                </div>           
            </li>
            </c:forEach>
        </ul>
    </section>
</div>
</div>
</body>
</html>