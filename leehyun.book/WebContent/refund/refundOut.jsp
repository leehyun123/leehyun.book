<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@page import="java.util.List"%>
<%@page import="leehyun.book.refund.domain.Refund"%>
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
	margin-top: 300px;
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

th, td {
	text-align: center;
	font-size: 16px;
}

.chart {
	background-color: #8FC9DB;
	color: white;
}

.name{
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<%
	request.setCharacterEncoding("utf-8");
	
	int userNum = (int)session.getAttribute("sessionUserNum");
	RefundService refundService = new RefundServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	BookService bookService = new BookServiceImpl();
	List<Refund> refunds = null;
	
	
	int date = 0;
	if(request.getParameter("date") == null){
		refunds = refundService.listUserRefunds(userNum);
	}else{
		date = Integer.parseInt(request.getParameter("date"));
		refunds = refundService.listUserRefundsDate(userNum, date*-1);
	}
%>
<body>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">${sessionID} 님, 환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../user/logoutProc.jsp">로그아웃</a> / <a href="../user/userInfo.jsp">마이페이지</a>
			/ <a href="cartOut.jsp">장바구니</a>
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
	<div class='container'>
		<ul class='tab nav nav-tabs nav-justified'>
			<li><a href='../user/userInfo.jsp'><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li><a href='../order/cartOut.jsp'><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
			<li><a href='../order/orderOut.jsp'><span
					class="glyphicon glyphicon-list"></span> 주문내역</a></li>
			<li class='active' style="font-weight: bold;"><a href='refundOut.jsp'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
		<br>
		<!-- 환불내역 -->
		<h1 class="name">환불내역</h1>
<%
		if (request.getAttribute("msg") != null) {
%>
			<div class="alert fade in alert-success">
				<a href="#" class="close" data-dismiss="alert">&times;</a>
				<strong>환불접수가 성공했습니다.</strong>
			</div>
<%
		}
%>
		<form class="tab subTitle_form" action="refundSearch.jsp">
			<p style="font-size: x-large; font-weight: bold;">
				환불내역 검색&nbsp;&nbsp;&nbsp; <input class="search_input" name="search_words" type="text"
					required style="margin-top: 50px;" />
				<button class="search_btn btn btn-info" type="submit">
					<span class="glyphicon glyphicon-search">&nbsp;</span>검색
				</button>
			</p>
			<!-- 주문내역 기간설정 -->
			<div class="col">
				<div class="btn-group-toggle" data-toggle="buttons">
					<h5 style="display: inline">기간 설정&nbsp;&nbsp;</h5>
					<label class="btn btn-default <%if(date == 1){%>active<%}%>" onclick="location.href='refundOut.jsp?date=1'">
						<input type="radio" name="date-radio" id="1Month">1개월
					</label>
					<label class="btn btn-default <%if(date == 3){%>active<%}%>" onclick="location.href='refundOut.jsp?date=3'">
						<input type="radio" name="date-radio" id="3Month">3개월
					</label>
					<label class="btn btn-default <%if(date == 6){%>active<%}%>" onclick="location.href='refundOut.jsp?date=6'">
						<input type="radio" name="date-radio" id="6Month">6개월
					</label>
					<label class="btn btn-default <%if(date == 0){%>active<%}%>" onclick="location.href='refundOut.jsp'">
						<input type="radio" name="date-radio" id="All">전체
					</label>
				</div>
			</div>
		</form>
		<br>
		<br>
		<table class="table table-hover" style="cursor: pointer;">
			<thead>
				<tr class='chart'>
					<th>접수일자</th>
					<th>주문번호</th>
					<th>환불번호</th>
					<th>환불내역</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
<%
				if(refunds.size() != 0){
					for(Refund refund : refunds){
						List<RefundBooks> refundBook = refundBooksService.listRefundBooks(refund.getRefundNum());
						int cnt = 0;
						Long isbn = 0L;
						for(RefundBooks refundBooks : refundBook){
							cnt += refundBooks.getRefundCnt();
							isbn = refundBooks.getIsbn();
						}
%>							
				<tr onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'">
					<td><%=refund.getRefundDate() %></td>
					<td><%=refund.getOrderNum() %></td>
					<td><%=refund.getRefundNum() %></td>
<%
					if(cnt == 1){
%>
					<td><%=bookService.findBook(isbn).getbookTitle() %></td>
<%
					}else{
%>
					<td><%=bookService.findBook(isbn).getbookTitle() %> 외 <%=cnt-1 %>권</td>
<%
					}
%>
					<td><%=refund.getRefundStatus() %></td>
				</tr>
<%
					}
				}else{
%>
				<tr><td colspan='8' style="height: 200px; padding-top: 80px; font-size: 35px;">환불 내역이 없습니다.</td></tr>
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