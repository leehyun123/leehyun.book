<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "leehyun.book.user.service.UserService" %>
<%@ page import = "leehyun.book.user.service.UserServiceImpl" %>
<%@ page import = "leehyun.book.user.domain.User" %>
<%@ page import="java.util.List, java.util.ArrayList"%>

<%
   request.setCharacterEncoding("utf-8");
   UserService userService = new UserServiceImpl();
   List<User> users = userService.listUsers();
   
   String id = request.getParameter("userId");
   String pw = request.getParameter("password");
   
   if(id != null && pw != null){
      for(User user : users){
         if(user.getUserId().equals(id) && user.getPassword().equals(pw)){
            session.setAttribute("sessionID", user.getUserName());
            session.setAttribute("sessionID", user.getUserNum());
            if(id.equals("admin")){
%>
               <c:redirect url="../admin/main.html"/>
<%               
            }else{
%>
               <c:redirect url="../main.jsp"/>
<%
            }
         }
      }
   }
%>
   <c:redirect url="loginIn.html"/>