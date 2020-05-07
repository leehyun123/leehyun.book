<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page import='java.util.List'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	BookService bookService = new BookServiceImpl();
	List<Book> books = bookService.listBooks();
%>	
<%
	String id = (String)session.getAttribute("sessionID");
	if(!id.equals("관리자")){
%>
 	<c:redirect url="../err/errPage.html"/> 
<%
	}
%>		
<%
	if (books != null && books.size() > 0) {
		pageContext.setAttribute("books", books);
%>
<div class="book_item">
	<c:forEach var="book" items="${books}">
		<hr>
		<div class="cb_in">
			<input class="radio_btn" type="radio" name="cb" value="${book.isbn }" />
		</div>
		<div class="book_contents">
			<img class="book_img" src="../../img/book/${book.bookImg}"/>
			<div class="book_text">
				<div>
					<label class="title">${book.bookTitle }</label>
					<div class="book_text_contents">
						<div class="book_text_top">
							<br> <label>저자명</label> <span>${book.author }</span> <label>가격</label>
							<span>${book.bookPrice}</span> <label>ISBN</label> <span>${book.isbn }</span>
						</div>
						<div class="book_text_bottom">
							<label>출판사</label> <span>${book.publisher }</span> <label>출판일</label>
							<span>${book.publishDate }</span>
						</div>
					</div>
				</div>
				<br>
				<div>
					<p>
						<c:choose>
							<c:when test="${fn:length(book.bookOutline) gt 99}">
								<c:out value="${fn:substring(book.bookOutline, 0, 98)}" />...
							</c:when>
							<c:otherwise>
								<c:out value="${book.bookOutline}"></c:out>
							</c:otherwise>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
		<br>
	</c:forEach>
</div>
<%
	}
%>