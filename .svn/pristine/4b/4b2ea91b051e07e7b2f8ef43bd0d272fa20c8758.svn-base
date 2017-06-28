<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.fc-content{
cursor:pointer;
}
</style>
</head>
<body>
<div class="container">
	<div id="calendar"></div>
	
</div>
</body>
<script type="text/javascript">
	var today = new Date();
	var toYear = today.getFullYear().toString();
	var toMonth = (today.getMonth() + 1).toString();
	var free_id;
	if(toMonth < 10){
		toMonth = "0"+ toMonth;
	}
	var toDate = today.getDate().toString();
	
    jQuery(document).ready(function() {
        jQuery("#calendar").fullCalendar({
              defaultDate : ""+toYear+"-"+toMonth+"-"+toDate+""
            , editable : false
            , eventLimit : true
            , events: [
                
			<c:forEach var="memberInfo" items="${mettingList}">
			{
			   <c:if test ="${LOGIN_MEMBERINFO.mem_type eq 'C'}">
			      title : "\n${memberInfo.me_free_nm}(${memberInfo.askmem})님과의 화상미팅"
			      ,url :   "http://192.168.201.222/plzdvl/videChat.do?free_nm=${memberInfo.me_free_nm}"
			   </c:if>
			   <c:if test ="${LOGIN_MEMBERINFO.mem_type eq 'F'}">
			      title : "\n${memberInfo.me_cnt_nm}(${memberInfo.askmem})님과의 화상미팅"
			      ,url :   "http://192.168.201.222/plzdvl/videChat.do?cnt_nm=${memberInfo.me_cnt_nm}"
			   </c:if>
			   ,start : "${memberInfo.me_date}"
			},
			    </c:forEach>
			            ]
        });
    });
</script>
</html>