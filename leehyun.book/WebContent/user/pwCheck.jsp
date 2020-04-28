<%@page import="leehyun.book.user.domain.User"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%
	UserServiceImpl userService = new UserServiceImpl();
	User user = userService.findUser((int) session.getAttribute("sessionUserNum"));
	String pw = request.getParameter("userPwd");
	if(user.getPassword().equals(pw)){
%>
		<jsp:forward page="pwChangeIn.jsp" />
<%
	}else{
%>
		<c:redirect url='userInfo.jsp?msgId=20' />
<%
	}
%>