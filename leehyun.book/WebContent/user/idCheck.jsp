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
	request.setAttribute("msgOk", "사용가능한 아이디입니다.");
	String userId = request.getParameter("userId");
%>

<%
	if (userId != null) {
		for (User user1 : users) {
			if (user1.getUserId().equals(userId)) {
				request.setAttribute("msgFail", "존재하는 아이디입니다.");
				System.out.println("같음"); 
%>
<jsp:forward page="addUserIn.jsp"/>
<%
			}
		}
	}
%>