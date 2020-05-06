<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="leehyun.book.refund.domain.Refund"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="leehyun.book.order.domain.Order"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="leehyun.book.order.domain.OrderBooks"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@page import="leehyun.book.order.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderBooksService"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
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

.div_float {
	padding: 15px;
	border: 3px solid #2f5597;
	height: auto;
    overflow: hidden;
}

.d_op {
	width: 11%;
	margin: 5px;
}

.div_half {
	width: 100%;
	float: left;
}

.div_half1 {
	width: 50%;
	display: inline;
	float: right;
	padding-top: 5%;
}

.d_op_in {
	margin: 5px;
    display: inline;
}
</style>
</head>
<%
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	UserService userService = new UserServiceImpl();
	BookService bookService = new BookServiceImpl();
	OrderService orderService = new OrderServiceImpl();
	OrderBooksService orderBooksService = new OrderBooksServiceImpl();
	RefundService refundService = new RefundServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	DecimalFormat df = new DecimalFormat("###,###");
	
	Order order = orderService.findOrder(orderNum);
	List<OrderBooks> listOrderBooks = orderBooksService.listOrderBooks(orderNum);
	List<Refund> refunds = refundService.listOrderRefunds(orderNum);

	
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
		<label class="search_label">주문상세내역</label>
	</div>
	<div class="container">
		<span class="order_code">주문번호: <%= orderNum %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID: <%=userService.findUser(order.getUserNum()).getUserId() %></span>
		<br><br><br><br>		
		<!-- 상세 주문내역 -->
		<h3>주문 내역</h3>
		<table class="table">
			<thead>
				<tr class="chart">
					<th>도서명</th>
					<th>수량</th>
					<th>환불가능수량</th>
					<th>가격</th>
					<th>총액</th>
					<th>비고</th>
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
					<td><%= book.getbookTitle() %></td>
					<td><%= orderBooks.getOrderCnt() %></td>
					<td><%= orderBooks.getOrderCnt() - refundBooksService.getCnt(isbn, orderNum)%></td>
					<td><%= df.format(book.getbookPrice()) %></td>
					<td><%= df.format(sumPrice) %></td>
					<td><%= order.getDeliveryStatus() %></td>
				</tr>
<%
			sum += sumPrice;
			}
%>				
			</tbody>
		</table>
<%
		if(refunds.size() != 0){
%>
		<h3>환불 내역</h3>
		<table class="table table-hover" style="cursor: pointer;">
			<thead>
				<tr class="chart">
					<th>접수일자</th>
					<th>환불번호</th>
					<th>환불내역</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
<%
			for(Refund refund : refunds){
				List<RefundBooks> refundbooks = refundBooksService.listRefundBooks(refund.getRefundNum());
				Long isbn = 0L;
				int cnt = 0;
				for(RefundBooks rfb : refundbooks){
					isbn = rfb.getIsbn();
					cnt += rfb.getRefundCnt();
				}
				String title = bookService.findBook(isbn).getbookTitle();
%>
				<tr onclick="location.href='../refund/refundBooksOut.jsp?refundNum=<%=refund.getRefundNum()%>'">
					<td><%=refund.getRefundDate() %></td>
					<td><%=refund.getRefundNum() %></td>
<%
					if( cnt==1 ){
%>
					<td><%=title %></td>
<%
					}else{
%>
					<td><%=title %> 외 <%=cnt-1 %>권</td>
<%
					}
%>					
					<td><%=refund.getRefundStatus() %></td>
				</tr>
<%
			}
%>				
			</tbody>
		</table>
<%
		}
%>
		<h3>배송 정보</h3>
		<div class="div_float">
			<div class="div_half">
				<label class="d_op">수령인 : </label>
				<p class="d_op_in"><%= order.getReceiver() %></p>
				<br> <label class="d_op">배송지 : </label>
				<p class="d_op_in"><%= order.getBaseAddr() %></p>
				<br> <label class="d_op">&nbsp;</label>
				<p class="d_op_in"><%= order.getDetailAddr() %></p>
				<br> <label class="d_op">핸드폰번호 : </label>
				<p class="d_op_in"><%= order.getReceiverTel() %></p>
				<br> <label class="d_op">요청사항 :</label>
				<p class="d_op_in"><%= order.getRequest() %></p>
			</div>
			<div class="div_half1">
				<p>
					배송비(￦): 2,500 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					금액(￦): <%= df.format(sum) %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span
						class="span_bold">총 금액(￦): <%= df.format(sum + 2500)  %>원</span>
				</p>
			</div>
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