<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ISBN = (String)request.getParameter("isbn");
	Cookie cookie = null;
	cookie = new Cookie("ISBN" + ISBN, ISBN);
	cookie.setMaxAge(60 * 60 * 24 * 365);
	cookie.setPath("/");
	response.addCookie(cookie);
%>

<c:redirect url="cartOut.jsp"/>