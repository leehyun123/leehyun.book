<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%
	if(session.getAttribute("sessionID")==null){
%>
		<c:redirect url="../err/errPage.jsp"/>
<%
	}
%>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<c:choose>
	<c:when test='${param.msgId==10}'>
		<c:set var='msg' value='일치하는 정보가 없습니다.' />
	</c:when>
	<c:when test='${param.msgId==11}'>
		<c:set var='msg' value='회원정보 수정이 완료 되었습니다.' />
	</c:when>
	<c:when test='${param.msgId==20}'>
		<c:set var='msg' value='비밀번호가 일치하지 않습니다.' />
	</c:when>
	<c:when test='${param.msgId==21}'>
		<c:set var='msg' value='비밀번호 변경 완료: 다시 로그인 해주세요.' />
	</c:when>
	<c:when test='${param.msgId==30}'>
		<c:set var='msg' value='로그인 실패: 아이디와 비밀번호를 다시 확인해주세요.' />
	</c:when>
	<c:when test='${param.msgId==40}'>
		<c:set var='msg' value='가입 실패: 모든 항목을 입력해야 합니다.' />
	</c:when>
	<c:when test='${param.msgId==41}'>
		<c:set var='msg' value='회원가입이 완료되었습니다. 로그인해서 이용해주세요.' />
	</c:when>
	<c:when test='${param.msgId==50}'>
		<c:set var='msg' value='이미 사용중인 아이디 입니다.' />
	</c:when>
	<c:when test='${param.msgId==51}'>
		<c:set var='msg' value='사용 가능한 아이디 입니다!' />
	</c:when>
	<c:when test='${param.msgId==60}'>
		<c:set var='msg' value='이미 가입된 전화번호 입니다.' />
	</c:when>
</c:choose>

<div
	class='alert fade in
	${param.msgId == "11" || fn:endsWith(param.msgId, "1")?
		"alert-success" : "alert-danger" }' style="text-align: center;">
	<a href='#' class='close' data-dismiss='alert'>&times;</a> <strong>${msg}</strong>
</div>
