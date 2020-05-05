<%@page import="java.util.ArrayList"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.order.domain.OrderBooks"%>
<%@page import="leehyun.book.order.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderBooksService"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.domain.Order"%>
<%@page import="java.util.List"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>주문 내역 검색</title>
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
	font-size: 15px;
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

.chart {
	background-color: #8FC9DB;
	color: white;
}

.name {
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String words = request.getParameter("search_words");

		int userNum = (int) session.getAttribute("sessionUserNum");
		OrderService orderService = new OrderServiceImpl();
		OrderBooksService orderBooksService = new OrderBooksServiceImpl();
		BookService bookService = new BookServiceImpl();
		List<Order> searchOrderss = orderService.searchOrder(words);
		List<Order> searchOrders = new ArrayList<>();
		
		for(Order order : searchOrderss){
			if (order.getUserNum() == userNum)
				searchOrders.add(order);
		}
	%>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">${sessionID}님,환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../user/logoutProc.jsp">로그아웃</a> / <a
				href="../user/userInfo.jsp">마이페이지</a> / <a href="cartOut.jsp">장바구니</a>
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

	<!-- 메인 nav Bar -->
	<br>
	<div class='tab container'>
		<ul class='nav nav-tabs nav-justified'>
			<li><a href='../user/userInfo.jsp'><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li><a href='cartOut.jsp'><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
			<li class='active' style="font-weight: bold;"><a
				href='orderOut.jsp'><span class="glyphicon glyphicon-list"></span>
					주문내역</a></li>
			<li><a href='../refund/refundOut.jsp'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
		<br>
		<!-- 주문내역 검색 -->
		<h1 class="name">주문내역</h1>
		<form class="subTitle_form" action="orderSearch.jsp">
			<p style="font-size: x-large; font-weight: bold;">
				주문내역 검색&nbsp;&nbsp;&nbsp; <input class="search_input"
					name="search_words" type="text" required style="margin-top: 50px;" placeholder="<%=words%>"/>
				<button class="search_btn btn btn-info" type="submit">
					<span class="glyphicon glyphicon-search">&nbsp;</span>검색
				</button>
			</p>
			<!-- 주문내역 기간설정 -->
			<div class="col">
				<div class="btn-group-toggle" data-toggle="buttons">
					<h5 style="display: inline">기간 설정&nbsp;&nbsp;</h5>
					<label class="btn btn-default" onclick="location.href='orderOut.jsp?date=1'">
						<input type="radio" name="date-radio" id="1Month">1개월
					</label>
					<label class="btn btn-default" onclick="location.href='orderOut.jsp?date=3'">
						<input type="radio" name="date-radio" id="3Month">3개월
					</label>
					<label class="btn btn-default" onclick="location.href='orderOut.jsp?date=6'">
						<input type="radio" name="date-radio" id="6Month">6개월
					</label>
					<label class="btn btn-default active" onclick="location.href='orderOut.jsp?'">
						<input type="radio" name="date-radio" id="All">전체
					</label>
				</div>
			</div>
		</form>
		<br> <br>
		<!-- 주문내역 검색 결과 -->
		<table class="table table-hover" style="cursor: pointer;">
			<thead>
				<tr class="chart">
					<th>주문번호</th>
					<th>주문날짜</th>
					<th>주문내역</th>
					<th>수량</th>
					<th>송장번호</th>
					<th>배송상태</th>
					<th>수령자</th>
				</tr>
			</thead>
			<tbody>
<%
			if (searchOrders.size() != 0) {
				for (Order order : searchOrders) {
						int orderCnt = 0;
						List<OrderBooks> listOrderBooks = orderBooksService.listOrderBooks(order.getOrderNum());
%>
						<tr onClick="location.href='orderBooksOut.jsp?orderNum=<%=order.getOrderNum()%>'">
							<td><%=order.getOrderNum()%></td>
							<td><%=order.getOrderDate()%></td>
<%
							long isbn = 0;
							for(OrderBooks orderBooks : listOrderBooks){
								orderCnt += orderBooks.getOrderCnt();
								isbn = orderBooks.getIsbn();
							}
							Book book = bookService.findBook(isbn);

							if(orderCnt == 1){
%>
								<td><%=book.getbookTitle()%></td>
<%
							}else{
%>
								<td><%=book.getbookTitle()%> 외 <%=orderCnt - 1%>권</td>
<%
							}
%>
								<td><%=orderCnt%></td>
								<td><%=order.getDeliveryNum()%></td>
								<td><%=order.getDeliveryStatus()%></td>
								<td><%=order.getReceiver()%></td>
							</tr>
<%
					}
				}else{
%>
					<tr>
						<td colspan='8'
							style="height: 200px; padding-top: 80px; font-size: 35px;">검색결과가 없습니다.</td>
					</tr>
<%
				}
%>
			</tbody>
		</table>
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
