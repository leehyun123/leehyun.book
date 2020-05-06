<%@page import="java.text.DecimalFormat"%>
<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="leehyun.book.refund.domain.Refund"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@page import="leehyun.book.order.domain.Order"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.order.domain.OrderBooks"%>
<%@page import="java.util.List"%>
<%@page import="leehyun.book.order.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderBooksService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ page import="leehyun.book.img.service.ImgService"%>
<%@ page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@ page import="leehyun.book.img.domain.Img"%>
<%
   request.setCharacterEncoding("utf-8");
   ImgService imgService = new ImgServiceImpl();
   Img img = imgService.findImg(1);
%>
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
		}, function(isConfirm) {
			if(isConfirm) {
				document.refund.action = "orderCancelProc.jsp";
				document.refund.submit();
			}
		});
	};
	
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
            document.refund.submit();
		});
	};
	
	function alert_emp(){
		swal({
			title : "체크된 항목이 없습니다.",
			text : "선택해주세요.",
			type : "warning",
			showCancelButton : false,
			confirmButtonText : "예",
			closeOnConfirm : false
		});
	};
	
	function ck(){
		if($("input:checkbox[class=cb_item]:checked").length == 0){
			alert_emp();
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
	OrderService orderService = new OrderServiceImpl();
	OrderBooksService orderBooksService = new OrderBooksServiceImpl();
	RefundService refundService = new RefundServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	BookService bookService = new BookServiceImpl();
	Order order = orderService.findOrder(orderNum);
	List<OrderBooks> listOrderBooks = orderBooksService.listOrderBooks(orderNum);
	List<Refund> refunds = refundService.listOrderRefunds(orderNum);
	DecimalFormat df = new DecimalFormat("###,###");
	
%>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">${sessionID} 님, 환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../user/logoutProc.jsp">로그아웃</a> / <a href="../user/userInfo.jsp">마이페이지</a>
			/ <a href="cartOut.jsp">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> <img src='../img/<%=img.getImgUrl()%>' width="450"></a>
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
			<li class='active' style="font-weight: bold;"><a
				href='../order/orderOut.jsp'><span class="glyphicon glyphicon-list"></span>
					주문내역</a></li>
			<li><a href='../refund/refundOut.jsp'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
	</div>
	<br>
	<div class="container">
		<h1 class="name">상세 주문내역</h1>
		<!-- 주문번호 -->
		<form class="subTitle_form" action="#" style="margin: 0 30px;">
			<br> <span class="order_code">주문번호: <%= orderNum %></span>
		</form>
		<br>		
		<!-- 상세 주문내역 -->
		<h3>주문 내역</h3>
		<form action="../refund/refundIn.jsp" name="refund" method="post">
		<table class="table">
			<thead>
				<tr class="chart">
					<th>#<input name="orderNum" value="<%=orderNum%>" style="display: none;"></th>
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
					<td><input class="cb_item" type="checkbox" name="isbn" value="<%=isbn%>"
<%
					if(orderBooks.getOrderCnt() - refundBooksService.getCnt(isbn, orderNum) == 0){
%>
						disabled
<%
					}
%>
					
					></td>
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
		<hr>
		<br>
		
<%
		if(order.getDeliveryStatus().equals("배송전")){
%>		
			<button class="refund_btn btn btn-danger" type="button" onClick="alert_cancel()">
			<span class="glyphicon glyphicon-remove"></span> 주문취소
			</button>
<%
		}else{
%>
			<button class="refund_btn btn btn-danger" type="button" onClick="ck()">
			<span class="glyphicon glyphicon-remove"></span> 환불
			</button>
<%
		}
%>						
		<button class="order_btn btn btn-primary" type="submit"
			onClick="location.href='../main.jsp'">
			<span class="glyphicon glyphicon-list"></span> 쇼핑 더 하러가기
		</button>
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