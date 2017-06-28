<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css"/>

       
<style>

</style>
</head>

<body>
	<div class="container">
	<h3>자료실 등록</h3>
	</div>
		
	<div class="container">
	<form name="referenceForm" action="${pageContext.request.contextPath}/reference/insertReferenceInfo.do">
	<table class="table table-bordered" >

            <tr>
                <th>제목 </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="re_tit" class="form-control"/></td>
            </tr>
            <tr>
            	<th>작성자 </th>
            	<td><input type="text" value="${LOGIN_MEMBERINFO.mem_id}" name="mem_id"  disabled="disabled"></td>
            </tr>
            <tr>
                <th>내용 </th>
                <td><textarea style="width: 1059px; height: 228px;" name="re_con"></textarea></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록"  class="btn btn-success btn-lg pull-right"/>
                </td>
            </tr>            
          </table>  
        </form>
</div>
</body>
</html>