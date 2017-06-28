<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 보기</title>
<!-- 이미지 슬라이드 사이즈 조정 -->

<link rel="stylesheet" href="https://codemirror.net/lib/codemirror.css">
<link rel="stylesheet" href="https://codemirror.net/addon/scroll/simplescrollbars.css"><!-- 스크롤바 -->
<script src="https://codemirror.net/lib/codemirror.js"></script><!-- 필수 -->
<link rel="stylesheet" href="https://codemirror.net/theme/bespin.css"><!-- theme -->
<script src="https://codemirror.net/addon/edit/matchbrackets.js"></script><!-- 괄호강조 -->
<script src="https://codemirror.net/keymap/sublime.js"></script><!-- 괄호강조 -->
<script src="https://codemirror.net/addon/search/match-highlighter.js"></script><!-- 같은단어 강조 -->
<script src="https://codemirror.net/mode/xml/xml.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/javascript/javascript.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/css/css.js"></script><!-- 필수 -->
<script src="https://codemirror.net/mode/htmlmixed/htmlmixed.js"></script><!-- 필수 -->
<script src="https://codemirror.net/addon/scroll/simplescrollbars.js"></script><!-- 스크롤바 -->

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

.bodyst {
	padding: 8px;
	line-height: 20px;
	vertical-align: middle;
	background-color: white;
	border-radius: 10px;
}

.serport_btn:hover {
	background-color: #e83570;
}

/* 코드/미리보기 창 */
#splitter_container { width: 1100px; height: 300px; }
#splitters { position: relative; width: 100%; height: 300px;  } 
#splitters #splitter1 { position: absolute; word-break:break-all; background-color: #2f3840; top: 0; left: 0; bottom: 0; height: 300px; border: 0;}
#splitters #splitter2 { position: absolute; word-break:break-all; background-color: #ffffff; top: 0; right:0; bottom: 0; height: 300px; border: 0;}
#splitters #bar { position: absolute; background-color: #1B2227; top: 0; height: 300px;  }
#splitters #over { position: absolute; top: 0; left: 0; width: 100%; height: 300px;  visibility: hidden; z-index: 8; }
#splitters #splitter1 .html_tools { position: absolute; word-break:break-all; background-color: #21292e; top: -50px; left: 0;  height: 50px; width: 100%; border: 0; border-bottom: 2px solid #37444D;z-index: 20;}

/* CodeMirror */
.CodeMirror {border-top: 1px solid #eee; border-bottom: 1px solid #eee; line-height: 1.3; height: 300px; }
#preview { width: 100%; height: 300px; }
.cm-matchhighlight {background-color: #376060; color: #ffffff !important;} /* 같은단어강조 */
.CodeMirror-matchingbracket { background-color: #cc0000; color: #000000 !important; } /* 괄호강조 */
/* CodeMirror */       
</style>
<script>
$(function(){
  
    $("form[name=referenceForm]").submit(function(){
       $(this).append('<input type="hidden" name="re_num" value="${referenceInfo.re_num}"/>');
       $(this).attr('action','${pageContext.request.contextPath}/reference/updateReference.do');
    });
    
    $('input[name=referenceList]').click(function(){
       $(location).attr('href','${pageContext.request.contextPath}/reference/referenceList.do');
    });
    
    $("input[name=deleteBtn]").click(function(){
       $(location).attr('href','${pageContext.request.contextPath}/reference/deleteReference/${referenceInfo.re_num}.do');
    });
});
</script>
</head>
<body>
<div class="container">
	<h3>자료실 상세보기</h3>
</div>
<div class="container">
	<div class="box">
		<form action="" name="referenceForm">
		<table style="width:100%;">
			<!-- 게시판을 작성한 회원 아이디와 로그인된 아이디가 같으면 -->
			<c:if test="${LOGIN_MEMBERINFO.mem_id eq referenceInfo.mem_id }">
			<tr>
				<td style="width:10%;"><h3>제목 :</h3></td>
				<td style="width:20%;"><input type="text" name="re_tit" value="${referenceInfo.re_tit }" style="width:187px;"></td>
				<td style="width:10%;"><h3> 등록자 : </h3></td> 
				<td style="width:20%;"><h3> ${referenceInfo.mem_id } </h3></td>
				<td style="width:10%;"><h3> 작성일 : </h3></td> 
				<td style="width:20%;"><h3> ${fn:substring(referenceInfo.re_inst_date,0,10)} </h3></td>
				<td><input type="hidden" name="re_num" value="${referenceInfo.re_num }" /></td>
				<td><h3><a href=""><img src="${pageContext.request.contextPath}/resources/images/good-review.png" style="width:30px;height:30px;padding-bottom: 10px;"/></a>  ${referenceInfo.re_good } 개</h3> </td>
			</tr>
			</c:if>
			<!-- 게시판을 작성한 회원 아이디와 로그인된 아이디가 다르면 -->
			<c:if test="${LOGIN_MEMBERINFO.mem_id != referenceInfo.mem_id }">
			<tr >
				<td><h3>제목 : ${referenceInfo.re_tit }</h3></td>
				<td><h3>등록자 : ${referenceInfo.mem_id } </h3></td> 
				<td><h3>작성일 : ${fn:substring(referenceInfo.re_inst_date,0,10)}</h3></td> 
				<td><input type="hidden" name="re_num" value="" /></td>
				<td><h3><a href="${pageContext.request.contextPath}/reference/goodReference/${referenceInfo.re_num }.do"><img src="${pageContext.request.contextPath}/resources/images/good-review.png" style="width:30px;height:30px;padding-bottom: 10px;"/></a>  ${referenceInfo.re_good } 개</h3> </td>
			</tr>
			</c:if>
		</table>
		<c:if test="${LOGIN_MEMBERINFO.mem_id != referenceInfo.mem_id }">
		<div id="splitter_container">
			<div id="splitters" data-barsize="2">
				<div id="splitter1" data-size="60%" data-min="500" style="width:1148px;">
					<textarea id="code" name="code">${referenceInfo.re_con }</textarea>
				</div>
			</div>
		</div>
		</c:if>
		<c:if test="${LOGIN_MEMBERINFO.mem_id eq referenceInfo.mem_id }">
		<textarea name="re_con" style="width:1110px; height:300px;">${referenceInfo.re_con }</textarea>
		</c:if>
		<div style="padding-top: 11px; "align="right">
		<c:if test="${LOGIN_MEMBERINFO.mem_id eq referenceInfo.mem_id }">
			<input type="button" class="serport_btn btn btn-info" name="deleteBtn" value="삭제하기" />
			<input type="submit" class="serport_btn btn btn-info" name="updateBtn" value="수정하기" />
		</c:if>
				<input type="button" class="serport_btn btn btn-info" name="referenceList" value="자료실목록" />
		</div>
		</form>
	</div>
</div>
<<div class="container">
<!-- 댓글 부분 -->
<hr>
	<div id="commListbody">
		<c:forEach items="${commtList }"  var="commtInfo">
			<c:if test="${commtInfo.com_dep == 0 }">
				<div>
					<div class="bodyst" style="width: 100%;">
						<table style="width:1130px;">
							<tr>
								<td style = "vertical-align: top; width: 30px;">
									<c:if test="${!empty commtInfo.mem_profile }" > 
                     					<img src="http://192.168.201.222/file/${commtInfo.mem_profile}" class="img-responsive img-circle" style="width: 50px; height: 50px;"> 
                    				</c:if> 
                    				<c:if test="${empty commtInfo.mem_profile }">
                    					<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">
                    				</c:if>
									<span style="margin-left: 10px;">${commtInfo.mem_nm}</span>
									<br><br>
									<div>
										${commtInfo.com_con}
									</div>
									<br><br>
									<div style="margin: -30px 15px 0 0;" align="right">
										<input class="btn btn-info serport_btn" name="replaybtn" align="right" type="button" value="댓   글">
										<input type="hidden" name="com_num" value="${commtInfo.com_num }"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<br>
				</div>
			</c:if>
			<c:if test="${commtInfo.com_dep != 0 }">
				<div>
					<div  class="bodyst" style="width: 100%;">
						<table style="width:1130px;">
							<tr>
								<td style = "vertical-align: top; width: 30px;">
									<div style="margin-top: 12px;">
										<i class="icon-level-up icon-2x icon-rotate-90"style="margin-top: -30px;"></i>
									</div>
								</td>
								<td>
									<div style="margin-left: 15px;">
										<c:if test="${!empty commtInfo.mem_profile }" > 
			                     			<img src="http://192.168.201.222/file/${commtInfo.mem_profile}" class="img-responsive img-circle" style="width: 50px; height: 50px;"> 
			                    		</c:if> 
			                    		<c:if test="${empty commtInfo.mem_profile }">
			                    			<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">
			                    		</c:if>
										<span style="margin-left: 10px;">${commtInfo.mem_nm}</span>
										<br><br>
										${commtInfo.com_con}
									</div>
									<br><br>
								</td>
							</tr>
						</table>
					</div>
					<br>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<form id="insertcmtForm" class = "insertcmtFormt" action="${pageContext.request.contextPath}/insertcommt.do" method="post" >
		<div class="bodyst" style="height: 225px; width: 100%;">
			<div>
				<input type="hidden" name="re_num" value="${referenceInfo.re_num }">
				<c:if test="${!empty mem_profile }" > 
                	<img src="http://192.168.201.222/file/${mem_profile}" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;"> 
                </c:if> 
                <c:if test="${empty mem_profile }">
                	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;">
                </c:if>
				<textarea style="resize: none; margin: 20px 0px 10px 50px; width: 800px; height: 140px;" name="com_con"></textarea>
				<br>
			</div>
			<div class="hproperty" style="width:100px; margin: 10px 0 0 46px; text-align: center;">
				<h4 class="hproperty"><strong>${LOGIN_MEMBERINFO.mem_nm}</strong></h4>
			</div>
			<div style="margin: -30px 15px 0 0;" align="right">
				<input class="btn btn-info serport_btn" align="right" type="button" name="submitbtn" value="작성하기">
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
$(function() {
//등록과 리스트를 가져와 출력
$("input[name='submitbtn']").click(function() {
	$('#insertcmtForm').ajaxSubmit({
		dataType:'json',
		success:function(data){
		var htmlCode = "";
		// 댓글이면 깊이가 1
		$.each(data.commtList, function(i,v){
			
			// 댓글이 아니라면 출력
			if(v.com_dep == 0 || v.com_dep == '0' ){
			htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                                ';
			htmlCode += '	<table style="width:1130px;">                                                                                                                                                                  ';
			htmlCode += '		<tr>                                                                                                                                                                 ';
			htmlCode += '			<td>        ';
			if(v.mem_profile != null){
     		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
			}else{
    		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
			}
			htmlCode += '			<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                                ';
			htmlCode += '			<br><br>                                                                                                                                                         ';
			htmlCode += '			<div> '+v.com_con+'                                                                                                                                                            ';
			htmlCode += '			</div>                                                                                                                                                           ';
			htmlCode += '				<br><br>                                                                                                                                                    ';
			htmlCode += '				<div style="margin: -30px 15px 0 0;" align="right">                                                                                                          ';
			htmlCode += '					<input class="btn btn-info serport_btn" name="replaybtn" align="right" type="button" value="댓   글"> <input type="hidden" name="com_num" value="'+v.com_num+'"/>                                                    ';
			htmlCode += '				</div>                                                                                                                                                       ';
			htmlCode += '			</td>                                                                                                                                                            ';
			htmlCode += '		</tr>                                                                                                                                                                ';
			htmlCode += '	</table>                                                                                                                                                                 ';
			htmlCode += '</div>                                                                                                                                                                       ';
			htmlCode += '<br></div>                                                                                                                                                                         ';
			}
			
		// 댓글이면 출력
		else{
			
		htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                              ';
		htmlCode += '	<table style="width:1130px;">                                                                                                                                                                ';
		htmlCode += '		<tr>                                                                                                                                                               ';
		htmlCode += '			<td  style = " width: 30px; vertical-align: top; ">                                                                                                                           ';
		htmlCode += '				<div style="margin-top: 12px;">                                                                                                                            ';
		htmlCode += '					<i class="icon-level-up icon-2x icon-rotate-90"                                                                                                        ';
		htmlCode += '						style="margin-top: -30px;"></i>                                                                                                                    ';
		htmlCode += '				</div>                                                                                                                                                     ';
		htmlCode += '			</td>                                                                                                                                                          ';
		htmlCode += '			<td>                                                                                                                                                           ';
		htmlCode += '				<div style="margin-left: 15px;">                                                                                                                           ';
		if(v.mem_profile != null){
     		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
			}else{
    		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
			}
		htmlCode += '					<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                      ';
		htmlCode += '					<br><br>'+v.com_con+'                                                                                                                                               ';
		htmlCode += '				</div>                                                                                                                                                     ';
		htmlCode += '				<br><br>                                                                                                                                                   ';
		htmlCode += '			</td>                                                                                                                                                          ';
		htmlCode += '		</tr>                                                                                                                                                              ';
		htmlCode += '	</table>                                                                                                                                                               ';
		htmlCode += '</div>                                                                                                                                                                    ';
		htmlCode += '<br></div>                                                                                                                                                                      ';
			
		}
		});
		
		$('#commListbody').html(htmlCode);
 	     }

 	});
	
	$("textarea[name='com_con']").val('');
	
});


// 댓글 버튼 클릭시 폼 생성
$(document).on('click','input[name="replaybtn"]',function(){
	
	$('.insertcmtFormt').hide();
	$('.insertReplyt').hide();
	var commtprimary = $(this).siblings("input[name='com_num']").val();
	var htmlCode ="";
	htmlCode +='<form id="insertReply" class="insertReplyt" action="${pageContext.request.contextPath}/insertreplycommt.do" method="post" >                                ';
	htmlCode +='  <input type="hidden" name="com_num" value="'+commtprimary+'"/>                                                         ';
	htmlCode +='<div class="bodyst" style="height: 225px; width: 100%;">                                                                         ';
	htmlCode +='	<div><input type="hidden" name="re_num" value="${referenceInfo.re_num }">                                                                                                                        ';
	htmlCode +='<c:if test="${!empty mem_profile }" >                                                                                                                                                           ';
	htmlCode +='        	<img src="http://192.168.201.222/file/${mem_profile}" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;">                  ';
	htmlCode +='       </c:if>                                                                                                                                                                                  ';
	htmlCode +='       <c:if test="${empty mem_profile }">                                                                                                                                                      ';
	htmlCode +='       	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="margin-top: 10px; margin-left: 20px; width: 150px; height: 150px;">       ';
	htmlCode +='       </c:if>                                                                                                                                                                                  ';
	htmlCode +='		<textarea style="resize: none; margin: 20px 0px 10px 50px; width: 800px; height: 140px;" name="com_con"></textarea>      ';
	htmlCode +='		<br>                                                                                                                     ';
	htmlCode +='	</div>                                                                                                                       ';
	htmlCode +='	<div class="hproperty" style="width:100px; margin: 10px 0 0 46px; text-align: center;">                                                                       ';
	htmlCode +='		<h4 class="hproperty"><strong>${LOGIN_MEMBERINFO.mem_nm}</strong></h4>                                                                                      ';
	htmlCode +='	</div>                                                                                                                       ';
	htmlCode +='	<div style="margin: -30px 15px 0 0;" align="right">                                                                          ';
	htmlCode +='		<input class="btn btn-info serport_btn" align="right" type="button" name="replysubmit" value="댓글작성">                   ';
	htmlCode +='		<input class="btn btn-info serport_btn" align="right" type="button" name="replycancel" value="취소">                   ';
	htmlCode +='	</div>                                                                                                                       ';
	htmlCode +='</div>                                                                                                                           ';
	htmlCode +='</form>                                                                                                                          ';
	$(this).parent().parent().parent().parent().parent().parent().parent().append(htmlCode);
	
});

// 댓글 작성하기 버튼 클릭시 보내주고 리스트 불러오기
$(document).on('click','input[name="replysubmit"]',function(){
	$('#insertReply').ajaxSubmit({
		dataType:'json',
		success:function(data){
		var htmlCode = "";
		// 댓글이면 깊이가 1
		$.each(data.commtList, function(i,v){
			
			// 댓글이 아니라면 출력
			if(v.com_dep == 0 || v.com_dep == '0' ){
			htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                                ';
			htmlCode += '	<table style="width:1130px;">                                                                                                                                                                  ';
			htmlCode += '		<tr>                                                                                                                                                                 ';
			htmlCode += '			<td>        ';    
			if(v.mem_profile != null){
         		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
			}else{
        		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
			}
			htmlCode += '			<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                                ';
			htmlCode += '			<br><br>                                                                                                                                                         ';
			htmlCode += '			<div> '+v.com_con+'                                                                                                                                                            ';
			htmlCode += '			</div>                                                                                                                                                           ';
			htmlCode += '				<br><br>                                                                                                                                                    ';
			htmlCode += '				<div style="margin: -30px 15px 0 0;" align="right">                                                                                                          ';
			htmlCode += '					<input class="btn btn-info serport_btn" name="replaybtn" align="right" type="button" value="댓   글"><input type="hidden" name="com_num" value="'+v.com_num+'"/>                                                    ';
			htmlCode += '				</div>                                                                                                                                                       ';
			htmlCode += '			</td>                                                                                                                                                            ';
			htmlCode += '		</tr>                                                                                                                                                                ';
			htmlCode += '	</table>                                                                                                                                                                 ';
			htmlCode += '</div>                                                                                                                                                                       ';
			htmlCode += '<br></div>                                                                                                                                                                         ';
			}
			
		// 댓글이면 출력
		else{
			
		htmlCode += '	<div><div class="bodyst" style="width: 100%;">                                                                                                                              ';
		htmlCode += '	<table style="width:1130px;">                                                                                                                                                                ';
		htmlCode += '		<tr>                                                                                                                                                               ';
		htmlCode += '			<td style = "width: 30px; vertical-align: top; ">                                                                                                                           ';
		htmlCode += '				<div style="margin-top: 12px;">                                                                                                                            ';
		htmlCode += '					<i class="icon-level-up icon-2x icon-rotate-90"                                                                                                        ';
		htmlCode += '						style="margin-top: -30px;"></i>                                                                                                                    ';
		htmlCode += '				</div>                                                                                                                                                     ';
		htmlCode += '			</td>                                                                                                                                                          ';
		htmlCode += '			<td>                                                                                                                                                           ';
		htmlCode += '				<div style="margin-left: 15px;">                                                                                                                           ';
		if(v.mem_profile != null){
     		htmlCode += '	<img src="http://192.168.201.222/file/'+v.mem_profile+'" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                     ';
		}else{
    		htmlCode += '	<img src="${pageContext.request.contextPath}/resources/images/profile.png" class="img-responsive img-circle" style="width: 50px; height: 50px;">                                ';
		}
		htmlCode += '					<span style="margin-left: 10px;">'+v.mem_nm+'</span>                                                                                                      ';
		htmlCode += '					<br><br>'+v.com_con+'                                                                                                                                               ';
		htmlCode += '				</div>                                                                                                                                                     ';
		htmlCode += '				<br><br>                                                                                                                                                   ';
		htmlCode += '			</td>                                                                                                                                                          ';
		htmlCode += '		</tr>                                                                                                                                                              ';
		htmlCode += '	</table>                                                                                                                                                               ';
		htmlCode += '</div>                                                                                                                                                                    ';
		htmlCode += '<br></div>                                                                                                                                                                      ';
			
		}
		});
		
		$('#commListbody').html(htmlCode);
 	     }

	
 	});
	
	$("textarea[name='com_con']").val('');
	$('.insertReplyt').hide();
	$('#insertcmtForm').show();
});

$(document).on('click','input[name="replycancel"]',function(){
	$('.insertReplyt').hide();
	$('#insertcmtForm').show();
});

});

/*
* 코드/미리보기 창 리사이즈
*/
$("#splitters").append("");
var splitters  = $("#splitters");
var splitter1 = $("#splitter1");
var splitter2 = $("#splitter2");
var bar  = $("#bar");
var over = $("#over");
var splitter1_setSize = splitter1.data("size");
var splitter2_setSize = splitter2.data("size");
var splitter1_setMin = splitter1.data("min");
var splitter2_setMin = splitter2.data("min");
var barSize = splitters.data("barsize");

bar.mousedown(function (event) {
	event.preventDefault();
	splitters.mousemove(function (event) {
		event.preventDefault();
		gap = $(window).width() - splitters.width();
		bar.css("left", event.pageX-gap);
	});
	over.css("visibility","visible");
});

bar.mouseup(function (event) {
    splitters.unbind("mousemove");
	gap = $(window).width() - splitters.width();
	if(splitters.width() > splitter1_setMin + splitter2_setMin){
		if(event.pageX-gap < splitter1_setMin){
			splitter1.css("width", splitter1_setMin + barSize);
			bar.css("left", splitter1_setMin );
			splitter2.css("width",  splitters.width() - splitter1.width() - barSize );
		}else if(event.pageX-gap  > splitters.width() - splitter2_setMin){
			splitter1.css("width", splitters.width() - splitter2_setMin + barSize);
			bar.css("left", splitters.width() - splitter2_setMin );
			splitter2.css("width",  splitters.width() - splitter1.width() - barSize );
		}else{
			splitter1.css("width", bar.position().left + barSize );
			splitter2.css("width",  splitters.width() - splitter1.width() - barSize );
		}
	}else{
		splitter1.css("width", splitter1_setSize);
		splitter2.css("width", splitter2_setSize);
		bar.css("left", splitter1.width() );
	}
	over.css("visibility","hidden");
	$("#side_content").css("width", $("#splitter1").outerWidth()-2+"px");
});

/*
* CodeMirror
*/
      var delay;
      // Initialize CodeMirror editor with a nice html5 canvas demo.
      var editor = CodeMirror.fromTextArea(document.getElementById('code'), {
        mode: 'text/html',           // 문서타입
		lineNumbers: true,           // 라인넘버 표시
		scrollbarStyle: "simple",    // 스크롤바 스타일
		keyMap: "sublime",           // 괄호강조
		matchBrackets: true,         // 괄호강조
		theme: "bespin",            // 테마
		tabSize: 2,                  // 탭키 간격
		lineWrapping: true,           // 가로 스크롤바 숨김, 너비에 맞게 줄바꿈.
		highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true}, // 같은단어강조
      });

      editor.on("change", function() {
        clearTimeout(delay);
        delay = setTimeout(updatePreview, 300);
      });
</script>
</html>