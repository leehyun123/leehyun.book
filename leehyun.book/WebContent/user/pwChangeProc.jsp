<%@page import="leehyun.book.user.domain.User"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%
	UserService userService = new UserServiceImpl();
	String userPwd = request.getParameter("userPwd");
	String userPwd2 = request.getParameter("userPwd2");
	
	if(userPwd.equals(userPwd2)){
		User user = userService.findUser((int) session.getAttribute("sessionUserNum"));
		user.setPassword(userPwd);
		userService.correctUser(user);
%>
		<c:redirect url='loginIn.jsp?msgId=21' />
<%
	}else{
%>
		<c:redirect url='pwChangeIn.jsp?msgId=20' />
<%
	}
%>