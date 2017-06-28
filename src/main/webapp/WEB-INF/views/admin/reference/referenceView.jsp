<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 보기</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
   width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>
$(function(){
   // 섬머노트를 div를 활용한 textarea에 추가.
   // http://summernote.org 활용
    $('#re_con').summernote({
    	height : 300,  
	    minHeight : null,
	    maxHeight : null,
	    focus : true,
	    lang : 'ko-KR', 
	    codemirror: {
			theme: 'monokai'
      }
    });
   
	$("#re_con").summernote('code', '${referenceInfo.re_con}');
    
    $("form[name=boardForm]").submit(function(){
       var val = $('#re_con').summernote('code');
       $(this).append('<input type="hidden" name="re_num" value="${referenceInfo.re_num}"/>');
       $(this).append("<input type='hidden' name='re_con' value='"+val+"'/>");
       $(this).attr('action','${pageContext.request.contextPath}/reference/updateFreeboardInfo.do');
    });
    
    $('#list').click(function(){
       $(location).attr('href','${pageContext.request.contextPath}/reference/freeboardList.do');
    });
    
    $("#delete_btn").click(function(){
       $(location).attr('href','${pageContext.request.contextPath}/reference/deleteFreeboardInfo.do?re_num=${referenceInfo.re_num}');
    });
    
    $('#reply').click(function(){
    	 if(eval('${empty LOGIN_MEMBERINFO}')){
 		 	BootstrapDialog.show({
 	 	    title: '경고 합니다.',
 	 	    message: '로그인 하지 않으면 사용할 수 없습니다.'
 	 		});
 			return false;
 		}else{
       var $frm = $('<form action="${pageContext.request.contextPath}/reference/freeboardReplyForm.do" method="post">')
       $frm.append('<input type="hidden" name="rnum" value="${param.rnum}"/>');
       $frm.append('<input type="hidden" name="re_tit" value="${referenceInfo.re_tit}"/>');
//       $frm.append('<input type="hidden" name="bo_group" value="${boardInfo.bo_group}"/>');
//       $frm.append('<input type="hidden" name="bo_depth" value="${boardInfo.bo_depth}"/>');
//       $frm.append('<input type="hidden" name="bo_seq" value="${boardInfo.bo_seq}"/>');
       
       $(document.body).append($frm);
       $frm.submit();
 		}
    });
    if(eval("${empty LOGIN_MEMBERINFO}")){
    	$(".no").attr("readonly",true);
    	$("#re_con").summernote('disable');
    	$(".inlog").css('display','none');
    }
    if(eval("${LOGIN_MEMBERINFO.mem_id}" != "${referenceInfo.mem_id}")){
    	$(".no").attr("readonly",true);
    	$("#re_con").summernote('disable');
    	$(".inlog").css('display','none');
    }
    
    
});
</script>
</head>
<body>

	<div class="container">
	<h1>자료실</h1>
	</div>


<form name="boardForm" class="form-horizontal" role="form" action="" method="post">
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_title">제목:</label>
      <div class="col-sm-10">
         <input type="text" class="no form-control" id="re_tit" name="re_tit" value="${referenceInfo.re_tit}">
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_nickname">작성자:</label>
      <div class="col-sm-10"> 
         <input type="text" readonly class="no form-control" id="mem_id" name="mem_id" value="${referenceInfo.mem_id }"  >
      </div>
   </div>
 
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_content">내용:</label>
      <div class="col-sm-10"> 
         <div id="re_con"></div>
      </div>
   </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
   
         <c:forEach items="${referenceInfo.attachFileItemList}" var="fileitem" varStatus="stat">
            <img style="width: 50px; height: 60px" src="http://192.168.201.163/file/${fileitem.file_save_name}" alt="pic${stat.count}"
               onclick="javascript:location.href='${pageContext.request.contextPath}/userFreeboard/fileDownload.do?file_seq=${fileitem.file_seq}'">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${fileitem.file_name }
               <br><br>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </c:forEach>
         
         <!-- Left and right controls -->
   </div>
   <div class="form-group"> 
      <div class="col-sm-offset-2 col-sm-10">
         <button type="button" id="delete_btn" class="inlog btn btn-danger">삭제</button>
         <button type="button" class="btn btn-primary" id="reply">댓글</button>
         <button id="list" type="button" class="btn btn-info">목록</button>
         <button type="submit" class="inlog btn btn-default" style="float: right">수정</button>
      </div>
   </div>
</form>
</body>
</html>