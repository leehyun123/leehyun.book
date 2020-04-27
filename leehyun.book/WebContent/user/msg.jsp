<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions' %>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<c:choose>
	<c:when test='${param.msgId==10}'>
		<c:set var='msg' value='일치하는 정보가 없습니다.'/>
	</c:when>
	<c:when test='${param.msgId==20}'>
		<c:set var='msg' value='비밀번호가 일치하지 않습니다.'/>
	</c:when>
	<c:when test='${param.msgId==21}'>
		<c:set var='msg' value='비밀번호 변경을 완료하였습니다. 다시 로그인 해주세요.'/>
	</c:when>
	<c:when test='${param.msgId==30}'>
		<c:set var='msg' value='탈퇴 실패: 탈퇴시킬 사용자를 선택해야 합니다.'/>
	</c:when>
</c:choose>	
	
<div class='alert fade in
	${param.msgId == "11" || fn:endsWith(param.msgId, "1")?
		"alert-success" : "alert-danger" }'>
	<a href='#' class='close' data-dismiss='alert'>&times;</a>
	<strong>${msg}</strong>		
</div>
