<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page import='java.util.List'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

</style>
<%  
	BookService bookService = new BookServiceImpl();
	List<Book> books = bookService.listBooks();

	if (books != null && books.size() > 0) {
		pageContext.setAttribute("books", books);
%>
	<c:forEach var="book" items="${books}">
		<div class="book_item" onClick="location.href='book/book.jsp?isbn=${book.isbn}'">
			<img class="book_img" src="img/book/${book.bookImg}"/>
			<h4>
				<c:choose>
					<c:when test="${fn:length(book.bookTitle) gt 12}">
						<c:out value="${fn:substring(book.bookTitle, 0, 11)}"/>...
					</c:when>
					<c:otherwise>
						<c:out value="${book.bookTitle }"></c:out>
					</c:otherwise>
				</c:choose>
			</h4>
			<h6>
				<c:choose>
					<c:when test="${fn:length(book.publisher) gt 12}">
						<c:out value="${fn:substring(book.publisher, 0, 11)}"/>...
					</c:when>
					<c:otherwise>
						<c:out value="${book.publisher }"></c:out>
					</c:otherwise>
				</c:choose>
			</h6>
		</div>
	</c:forEach>
<%
	} else {
%>
	<div class='alert alert-info'>
		<strong>등록된 도서가 없습니다.</strong>
	</div>
<%
	}
%>