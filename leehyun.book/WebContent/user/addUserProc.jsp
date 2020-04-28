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
	String password = request.getParameter("userPwd");
	String password2 = request.getParameter("userPwd2");
	String userName = request.getParameter("userName");
	String gender = request.getParameter("gender");
	String email = request.getParameter("userEmail");
	String phoneNum = request.getParameter("userTel");
	String answer = request.getParameter("userA");
	String birthday = request.getParameter("userDate");

	User user = new User();
%>

<%
	if (userId != null && password != null && password2 != null && userName != null && birthday != null
			&& gender != null && email != null && phoneNum != null && answer != null) {
		if (password.equals(password2)) {
			user.setUserId(userId);
			user.setPassword(password);
			user.setUserName(userName);
			user.setBirthday(birthday);
			user.setEmail(email);
			user.setPhoneNum(phoneNum);
			user.setAnswer(answer);
			user.setGender(gender);

			userService.join(user);
%>
<jsp:forward page="loginIn.jsp" />
<%
	} else {
%>
<c:redirect url='addUserIn.jsp?msgId=20' />
<%
	}
%>

<%
	}
%>
<c:redirect url='addUserIn.jsp?msgId=40' />
<%
	
%>
<jsp:forward page="addUserIn.jsp" />