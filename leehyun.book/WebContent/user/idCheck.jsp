<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="leehyun.book.user.service.UserService"%>
<%@ page import="leehyun.book.user.service.UserServiceImpl"%>
<%@ page import="leehyun.book.user.domain.User"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%

	UserService userService = new UserServiceImpl();
	List<User> users = userService.listUsers();
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("userId");
	request.setAttribute("userId", userId);
%>

<%
	if (userId != null) {
		for (User user : users) {
			if (user.getUserId().equals(userId)) {
				request.setAttribute("idCheck", "사용불가");
%>
				<jsp:forward page='addUserIn.jsp?msgId=50' />
<%
	}
		}
	}request.setAttribute("idCheck", "사용가능");
%>
<jsp:forward page='addUserIn.jsp?msgId=51' />