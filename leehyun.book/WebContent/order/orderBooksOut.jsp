<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.orderBooks.domain.OrderBooks"%>
<%@page import="java.util.List"%>
<%@page import="leehyun.book.orderBooks.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.orderBooks.service.OrderBooksService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>order.05 상세주문내역</title>
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
	function alert_cancel() {
		swal({
			title : "취소하시겠습니까?",
			text : "상품 전체의 주문이 취소 됩니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function() {
			swal("취소성공", "주문 취소되었습니다.", 'success');
		});
	}

	function alert_refund() {
		swal({
			title : "환불하시겠습니까?",
			text : "체크된 항목들의 목록페이지로 이동합니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function() {
			location.href = "../refund/03.html";
		});
	}
</script>
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

.order_code {
	font-weight: bold;
	font-size: 28px;
	float: left;
}

.sub_result {
	overflow: hidden;
}

.sub_result .button-refund {
	float: left;
}

.sub_result .sub_charge {
	float: right;
}

.span_bold {
	font-weight: bold;
}

.chart {
	background-color: #8FC9DB;
	color: white;
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

.refund_btn {
	font-weight: 600;
	font-size: 18px;
	font-align: center;
	width: 250px;
	height: 40px;
}

.div_float {
	padding: 15px;
	height: 210px;
	border: 3px solid #8FC9DB;
}

.d_op {
	width: 20%;
	margin: 5px;
}

.div_half {
	width: 50%;
	display: inline;
	float: left;
}

.div_half1 {
	width: 50%;
	display: inline;
	float: left;
	padding-top: 13%;
}

.d_op_in {
	height: 35px;
	margin: 5px;
	width: 60%;
	display: inline;
}

.name {
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<body>
<%
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	OrderBooksService orderBooksService = new OrderBooksServiceImpl();
	BookService bookService = new BookServiceImpl();
	List<OrderBooks> listOrderBooks = orderBooksService.listOrderBooks(orderNum);
%>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">이현 님, 환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../main.jsp">로그아웃</a> / <a href="../mypage/01.html">마이페이지</a>
			/ <a href="01.html">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<form class="search_form" action="../book/01.html">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>

	<br>
	<div class='tab container'>
		<ul class='nav nav-tabs nav-justified'>
			<li><a href='../user/07.html'><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li><a href='../order/01.html'><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
			<li class='active' style="font-weight: bold;"><a
				href='../order/04.html'><span class="glyphicon glyphicon-list"></span>
					주문내역</a></li>
			<li><a href='../refund/01.html'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
	</div>
	<br>
	<div class="container">
		<h1 class="name">상세 주문내역</h1>
		<!-- 주문번호 -->
		<form class="subTitle_form" action="#" style="margin: 0 30px;">
			<br> <span class="order_code"><%= orderNum %></span>
		</form>
		<br>
		<!-- 상세 주문내역 -->
		<h3>주문 내역</h3>
		<table class="table">
			<thead>
				<tr class="chart">
					<th>#</th>
					<th>도서명</th>
					<th>수량</th>
					<th>가격</th>
					<th>총액</th>
				</tr>
			</thead>
			<tbody>
<%
			int sum = 0;
			for(OrderBooks orderBooks: listOrderBooks){
				long isbn = orderBooks.getIsbn();
				Book book = bookService.findBook(isbn);
				int sumPrice = book.getbookPrice() * orderBooks.getOrderCnt(); 
%>			
				<tr>
					<td><input type="checkbox" name="pick"></td>
					<td><%= book.getbookTitle() %></td>
					<td><%= orderBooks.getOrderCnt() %></td>
					<td><%= book.getbookPrice() %></td>
					<td><%= sumPrice %></td>
				</tr>
<%
			sum += sumPrice;
			}
%>				
			</tbody>
		</table>
		<h3>환불 내역</h3>
		<table class="table table-hover" style="cursor: pointer;"
			onClick="location.href='../refund/02.html'">
			<thead>
				<tr class="chart">
					<th>접수일자</th>
					<th>환불번호</th>
					<th>환불내역</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2019-01-22</td>
					<td>20-032492</td>
					<td>정보처리기사실기</td>
					<td>환불처리중</td>
				</tr>
			</tbody>
		</table>

		<h3>배송 정보</h3>
		<div class="div_float">
			<div class="div_half">
				<label class="d_op">수령인 : </label>
				<p class="d_op_in">이현</p>
				<br> <label class="d_op">배송지 : </label>
				<p class="d_op_in">서울특별시 마포구 서교동</p>
				<br> <label class="d_op">&nbsp;</label>
				<p class="d_op_in">쌍용강북교육센터</p>
				<br> <label class="d_op">핸드폰번호 : </label>
				<p class="d_op_in">010-0000-0000</p>
				<br> <label class="d_op">요청사항 :</label>
				<p class="d_op_in">부재 시 집앞에 놓아주세요.</p>
			</div>


			<div class="div_half1">
				<p>
					배송비(￦): 2,500 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					금액(￦): <%= sum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
						class="span_bold">총 금액(￦): <%= sum + 2500  %>원</span>
				</p>
			</div>
		</div>
		<hr>
		<br>
		<!-- 상세 주문내역 결과 총액 -->
		<button class="refund_btn btn btn-danger" type="submit"
			onclick="alert_refund()">
			<span class="glyphicon glyphicon-remove"></span> 주문취소 / 환불
		</button>
		<button class="order_btn btn btn-info" type="submit"
			onclick="location.href='../user/00.html'">
			<span class="glyphicon glyphicon-list"></span> 쇼핑 더 하러가기
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