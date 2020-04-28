<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page import='java.util.List'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<%
	BookService bookService = new BookServiceImpl();
	List<Book> books = bookService.listBooks();

	if (books != null && books.size() > 0) {
		pageContext.setAttribute("books", books);
%>
<div class="book_item">
	<c:forEach var="book" items="${books}">
		<hr>
		<div class="cb_in">
			<input class="radio_btn" type="radio" name="cb" />
		</div>
		<div class="book_contents">
			<div class="book_img">${book.bookImg }</div>
			<div class="book_text">
				<div>
					<label class="title">${book.bookTitle }</label>
					
					<div class="book_text_top">
					<br>
						<label>저자명</label> <span>${book.author }</span> 
						<label>출판사</label> <span>${book.publisher }</span>
					</div>
					<div>
						<label>가격</label> <span>${book.bookPrice}</span>
						<label>출판일</label> <span>${book.publishDate }</span>
					</div>
				</div>
				<br>
				<div>
					<p>${book.bookOutline }</p>
				</div>
			</div>
		</div>
		<br>
	</c:forEach>
</div>
<%
	}
%>