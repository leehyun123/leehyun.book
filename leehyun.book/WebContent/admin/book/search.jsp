<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page import="leehyun.book.img.service.ImgService"%>
<%@ page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@ page import="leehyun.book.img.domain.Img"%>
<%@ page import='java.util.List'%>
<%
	request.setCharacterEncoding("utf-8");
	ImgService imgService = new ImgServiceImpl();
	Img img = imgService.findImg(1);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>북적북적</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function alert_delete() {
		swal({
			title : "삭제하시겠습니까?",
			text : "도서 목록을 삭제합니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function() {
			swal({
				title : "삭제 성공",
				text : "메인으로 이동하시겠습니까?",
				type : "success",
				showCancelButton : true,
				cancelButtonText : "아니오",
				confirmButtonText : "예",
				closeOnConfirm : true
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = '../main.jsp';
				}
			});
		});
	}
</script>
<style>
label, p {
	font-size: large;
}

.logoimg {
	color: #8FC9DB;
	background-color: white;
	width: 600px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
}

.div_top {
	margin-top: 10px;
	color: white;
	height: 20px;
	float: right;
}

.div_logo {
	height: 180px;
	text-align: center;
}

.search_input {
	width: 70%;
	height: 40px;
	color: black;
}

.search_btn {
	margin-left: 2%;
	margin-bottom: 4px;
	width: 80px;
	height: 40px;
}

.search_bar {
	height: 70px;
	background-color: #8FC9DB;
}

.div_top {
	margin-top: 10px;
	color: white;
	height: 20px;
	float: right;
}

.search_label {
	color: white;
	margin: 10px;
	margin-top: 14px;
	margin-left: 30px;
	font-size: 30px;
}

.tab {
	text-align: center;
}

.ad_btn {
	width: 24%;
	margin: 0px;
	margin-top: 20px;
}

.book_item {
	margin-top: 5px;
	margin-left: 10px;
	/* height: 230px; */
	padding: 15px;
}

.book_contents {
	overflow: hidden;
}

.book_img {
	width: 15%;
	height: 200px;
	margin-right: 5%;
	border: 1px solid black;
	float: left;
}

.book_text {
	float: left;
	width: 80%;
}

.book_text_contents span {
	margin-right: 5%;
}

.book_text span {
	font-size: 18px;
}

.book_text div {
	width: 100%;
}

.title {
	margin-top: 7px;
	font-size: x-large;
}

.cb_in {
	float: left;
	padding: 20px;
	padding-top: 90px;
}

.radio_btn {
	width: 20px;
	height: 20px;
}

.footer {
	text-align: center;
	height: 100px;
	margin-top: 20px;
	padding-top: 20px;
}

.footertext {
	font-size: small;
}

hr {
	border: solid 0.8px #8FC9DB;
}
</style>
</head>
<body>
	<div class="container">
		<div class="div_top">
			<a href="../../user/logoutProc.jsp">로그아웃</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.html' style="text-decoration: none;"><img src='../../img/<%=img.getImgUrl()%>' width="450"></a>
		</div>
	</div>
	<div class="search_bar">
		<label class="search_label" style="margin-left: 300px;">도서관리</label>
	</div>

	<div class="container">
		<div class="tab">
			<button class="btn btn-default input-lg ad_btn"
				onclick="location.href='book.jsp'">목록</button>
			<button class="btn btn-default input-lg ad_btn"
				onclick="location.href='add.jsp'">추가</button>
			<button class="btn btn-default input-lg ad_btn"
				onclick="location.href='update.jsp'">수정</button>
			<button class="btn btn-default input-lg ad_btn"
				onclick="alert_delete()">삭제</button>
		</div>
		<div class="search_bar" style="background-color: white;">
			<form class="search_form" action="search.jsp">
				<label class="search_label"
					style="font-size: 20px; margin-top: 20px; color: black;">도서검색&nbsp;</label>
				<input class="search_input" type="text" required />
				<button class="search_btn btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search">&nbsp;</span>검색
				</button>
			</form>
		</div>

		<%
			String words = request.getParameter("search_words");

			BookService bookService = new BookServiceImpl();
			List<Book> books = bookService.searchBook(words);
		%>
		<br>
		<p class="result container">
			<span class="glyphicon glyphicon-search"> </span> "<%=words%>"에 대한 검색
			결과입니다.
		</p>
		<%
			if (books != null && books.size() > 0) {
				pageContext.setAttribute("books", books);
		%>

		<!-- 검색 목록 -->
		<div class="book_item">
			<c:forEach var="book" items="${books}">
				<hr>
				<div class="cb_in">
					<input class="radio_btn" type="radio" name="cb" />
				</div>
				<div class="book_contents">
					<img class="book_img" src="../../img/book/${book.bookImg}.jpg"/>
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
									<c:when test="${fn:length(book.bookOutline) gt 100}">
										<c:out value="${fn:substring(book.bookOutline, 0, 99)}" />...
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
			} else {
		%>
		<div class='alert alert-info'>
			<hr>
			<h3 style="text-align: center;">등록된 도서가 없습니다.</h3>
			<hr>
		</div>
		<%
			}
		%>
	</div>

	<div class=footer>
		<hr>
		<p class='footertext'>
			대표이사 이 현 | 대표 전화 02 – 0000 – 0000<br> 본사 서울시 마포구 서교동 | 주소 서울시
			마포구 서교동<br> 고객센터 02 – 1234 - 1234
		</p>
	</div>
</body>
</html>