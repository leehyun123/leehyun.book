<%@page import="java.text.DecimalFormat"%>
<%@page import="com.sun.scenario.effect.impl.prism.PrTexture"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<String> cartItem = (List<String>)session.getAttribute("cart");
	Cookie cookie = null;	

	for(String str : cartItem){
		String[] out1 = request.getParameterValues(str);
		if(out1.length == 5){
			cookie = new Cookie("ISBN" + out1[0], "1");
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
	}
%>
<c:redirect url="cartOut.jsp"/>