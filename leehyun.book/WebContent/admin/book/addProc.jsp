<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%
	String bookIsbn = request.getParameter("book_ISBN");	
	String bookTitle = request.getParameter("book_title");	
	String author = request.getParameter("book_writer");
	String publisher = request.getParameter("book_pub");
	String publishDate = request.getParameter("book_pub_date");
	String bookPrice = request.getParameter("book_price");
	String bookImg = request.getParameter("book_img");
	String bookOutline = request.getParameter("bookOutline");
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    Date parsed = format.parse(publishDate);
    java.sql.Date sql = new java.sql.Date(parsed.getTime());
	
	Book book = new Book();
	book.setisbn(Long.parseLong(bookIsbn));
	book.setbookTitle(bookTitle);
	book.setauthor(author);
	book.setpublisher(publisher);
	book.setpublishDate(sql);
	book.setbookPrice(Integer.parseInt(bookPrice));
	book.setbookImg("l"+bookIsbn);
	book.setbookOutline(bookOutline);
	
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
		bookService.joinBook(book);
	}
%>
	<jsp:forward page="book.jsp" />