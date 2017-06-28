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
	width:209px;
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
</head>

<body>
	<div class="container">
<table class="table table-bordered" >
    <tbody>
		<form action="${pageContext.request.contextPath}/project/insertProjectInfo.do" method="post" name="projectForm">
			<tr>
				<th>구분</th>
				<td>
					<select name="pro_dtn" class="form-control pro_dtn">
							<option value="개발">개발</option>
							<option value="디자인">디자인</option>
							<option value="기획">기획</option>
					</select>
				</td>
			</tr>
			<tr>	
				<th>예상 기간</th>
				<td>
				<div class="input-daterange" id="datepicker">
						<input type="text" name="start_dt" class="pro_term" /> <span class="add-on">to</span>
						<input type="text" name="end_dt" class="pro_term"  />
				</div>	
				</td>
			</tr>


			<tr>
				<th>예산</th>
				<td>
     					<input id="pro_bud" type="text" data-slider-tooltip="hide" />
     			</td>
			</tr>

			<tr>
                <th>제목 </th>
                <td><input type="text" placeholder="제목을 입력하세요." id="pro_tit" name="pro_tit" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용 </th>
                <td><div id="summernote"></div></td>
            </tr>
           
            <tr>
                <th>등록 마감일 </th>
                <td><input type="text" id="pro_dea_date"/></td>
            </tr>
            <tr>
            	<th>기획상태</th>
            	<td class="">
            		<button type="button" class="btn btn-info pro_plan_cod " id="btn1"name="" value="">아이디어 단계</button>
            		<button type="button" class="btn btn-info pro_plan_cod " id="btn2" name="" value="">필요기능 정리</button>
            		<button type="button" class="btn btn-info pro_plan_cod " id="btn3" name="" value="">기획 작성중</button>
            		<button type="button" class="btn btn-info pro_plan_cod " id="btn4" name="" value="">상세기획서 보유</button>
            	</td>
            	
            </tr>
            <tr>
            	<th>필요기술</th>
            	<td class="tec" style="width:90%;">
            		<button type="button" class="btn btn-info" id="btn5" name="" value="아이디어 단계">펼치기</button>
            		<br/><br/>
            		<div id="tecList">
            		</div>
            	</td>
            </tr>
            <tr>
                <td colspan="2">
		            <center><button type="submit" id="subBtn" class="btn btn-success btn-lg">프로젝트 등록</button></center>
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
	 $('.input-daterange').datepicker({
		 orientation: "bottom auto",
		 format: "yyyy/mm/dd",
		 language: "kr",
		 todayHighlight: true
	 });
	
	 $('#pro_dea_date').datepicker({
		 format: "yyyy/mm/dd",
		 language: "kr",
		 todayHighlight: true
	 });



	 $('#pro_bud').slider({
             ticks:[1, 2, 3, 4, 5],
             ticks_labels:["100만원 이상", "500만원 이상", "1000만원 이상", "5000만원 이상", "1억원 이상"],
             min:1,
             max:5,
             step:1,
             value:2
	 });
	 
	 $("#tecList").hide();
	 $('#btn5').on('click',function(){
		 if( $(this).html() == '펼치기' ) {
		      $(this).html('접기');
		    }
		    else {
		      $(this).html('펼치기');
		    }
		 var tecList=
			 "<c:forEach items='${technologyList}' var='technologyList' varStatus='stat'>"+
			 "<div class='tecCheck'><input type='checkbox' id='check' name='check' value='${technologyList.tech}'/>${technologyList.tech}</div>&nbsp;"+
			 "<c:if test='${stat.count % 5 == 0}'>"+
			 "</br></br>"+
			 "</c:if>"+ 
			 "</c:forEach>"
		 $("#tecList").html(tecList);
		 $('#tecList').toggle('hide');
		 
		
	 });
	 
	 var pro_plan_cod = ""; 
	 $(".pro_plan_cod").click(function(){
		 pro_plan_cod = $(this).text();
	 switch(pro_plan_cod){
	  case '아이디어 단계' : $("#btn1").attr({class:"btn btn-success pro_plan_cod",value:"아이디어 단계" }); 
	                       $("#btn2,#btn3,#btn4").attr("class", "btn btn-info pro_plan_cod");break;
	  case '필요기능 정리' : $("#btn2").attr("class", "btn btn-success pro_plan_cod");
	  					   $("#btn1,#btn3,#btn4").attr({class:"btn btn-info pro_plan_cod",value:"필요기능 정리"});break;	
	  case '기획 작성중'   : $("#btn3").attr("class", "btn btn-success pro_plan_cod"); 
	  					   $("#btn1,#btn2,#btn4").attr({class: "btn btn-info pro_plan_cod",value:"기획 작성중"});break;	
	  case '상세기획서 보유' : $("#btn4").attr("class", "btn btn-success pro_plan_cod"); 
	  					    $("#btn1,#btn2,#btn3").attr({class: "btn btn-info pro_plan_cod",value:"상세기획서 보유"});break;
	 }
	});
	 
	 
	 var pro_bud = "500만원 이상";
	 $('#pro_bud').on('slide slideStop', function() {
		var pro_num = $('#pro_bud').val();
		switch(pro_num){
		 case '1' : pro_bud = '100만원 이상'; break;
		 case '2' : pro_bud = '500만원 이상'; break;
		 case '3' : pro_bud = '1000만원 이상'; break;
		 case '4' : pro_bud = '5000만원 이상'; break;
		 case '5' : pro_bud = '1억원 이상'; break;
		 }
	   });
	 
	 function betweenFun(){
		 var start_dt = $('input[name="start_dt"]').val();
		 var end_dt = $('input[name="end_dt"]').val();
	     var startArray = start_dt.split("/");
		 var endArray = end_dt.split("/");
		 var startObj = new Date(startArray[0], Number(startArray[1])-1, startArray[2]);
		 var endtObj = new Date(endArray[0], Number(endArray[1])-1, endArray[2]);
		 var betweenDay = (endtObj.getTime() - startObj.getTime())/1000/60/60/24;  
		 return betweenDay;
	 }
	 
	 //프로젝트 등록
	 $('form[name="projectForm"]').submit(function(){
		 if ($("#pro_tit").val() == '') {
			tryTitle();
				return false;
		}
		 if ($(".pro_term").val() == '') {
			 tryDay();
				return false;
			}	
		 if ($("#pro_dea_date").val() == '') {
			 tryEndDay();
				return false;
			}	
		 if ($(".pro_plan_cod").val() == '') {
			 tryPlan();
				return false;
			}
		 if($("input:checkbox[name='check']:checked").length < 1) { 
			 tryTec();
	            return false;
		 }


		 
			//아이디
 		 	$(this).append('<input type="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id}">');
			//기간
			$(this).append("<input type='hidden' name='pro_term' value='"+betweenFun()+"'>");
			//예산
			$(this).append("<input type='hidden' name='pro_bud' value='"+pro_bud+"'>");
			//내용
			var content = $('#summernote').summernote('code');
			$(this).append("<input type='hidden' name='pro_con' value='"+content+"'>");
			//입찰마감일
			var pro_dea_date = $('#pro_dea_date').val();
			$(this).append("<input type='hidden' name='pro_dea_date' value='"+pro_dea_date+"'>");
			//기획상태
			$(this).append("<input type='hidden' name='pro_plan_cod' value='"+pro_plan_cod+"'>");
			//필요기술
			var tec = new Array();
				 $("#check:checked").each(function() {
            		 tec.push($(this).val());
			 });
			$(this).append("<input type='hidden' name='pro_need_tec' value='"+tec+"'>");
			if("${estmem_id}" != ""){
				$(this).attr('action','${pageContext.request.contextPath}/project/insertProjectEst.do?estmem_id=${estmem_id}')
				swal({
					  title: '프로젝트 견적문의 요청중 ...',
					  text: '잠시만 기다려 주세요.',
					  timer: 10000,
					  showConfirmButton: false
					});
			}
			
	 });
		
	 
	 
});
</script>
</body>
</html>