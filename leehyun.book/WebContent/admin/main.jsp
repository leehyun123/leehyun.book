<%@page import="java.util.List"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<%@page import="leehyun.book.order.domain.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.search_bar {
	height: 70px;
	background-color: #8FC9DB;
}

.search_label {
	color: white;
	margin: 10px;
	margin-top: 14px;
	margin-left: 300px;
	font-size: 30px;
}

.menu_label {
	font-size: 30px;
}

.mng_btn {
	font-size: 30px;
	margin: 15px;
}

.order_mng {
	width: 150px;
	height: 100px;
	margin: 15px;
	border: 1px solid black;
	display: inline-block;
	font-size: 20px;
	text-align: center;
	padding-top: 20px;
	cursor: pointer;
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
<%
	OrderService orderService = new OrderServiceImpl();
	int bf = 0;
	int ing = 0;
	int com = 0;
	List<Order> orders = null;
	
	orders = orderService.listAdminOrders("배송전");
	if(orders != null)
		bf = orders.size();
	orders = orderService.listAdminOrders("배송중");
	if(orders != null)
		ing = orders.size();
	orders = orderService.listAdminOrders("배송완료");
	if(orders != null)
		com = orders.size();
%>
<body>
	<div class="container">
		<div class="div_top">
			<a href="../main.jsp">로그아웃</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='main.html' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<label class="search_label">관리자</label>
	</div>
	<div class="container">
		<br> <br> <label class="menu_label"> - 주문 관리</label><br>
		<div class="order_bar">
			<div class="order_mng alert-warning" onclick="location.href='order/bfDeli.jsp'">
				배송전<br><%=bf %>
			</div>
			<div class="order_mng alert-info" onclick="location.href='order/02.html'">
				배송중<br><%=ing %>
			</div>
			<div class="order_mng alert-success" onclick="location.href='order/03.html'">
				배송완료<br><%=com %>
			</div>
			<div class="order_mng alert-danger" onclick="location.href='refund/01.html'">
				환불 접수<br>3
			</div>
		</div>
		<br> <br> <br> <label class="menu_label"> - 매출
			정보</label><br> <label style="font-size: 25px; font-weight: 500;">&nbsp;&nbsp;&nbsp;&nbsp;매출 누계 : 17,853,000,000
			원</label><br> <br> <br> <br>
		<button class="mng_btn" onclick="location.href='book/book.jsp'">도서관리</button>
		<button class="mng_btn" onclick="location.href='img/01.html'">배너 관리</button>
		<button class="mng_btn" onclick="location.href='img/02.html'">로고 관리</button>
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