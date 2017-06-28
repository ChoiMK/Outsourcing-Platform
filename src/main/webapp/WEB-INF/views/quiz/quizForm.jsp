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
					<select name="sub_num" class="form-control pro_dtn">
					<c:forEach items="${subjectList }" var="subjectList" varStatus="index">
						<option value="${subjectList.sub_num }" >${subjectList.sub_nm }</option>
					</c:forEach>
					</select>
					<input type="hidden" value="${lastNum }" name="quiz_num">
				</td>
			</tr>
            <tr>
                <th>내용 </th>
                <td><div id="summernote"></div></td>
            </tr>
            <tr>
            	<th></th>
            	<td><input type="button" class="btn btn-info" id="btn1" value="보기추가" onclick="add_item()"></td>
            <tr>
            <tr>
            	<th>보기</th>
            	<td> 
            		<div id="pre_set">
            			<input type="text" name="con"><input type="checkbox" name="wht" value="F"> 정답아님  <input type="checkbox" name="wht" value="T"> 정답 <input type="button" value="삭제" class="btn btn-info" onclick="remove_item(this)" style="margin-bottom: 8px;margin-left: 10px;">
            		</div>
            		<div id="field"></div>
            	</td>
            </tr>
            <tr>
                <td colspan="2">
		            <center><button type="submit" id="subBtn" class="btn btn-success btn-lg">문제 등록</button></center>
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</body>
<script type="text/javascript">
function add_item(){
    // pre_set 에 있는 내용을 읽어와서 처리..
    
    if($("#field input[name=con]").length > 2){
    	alert("더이상 보기를 만들수 없습니다.!");
    } else {
    var div = document.createElement('div');
    div.innerHTML = document.getElementById('pre_set').innerHTML;
    document.getElementById('field').appendChild(div);
    }
}

function remove_item(obj){
    // obj.parentNode 를 이용하여 삭제
    document.getElementById('field').removeChild(obj.parentNode);
}

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
	//내용
	
	
	
	$('form[name="QuizForm"]').submit(function(){
		
		// 	배열을 하나 만든다.
		var opt_con = new Array();
		var opt_wht = new Array();
		
		// 배열에 첫번째 보기를 넣는다 ( 무조건 하나의 보기는 있음)
		opt_con.push( $('#pre_set input[name=con]').val() );
		opt_wht.push( $('#pre_set input[name=wht]:checked').val() );
		
		//field에 있는 0번째 보기 값
 		var opt_con1 = $('#field div:eq(0) input[name=con]').val();
 		var opt_wht1 = $('#field div:eq(0) input[name=wht]:checked').val();
 		
 		//만약 보기의 내용이 null이 아니라면 배열에 push 한다.
 		if(opt_con1 != null) {
 			opt_con.push( opt_con1 );
 			opt_wht.push( opt_wht1 );
 		} 
 		
 		var opt_con2 = $('#field div:eq(1) input[name=con]').val();
 		var opt_wht2 = $('#field div:eq(1) input[name=wht]:checked').val();
		
 		if(opt_con2 != null) {
 			opt_con.push( opt_con2 );
 			opt_wht.push( opt_wht2 );
 		} 
 		// field에 있는 2번째 보기 값
 		var opt_con3 = $('#field div:eq(2) input[name=con]').val();
 		var opt_wht3 = $('#field div:eq(2) input[name=wht]:checked').val();
		
 		if(opt_con3 != null) {
 			opt_con.push( opt_con3 );
 			opt_wht.push( opt_wht3 );
 		} 
	
		var content = $('#summernote').summernote('code');
		$(this).append("<input type='hidden' name='quiz_con' value='"+content+"'>");
		
		$(this).append("<input type='hidden' name='opt_con' value='"+opt_con+"'>");
		$(this).append("<input type='hidden' name='opt_wht' value='"+opt_wht+"'>");
	});
});
</script>
</html>

