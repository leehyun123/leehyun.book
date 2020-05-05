<%@page import="java.text.DecimalFormat"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function cart(cartcnt) {
		console.log(cartcnt);
		if(cartcnt < 10 ) {
			swal({
				title : "장바구니 담기 성공!",
				text : "",
				type : "success",
				showCancelButton : false,
				cancelButtonText : "아니오",
				confirmButtonText : "예",
				closeOnConfirm : false
				}, function() {
					document.cartAdd.submit();
			});
		}else{
			swal({
				title : "장바구니 담기 실패!",
				text : "장바구니는 10개까지만 저장됩니다.\n장바구니로 이동하시겠습니까?",
				type : "warning",
				showCancelButton : true,
				cancelButtonText : "아니오",
				confirmButtonText : "예",
				closeOnConfirm : false
				}, function() {
					location.href = '../order/cartOut.jsp';
			});
		}
	};
</script>
<style>
label, p {
	font-size: large;
}

.welcome {
	display: inline;
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

.div_top {
	margin-top: 10px;
	color: black;
	height: 20px;
	float: right;
}

.div_logo {
	height: 180px;
	text-align: center;
}

.search_bar {
	height: 70px;
	background-color: #8FC9DB;
	text-align: center;
}

.search_label {
	color: white;
	margin: 10px;
	margin-top: 14px;
	margin-left: 30px;
	font-size: x-large;
}

.search_input {
	width: 40%;
	height: 40px;
	color: black;
}

.search_btn {
	margin-left: 2%;
	margin-bottom: 4px;
	width: 80px;
	height: 40px;
}

.book_img {
	width: 330px;
	height: 400px;
	margin-left: 40px;
	margin-right: 50px;
	float: left;
	text-align: center;
	font-size: 25px;
}

.footer {
	text-align: center;
	height: 100px;
	margin-top: 100px;
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

.blk20 {
	height: 10px;
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
}

.content {
	margin-left: 30px;
	font-weight: 600;
	font-size: 20px;
	overflow: auto;
	white-space: pre-wrap;
	font-family: '나눔고딕코딩';
}

.book_item {
	width: 1500px;
}

.cart_btn {
	margin-left: 15%;
	font-weight: 600;
	margin-bottom: 15px;
	font-size: 18px;
	width: 200px;
	height: 40px;
}
</style>
</head>
<%
	long isbn = Long.parseLong(request.getParameter("isbn"));

	Cookie[] cookies = request.getCookies();
	
	BookService bookService = new BookServiceImpl();
	
	DecimalFormat df = new DecimalFormat("###,###");

	int cartCnt = 0;

	for(Cookie cookie : cookies){
		if(cookie.getName().substring(0, 4).equals("ISBN"))
			cartCnt++;
	}
	
	Book book = bookService.findBook(isbn);
%>
<body>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">${sessionID} 님, 환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../user/logoutProc.jsp">로그아웃</a> / <a href="../user/userInfo.jsp">마이페이지</a>
			/ <a href="../order/cartOut.jsp">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<form class="search_form" action="search.jsp">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" name="search_words" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>
	<div class="blk30"></div>
	<div class="container">
		<div class="book_item">
			<img class="book_img" src="../img/book/<%=book.getbookImg() %>.jpg" />
			<label class="title"><%=book.getbookTitle() %></label>
			<div class="blk30"></div>
			<label class="book_info">ISBN&nbsp;&nbsp;&nbsp;&nbsp;</label> <label
				class="book_info"><%=book.getisbn() %></label><br>
			<br> <label class="book_info">저자명&nbsp;</label> <label
				class="book_info"><%=book.getauthor() %></label><br> <br> <label
				class="book_info">출판사&nbsp;</label> <label class="book_info"><%=book.getpublisher() %></label><br>
			<br> <label class="book_info">출판일&nbsp;</label> <label
				class="book_info"><%=book.getpublishDate() %></label><br> <br>
			<div class="blk20"></div>
			<label class="book_info">&nbsp;&nbsp;가격&nbsp;&nbsp;</label> <label
				class="book_price"><%=df.format(book.getbookPrice()) %></label> <label class="book_info">원</label>
			
<%
				if (session.getAttribute("sessionID") == null) {
%>
					<button class="cart_btn btn btn-info" type="button" onClick="location.href='../user/loginIn.jsp'">
						<span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>장바구니에
						담기
					</button>
<%
				} else {
%>
					<button class="cart_btn btn btn-info" type="button" onClick="cart(<%=cartCnt%>)">
						<span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>장바구니에
						담기
					</button>
<%
				}
%> 
			<form name="cartAdd" action="../order/cartProc.jsp">
				<input name="isbn" value="<%=book.getisbn()%>" style="display: none;">
			</form>
			<br>
		</div>
	</div>
	<div class="container">
		<div class="blk30"></div>
		<hr>
		<h3 style="margin-left: 40px;">소개</h3>
		<br>
		<pre class="content"><%=book.getbookOutline() %></pre>
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