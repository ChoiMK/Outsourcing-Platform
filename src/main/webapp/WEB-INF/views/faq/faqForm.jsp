<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div class="container">
<table class="table table-bordered" >
    <tbody>
		<form action="${pageContext.request.contextPath}/faq/insertFaq.do" method="post" name="faqForm">

			<tr>
                <th>제목 </th>
                <td><input type="text" placeholder="제목을 입력하세요." id="no_title" name="faq_tit" class="form-control"/></td>
            </tr>
			<tr>
                <th>내용 </th>
                <td><div id="summernote"></div></td>
            </tr>
            <tr>
                <td colspan="2">
		            <center><button type="submit" id="subBtn" class="btn btn-success btn-lg">faq 등록</button></center>
                </td>
            </tr>
            
        </form>
    </tbody>
</table>
</div>
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


		 $("form[name=faqForm]").submit(function(){
		 
		 	$(this).append('<input type="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id}">');
			
			var content = $('#summernote').summernote('code');
			$(this).append("<input type='hidden' name='faq_con' value='"+content+"'>");
			
			
		 });
			 
	 
});
</script>

</body>
</html>