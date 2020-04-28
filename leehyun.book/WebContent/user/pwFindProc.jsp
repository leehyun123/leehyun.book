<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="leehyun.book.user.service.UserService"%>
<%@ page import="leehyun.book.user.service.UserServiceImpl"%>
<%@ page import="leehyun.book.user.domain.User"%>
<%@ page import="java.util.List, java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	List<User> users = userService.listUsers();

	String userId = request.getParameter("userId");
	String userAnswer = request.getParameter("userA");

	if (userId != null && userAnswer != null) {
		if (userService.findPw(userId) != null) {
			User user = userService.findPw(userId);
			if (userAnswer.equals(user.getAnswer())) {
				System.out.println(user.getAnswer());
				session.setAttribute("sessionUserNum", user.getUserNum());
%>
	<jsp:forward page="pwChangeIn.jsp" />
<%
	} else {
%>
	<c:redirect url='pwFindIn.jsp?msgId=10' />
<%
	}
		} else {
%>
	<c:redirect url='pwFindIn.jsp?msgId=10' />
<%
	}
	}
%>