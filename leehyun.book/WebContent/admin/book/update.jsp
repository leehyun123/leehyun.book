<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leehyun.book.book.service.BookService'%>
<%@ page import='leehyun.book.book.service.BookServiceImpl'%>
<%@ page import='leehyun.book.book.domain.Book'%>
<%@ page import='java.util.List'%>

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
	/* function alert_modi() {
		swal({
			title : "수정하시겠습니까?",
			text : "도서 목록을 수정합니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function() {
			swal({
				title : "수정 성공",
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
	} */
	function alert_update() {
		swal({
			title : "수정하시겠습니까?",
			text : "도서 목록을 수정합니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				location.href = 'updateProc.jsp';
			}
		});
	}
</script>
<style>
label, p {
	font-size: large;
}

.div_top {
	margin-top: 10px;
	color: white;
	height: 20px;
	float: right;
}

.logoimg {
	color: #8FC9DB;
	background-color: white;
	font-size: 80px;
	border: 1px solid black;
	width: 600px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
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

.ad_btn_target {
	background-color: #8FC9DB;
}

.book_item {
	margin-top: 5px;
	height: 230px;
	padding: 15px;
	width: 1500px;
}

.book_img {
	width: 330px;
	height: 400px;
	margin-left: 40px;
	margin-right: 50px;
	float: left;
	text-align: center;
}

.book_img2 {
	width: 330px;
	height: 350px;
	margin: 0px;
	border: medium solid #8FC9DB;
	text-align: center;
	font-size: 25px;
}

.img_btn {
	margin-left: 80px;
	margin-top: 10px;
}

.cb_in {
	margin-right: 30px;
	float: right;
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

.blk30 {
	height: 40px;
}

.title {
	font-size: 35px;
}

.book_info {
	font-size: 23px;
	font-weight: 500;
}

.book_price {
	font-size: 40px;
	width: 300px;
}

.content {
	margin-left: 30px;
	font-weight: 600;
	font-size: 20px;
	overflow: auto;
	white-space: pre-wrap;
	font-family: '나눔고딕코딩';
	width: 1100px;
	height: 400px;
}

.cart_btn {
	margin-left: 30px;
	font-weight: 600;
	margin-bottom: 15px;
	font-size: 18px;
	width: 100px;
	height: 40px;
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
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
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
				onclick="location.href='02.html'">추가</button>
			<button class="btn btn-default input-lg ad_btn ad_btn_target"
				onclick="location.href='#'" disabled>수정</button>
			<button class="btn btn-default input-lg ad_btn"
				onclick="location.href='#'">삭제</button>
		</div>
	</div>
	
	<!-- 도서 수정 -->
	<%
		String isbnNum = request.getParameter("cb");

		BookService bookService = new BookServiceImpl();
		Book book = bookService.findBook(Long.parseLong(isbnNum));
	%>
	<div class="container" style="height: 420px;">
		<div class="book_item">
			<form action="updateProc.jsp">
				<div class="book_img">
					<img class="book_img"
						src="../../img/book/<%=book.getbookImg()%>.jpg" /> <input
						class="img_btn" type="file" name="uploadFile">
				</div>
				<br> <input name="book_title" class="title"
					value="<%=book.getbookTitle()%>" />
				<div class="blk30"></div>
				<label class="book_info">ISBN&nbsp;&nbsp;&nbsp;</label> <input
					name="book_ISBN" class="book_info" value="<%=book.getisbn()%>" /><br>
				<br> <label class="book_info">저자명&nbsp;</label> <input
					type="text" name="book_writer" class="book_info"
					value="<%=book.getauthor()%>" /><br> <br> <label
					class="book_info">출판사&nbsp;</label> <input type="text"
					name="book_pub" class="book_info" value="<%=book.getpublisher()%>" /><br>
				<br> 
				<label class="book_info">출판일&nbsp;</label> 
				<input type="date" name="book_pub_date" class="book_info"
					value="<%=book.getpublishDate()%>" />
				<br> <br> 
				<label class="book_info">&nbsp;&nbsp;가격&nbsp;&nbsp;</label> 
				<input type="number" name="book_price" class="book_price"
					value="<%=book.getbookPrice()%>" /><label class="book_info">원</label>
				<button class="cart_btn btn btn-info" type="submit" onClick="alert_update()">수정</button>
				<br>
			</form>
		</div>
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