<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%
	String isbnNum = request.getParameter("cb");

	BookService bookService = new BookServiceImpl();
	bookService.secede(Integer.parseInt(isbnNum));
%>

<jsp:forward page="book.jsp" />