<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>로그아웃 처리</title>
</head>
</html>
	<%
		session.invalidate();
	%>
<c:redirect url ="../main.jsp"/>