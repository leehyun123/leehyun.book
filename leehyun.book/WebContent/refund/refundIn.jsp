<%@page import="java.text.DecimalFormat"%>
<%@page import="leehyun.book.order.domain.OrderBooks"%>
<%@page import="leehyun.book.order.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderBooksService"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>북적북적</title>
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
	function alert_refund() {
		swal({
			title : "환불하시겠습니까?",
			text : "",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function() {
			document.refund.submit();
		});
	};
	
	function alert_cnterr() {
		swal({
			title : "유효하지 않은 값이 있습니다.",
			text : "확인해주세요",
			type : "warning",
			showCancelButton : false,
			confirmButtonText : "예",
			closeOnConfirm : false
		});
	};
	
	function ck(){
		if($('input.cnt0').val() < 1 || $('input.cnt0').val() > $('input.max0').val() || 
			$('input.cnt1').val() < 1 || $('input.cnt1').val() > $('input.max1').val() || 
			$('input.cnt2').val() < 1 || $('input.cnt2').val() > $('input.max2').val() || 
			$('input.cnt3').val() < 1 || $('input.cnt3').val() > $('input.max3').val() || 
			$('input.cnt4').val() < 1 || $('input.cnt4').val() > $('input.max4').val() || 
			$('input.cnt5').val() < 1 || $('input.cnt5').val() > $('input.max5').val() || 
			$('input.cnt6').val() < 1 || $('input.cnt6').val() > $('input.max6').val() || 
			$('input.cnt7').val() < 1 || $('input.cnt7').val() > $('input.max7').val() || 
			$('input.cnt8').val() < 1 || $('input.cnt8').val() > $('input.max8').val() || 
			$('input.cnt9').val() < 1 || $('input.cnt9').val() > $('input.max9').val()){
			alert_cnterr();
		}else{
			alert_refund();
		}
	};
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
	color: #2f5597;
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
	background-color: #2f5597;
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
	border: solid 0.8px #2f5597;
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
	background-color: #2f5597;
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

.div_float {
	padding: 15px;
	height: 210px;
	border: 3px solid #2f5597;
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
.input_width{
	width: 40px;
}

.order_code {
	font-weight: bold;
	font-size: 28px;
	float: left;
}

.name{
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<%
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	BookService bookService = new BookServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	OrderBooksService orderBooksService = new OrderBooksServiceImpl();
	List<OrderBooks> orderBooks = orderBooksService.listOrderBooks(orderNum);
	DecimalFormat df = new DecimalFormat("###,###");
	
	String[] str = request.getParameterValues("isbn");
	List<String> isbn = new ArrayList<>();
	for(String str1 : str)
		isbn.add(str1);
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
			<li class='active' style="font-weight: bold;"><a href='../order/orderOut.jsp'><span
					class="glyphicon glyphicon-list"></span> 주문내역</a></li>
			<li><a href='../refund/refundOut.jsp'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
		</div>
	<br>
	<div class="container">
		<h1 class="name">환불 설정</h1>
		<!-- 주문번호 -->
		<form name="refund" class="subTitle_form" action="refundProc.jsp" style="margin: 0 30px;">
			<br> <span class="order_code">주문번호 : <%=orderNum %></span>
		<br> <br>
		<!-- 상세 주문내역 -->
		<table class="table table-hover">
			<thead>
				<tr class="chart">
					<th>도서명<input name="orderNum" value="<%=orderNum%>" style="display: none;"></th>
					<th>환불가능수량</th>
					<th>수량</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
<%
				int i=0;
				for(OrderBooks orderbook : orderBooks){
					if(isbn.contains(Long.toString(orderbook.getIsbn()))){
						Book book = bookService.findBook(orderbook.getIsbn());
%>
					<tr>
						<td><%=book.getbookTitle() %><input name="isbn<%=i%>" value="<%=book.getisbn()%>" style="display: none;"></td>
						<td><%= orderbook.getOrderCnt() - refundBooksService.getCnt(book.getisbn(), orderNum)%></td>
						<td><input type="number" name="cnt<%=i%>" value="1" class="input_width cnt<%=i%>" min="1" max="<%= orderbook.getOrderCnt() - refundBooksService.getCnt(book.getisbn(), orderNum)%>"></td>
						<td><%=df.format(book.getbookPrice()) %><input class="max<%=i%>" value="<%= orderbook.getOrderCnt() - refundBooksService.getCnt(book.getisbn(), orderNum)%>" style="display: none;"></td>
					</tr>
<%
					i++;
					}
				}
%>
			</tbody>
		</table>
		<br><input name="cnt" value="<%=i%>" style="display: none;">
		<!-- 상세 주문내역 결과 총액 -->
		<div class="sub_result">
			<div class="button-refund" align="left">
				<button class="btn btn-danger" type="button"
					onclick="ck()">
					<span class="glyphicon glyphicon-refresh"></span> 환불
				</button>
			</div>
		</div>
		</form>
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