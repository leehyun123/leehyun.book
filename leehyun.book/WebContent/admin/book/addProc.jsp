<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%
	request.setCharacterEncoding("utf-8");
	
	String attachPath = "/img/book";
	int fileMaxSize = 1024 * 1024 * 5;
	String enctype = "utf-8";
	
	ServletContext ctx = getServletContext();
	attachPath = ctx.getRealPath(attachPath);
	
	MultipartRequest mRequest = null;
	
	mRequest = new MultipartRequest(request, attachPath, fileMaxSize, enctype, new DefaultFileRenamePolicy());
	
	Book book = new Book();

	String bookIsbn = mRequest.getParameter("book_ISBN");
	String bookTitle = mRequest.getParameter("book_title");
	String author = mRequest.getParameter("book_writer");
	String publisher = mRequest.getParameter("book_pub");
	String publishDate = mRequest.getParameter("book_pub_date");
	String bookPrice = mRequest.getParameter("book_price");
	String bookOutline = mRequest.getParameter("bookOutline");
	
	request.setAttribute("bookIsbn", bookIsbn);
	request.setAttribute("bookTitle", bookTitle);
	request.setAttribute("author", author);
	request.setAttribute("publisher", publisher);
	request.setAttribute("publishDate", publishDate);
	request.setAttribute("bookPrice", bookPrice);
	request.setAttribute("bookOutline", bookOutline);

	if(mRequest.getFilesystemName("uploadFile") == null || bookIsbn == null || bookTitle == null || author == null || publisher == null || publishDate == null
			|| bookPrice == null || bookOutline == null ||bookIsbn.equals("")|| bookTitle.equals("") || author.equals("") || publisher.equals("") || publishDate.equals("")
			|| bookPrice.equals("") || bookOutline.equals("")
			|| Integer.parseInt(bookPrice) < 1){
		request.setAttribute("fail", 1);
%>
	<jsp:forward page="add.jsp" />
<%
	}

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date parsed = format.parse(publishDate);
	java.sql.Date sql = new java.sql.Date(parsed.getTime());
	
	book.setbookImg(mRequest.getFilesystemName("uploadFile"));
	
	try{
	book.setisbn(Long.parseLong(bookIsbn));
	book.setbookPrice(Integer.parseInt(bookPrice));
	}catch (Exception e){
		request.setAttribute("numfail", 1);
%>
		<jsp:forward page="add.jsp" />
<%
	}
	
	book.setbookTitle(bookTitle);
	book.setauthor(author);
	book.setpublisher(publisher);
	book.setpublishDate(sql);
	
	book.setbookOutline(bookOutline);

	BookService bookService = new BookServiceImpl();
	try{
	bookService.joinBook(book);
	}catch (Exception e){
		request.setAttribute("isbnfail", 1);
%>
		<jsp:forward page="add.jsp" />
<%
	}

	request.setAttribute("suc", 1);
%>
<jsp:forward page="add.jsp" />