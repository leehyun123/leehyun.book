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

   if(userId != null && userAnswer != null){
	   for(User user: users){
		   if(userId.equals(user.getUserId())&& userAnswer.equals(user.getAnswer())){
			  
			  %>
			   <jsp:forward page="06.html"/>
			  <%
			  break;
		   }else {
			   request.setAttribute("pwFindMsg", "-1");
			  %>
			  	<jsp:forward page="pwFindIn.jsp"/>
			  <%
		   }
	   }
   }else{ request.setAttribute("pwFindMsg", "-2");
   %>
	  <jsp:forward page="pwFindIn.jsp"/>
   <%
   }
%>