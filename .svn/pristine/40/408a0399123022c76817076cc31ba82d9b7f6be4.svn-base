<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
input[name="pro_tit"]{
	width:97%;
}
#subBtn{
	width:180px;
	height:40px;
}
 
.table th, .table{
    padding: 8px;
    line-height: 20px;
    text-align: center;
    vertical-align: middle;
}


 .pro_term, #pro_dea_date{ 
 	width:10%; 
 } 

.input-daterange .add-on {
    height: 21px;
    margin-bottom: 10px;
 }
 .slider.slider-horizontal{
 	margin-left:35px;
 	width: 500px;
 }
 
</style>
<script type="text/javascript">
$(function(){
	 $('#summernote').summernote({
		    height : 300,  
		    minHeight : null,
		    maxHeight : null,
		    focus : true,
		    lang : 'ko-KR', 
		    codemirror: {
				theme: 'monokai'
			}
		  });

		 
		$("#cancel").click(function(){
			$(location).attr('href','${pageContext.request.contextPath}/notice/noticeList.do');
		});
		
		$('#delete').click(function(){
			$(location).attr('href', '${pageContext.request.contextPath}/notice/deleteNotice/${noticeInfo.nbod_num}.do');
		});

		$('form[name=nbodView]').submit(function(){
			$(this).append('<input type="hidden" name="nbod_con" value="'+$('#summernote').summernote('code').replace(/\"/gi,'\'')+'">');
 			$(this).append("<input type='hidden' name='nbod_num' value='${noticeInfo.nbod_num}'>");
		});
		
		
});
</script>
</head>
<body>
<div class="container">
<form action="${pageContext.request.contextPath}/notice/updateNotice.do" name="nbodView">
<table class="table table-bordered" >
    <tbody>
		<tr>
        	<th>제목 </th>
            <td><input type="text" name="nbod_tit" value="${noticeInfo.nbod_tit}" class="form-control"/></td>
                
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="mem_id" value="관리자" disabled="disabled"></td>
        </tr>
        <tr>
        	<th>작성일자</th>
            <td>${noticeInfo.nbod_inst_date }</td>
        </tr>
		<tr>
        	<th>내용 </th>
            <td><div style="width:910px; height:400px; overflow:auto;"><p>${noticeInfo.nbod_con }</p></div></td>
        </tr>
        <tr>
         <c:if test="${LOGIN_MEMBERINFO.mem_type == 'A'}">
        	<td colspan="4">
			    <center>
			    	<input type="submit" id="update" class="btn btn-success btn-lg" value="수정" />
			    	<input type="button" id="delete" class="btn btn-success btn-lg" value="삭제" />
			    	<input type="button" id="cancel" class="btn btn-success btn-lg" value="취소" />
			    </center>
            </td>
        </c:if>
        </tr>
    </tbody>
</table>
</form>
</div>
</body>
</html>