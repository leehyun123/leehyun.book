<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%
	String bookTitle = request.getParameter("book_title");
	String bookIsbn = request.getParameter("book_ISBN");
	String author = request.getParameter("book_writer");
	String publisher = request.getParameter("book_pub");
	String publishDate = request.getParameter("book_pub_date");
	String bookPrice = request.getParameter("book_price");
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Date parsed = format.parse(publishDate);
    java.sql.Date sql = new java.sql.Date(parsed.getTime());
	
	Book book = new Book();
	book.setbookTitle(bookTitle);
	book.setisbn(Long.parseLong(bookIsbn));
	book.setauthor(author);
	book.setpublisher(publisher);
	book.setpublishDate(sql);
	book.setbookPrice(Integer.parseInt(bookPrice));
	
	if(bookTitle == null || bookTitle == ""){
%>
	<h3>도서 제목이 없습니다.</h3>
<%
	}else if(bookIsbn == null || bookIsbn == ""){
%>
	<h3>도서 ISBN이 없습니다.</h3>
<%
	}else if(author == null || author == ""){
%>
	<h3>도서 저자명이 없습니다.</h3>
<%
	}else if(publisher == null || publisher == ""){
%>
	<h3>도서 출판사가 없습니다.</h3>
<%
	}else if(publishDate == null || publishDate == ""){
%>
	<h3>도서 출판 날자가 없습니다.</h3>
<%
	}else if(bookPrice == null || bookPrice == ""){
%>
	<h3>도서 가격이 없습니다.</h3>
<%
	}else{
		BookService bookService = new BookServiceImpl();
		bookService.correctBook(book);
	}
%>
	<jsp:forward page="book.jsp" />