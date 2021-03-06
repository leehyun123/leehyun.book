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

	String userName = request.getParameter("userName");
	String phoneNum = request.getParameter("userTel");

	if (userName != null && phoneNum != null) {
		for (User user : users) {
			if (userName.equals(user.getUserName()) && phoneNum.equals(user.getPhoneNum())) {
				request.setAttribute("userId", user.getUserId());
%>
				<jsp:forward page="idFindResultIn.jsp" />
<%
	}
		}
	}
%>
				<c:redirect url='idFindIn.jsp?msgId=10' />