<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="leehyun.book.img.service.ImgService"%>
<%@ page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@ page import="leehyun.book.img.domain.Img"%>
<%@ page import="java.util.List, java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
	ImgService imgService = new ImgServiceImpl();
	Img img = imgService.findImg(1);
%>
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
	color: #2f5597;
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

.search_label {
	color: white;
	margin: 10px;
	margin-top: 14px;
	margin-left: 300px;
	font-size: 30px;
}
.search_label1 {
	color: white;
	margin: 10px;
	margin-top: 14px;
	margin-left: 30px;
	font-size: 30px;
}
th {
	text-align: center;
}

.rf_btn {
	margin-left: 7px;
	width: 120px;
	height: 50px;
	margin-top: 14px;
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
	border: solid 0.8px #2f5597;
}

.order_code {
	font-weight: bold;
	font-size: 28px;
	float: left;
	margin-top: 20px;
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
	margin-top: 30px;
	height: 70px;
	background-color: #2f5597;
}

td{
	text-align: center;
}

.sub_result {
	overflow: hidden;
}

.sub_result .sub_charge {
	float: right;
}

</style>
</head>
<%
	int refundNum = Integer.parseInt(request.getParameter("refundNum"));
	
	UserService userService = new UserServiceImpl();
	BookService bookService = new BookServiceImpl();
	OrderService orderService = new OrderServiceImpl();
	RefundService refundService = new RefundServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	List<RefundBooks> refundBooks = refundBooksService.listRefundBooks(refundNum);

	DecimalFormat df = new DecimalFormat("###,###");
%>
<body>
	<div class="container">
		<div class="div_top">
			<a href="../../user/logoutProc.jsp">로그아웃</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"><img src='../../img/<%=img.getImgUrl()%>' width="450"></a>
		</div>
	</div>
	<div class="search_bar">
		<label class="search_label">환불상세내역</label>
	</div>
	<div class="container">
		<span class="order_code">환불번호: <%= refundNum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID: <%=userService.findUser(orderService.findOrder(refundService.findRefund(refundNum).getOrderNum()).getUserNum()).getUserId()   %></span>
		<br><br><br><br>		
		<h3>환불 내역</h3>
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
		<a href="javascript:history.go(-1)"><button class="rf_btn"
			style="float: right; margin-right: 7px;">
			<span class="glyphicon glyphicon-arrow-left"></span> 뒤로가기
		</button></a>
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