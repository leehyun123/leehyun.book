<%@page import="leehyun.book.user.domain.User"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%
	request.setCharacterEncoding("utf-8");
	
	UserService userService = new UserServiceImpl();
	User user = userService.findUser((int) session.getAttribute("sessionUserNum"));	

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	String userEmail = request.getParameter("userEmail");
	String pwA = request.getParameter("pwA");
	
	System.out.println(userName);
	System.out.println(userTel);
	System.out.println(userEmail);
	System.out.println(pwA);
	
	user.setUserName(userName);
	user.setPhoneNum(userTel);
	user.setEmail(userEmail);
	user.setAnswer(pwA);
	userService.correctUser(user);
%>
<c:redirect url ="userInfo.jsp"/>