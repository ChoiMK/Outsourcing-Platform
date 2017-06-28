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
.pro_plan_cod{
	width:210px;
	height:80px;
	border-radius: 10px;
}
.pro_plan_cod:hover{
background-color:#5bb75b;
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
 #btn2,#btn3,#btn4{
 	margin-left:57px;
 }
 .tecCheck{
    display: inline-block;
    width: 19%;
 }
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<table class="table table-bordered" >
    <tbody>
		<form action="${pageContext.request.contextPath}/quiz/insertQuiz.do" method="post" name="QuizForm">
			<tr>
				<th>구분</th>
				<td>
					<input type="text" value="${quizInfo.sub_num }" name="sub_num">
				</td>
			</tr>
            <tr>
                <th>내용 </th>
                <td><div id="summernote"></div></td>
            </tr>       
            <tr>
            	<th>보기</th>
            	<td>
            			<c:forEach items="${optList }" var="optList">
            			<div>
            				<input type="text" value="${optList.opt_con }" >
            			</div>
            			</c:forEach>
            	</td>
            </tr>
          
            <tr>
                <td colspan="2">
                	<input type="hidden" name="quiz_num" value="${quizInfo.quiz_num }">
		            <input type="button" id="deleteBtn" class="btn btn-success" value="삭제">
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
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
	 
	 $("#summernote").summernote('code', '${quizInfo.quiz_con}');
	//내용
	
	
	
	$('form[name="QuizForm"]').submit(function(){
		
		var content = $('#summernote').summernote('code');
		$(this).append("<input type='hidden' name='quiz_con' value='"+content+"'>");
		
	});
});
</script>
</html>

