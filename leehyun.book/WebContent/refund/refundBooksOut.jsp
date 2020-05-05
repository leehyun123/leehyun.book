<%@page import="java.text.DecimalFormat"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="java.util.List"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<style>
label, p {
	font-size: large;
}

th, td {
	text-align: center;
	font-size: 16px;
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

.welcome {
	display: inline;
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

.tab {
	text-align: center;
	font-size: 15px;
}

.subTitle_form {
	overflow: hidden;
}

.subTitle_form .button-cancel {
	float: right;
}

.subTitle_form .order_code {
	float: left;
}

.refund_code {
	font-weight: bold;
	font-size: 30px
}

.sub_result {
	overflow: hidden;
}

.sub_result .sub_charge {
	float: right;
}

.sub_charge span {
	font-weight: bold;
}

.order_btn {
	font-weight: 600;
	font-size: 18px;
	font-align: center;
	width: 250px;
	height: 40px;
	float: right;
	margin-left: 20px;
}

.name {
	text-align: center;
	font-weight: 700;
}

.chart {
	background-color: #8FC9DB;
	color: white;
}
</style>
</head>
<%
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	BookService bookService = new BookServiceImpl();
	int refundNum = Integer.parseInt(request.getParameter("refundNum"));
	List<RefundBooks> refundBooks = refundBooksService.listRefundBooks(refundNum);
	DecimalFormat df = new DecimalFormat("###,###");
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
	<!-- 메인 검색창 -->
	<div class="search_bar">
		<form class="search_form" action="../book/search.jsp">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" name="search_words" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>

	<br>
	<div class='tab container'>
		<ul class='nav nav-tabs nav-justified'>
			<li><a href='../user/userInfo.jsp'><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li><a href='../order/cartOut.jsp'><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
			<li><a href='../order/orderOut.jsp'><span
					class="glyphicon glyphicon-list"></span> 주문내역</a></li>
			<li class='active' style="font-weight: bold;"><a
				href='../refund/refundOut.jsp'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
	</div>
	<br>
	<div class="container">
		<h1 class="name">상세 환불내역</h1>
		<!-- 환불번호 -->
		<form class="subTitle_form" action="#" style="margin: 0 30px;">
			<br> <span class="refund_code">환불번호 : <%=refundNum %></span>
		</form>
		<br> <br>
		<!-- 주문내역 검색 결과 -->
		<table class="table">
			<thead>
				<tr class="chart">
					<th>도서명</th>
					<th>수량</th>
					<th>가격</th>
					<th>총액</th>
				</tr>
			</thead>
			<tbody>
<%
				int ssum = 0;
				for(RefundBooks refundBook : refundBooks){
					Book book = bookService.findBook(refundBook.getIsbn());
					int sum = refundBook.getRefundCnt() * book.getbookPrice();
					ssum += sum;
%>				
				<tr>
					<td><%=book.getbookTitle() %></td>
					<td><%=refundBook.getRefundCnt() %></td>
					<td><%=df.format(book.getbookPrice()) %></td>
					<td><%=df.format(sum) %></td>
				</tr>
<%
				}
%>		
			</tbody>
		</table>
		<br>
		<hr>
		<br>
		<div class="sub_result">
			<div class="sub_charge">
				<p>
					<span>총 환불 금액(￦): <%=df.format(ssum) %>원</span>
				</p>
			</div>
		</div>
		<br>
		<button class="order_btn btn btn-info" type="submit"
			onclick="location.href='../main.jsp'">
			<span class="glyphicon glyphicon-list">&nbsp;</span>쇼핑 더 하러가기
		</button>
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