<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"/>

       
<style>
input[type="text"],input[type="password"]{
	width:97%;
}
.pro_plan_cod{
	width:180px;
	height:80px;
	border-radius: 10px;

}

.table th, .table .btns {
    padding: 8px;
    line-height: 20px;
    text-align: center;
    vertical-align: middle;
}

#pro_bud, #dea_date{
	width:10%;
}

.pro_dtn, #pro_bud{
	margin-right:20%;
}

</style>
</head>

<body>
	<div class="container">
	<h1>자료실</h1>
	</div>
		
	<div class="container">
<table class="table table-bordered" >
    
    <tbody>
        <form name="referenceForm" action="write_ok.jsp" method="post" encType="multiplart/form-data">

            <tr>
                <th>제목 </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="subject" class="form-control"/></td>
            </tr>
            <tr>
            	<th>작성자 </th>
            	<td><input type="text" id="mem_id" value="${LOGIN_MEMBERINFO.mem_id}" disabled="disabled"></td>
            </tr>
            <tr>
                <th>내용 </th>
                <td><div id="summernote"></div></td>
            </tr>
           
            <tr>
                <th>첨부파일1 </th>
                <td><input type="file"  class="filestyle" id="file01" name="files" data-buttonName="btn-primary"></td>
            </tr>
            
            <tr>
                <th>첨부파일2 </th>
                <td><input type="file"  class="filestyle" id="file02" name="files" data-buttonName="btn-primary"></td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록" onclick="sendData()" class="btn btn-success btn-lg pull-right"/>
                    <input type="reset" value="reset" class="pull-left" />
                    <input type="button" value="글 목록으로... " class="pull-right" onclick="javascript:location.href='referenceList.do'"/>
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
	
	 $('#dea_date').datepicker({
		 format: "yyyy/mm/dd",
		 language: "kr"
	 });
	 
	 $("#pro_term").slider({
			min: 0,
			max: 10,
			value: 0,
			tooltip_position:'bottom'
		});
	
	 
	 $('form[name=referenceForm]').submit(function(){
	    	if($('#file01').val()==''&&$('#file02').val()==''){
	    		BootstrapDialog.show({
	   	        title: '파일을 업로드 해주세요.',
	   	        message: '파일을 업로드 해주세요.'
	   	    	});
//	 			alert("파일을 업로드 해주세요.");
				 return false;
			 }
	      
	      var val = $('#re_con').summernote('code');
	      $(this).append('<input type="hidden" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id}">');
	      $(this).append("<input type='hidden' name='re_con' value='"+val+"'/>");
	      $(this).attr('action', '${pageContext.request.contextPath}/reference/insertReferenceInfo.do');    
	      return true;
	   });	
	 
});
</script>
</body>
</html>