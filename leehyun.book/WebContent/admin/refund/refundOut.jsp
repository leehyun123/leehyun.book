<%@page import="leehyun.book.refund.domain.RefundBooks"%>
<%@page import="leehyun.book.refund.domain.Refund"%>
<%@page import="leehyun.book.refund.service.RefundBooksServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundBooksService"%>
<%@page import="leehyun.book.refund.service.RefundServiceImpl"%>
<%@page import="leehyun.book.refund.service.RefundService"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.order.domain.OrderBooks"%>
<%@page import="leehyun.book.order.service.OrderBooksServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderBooksService"%>
<%@page import="leehyun.book.user.domain.User"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@page import="leehyun.book.order.domain.Order"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
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

	String id = (String)session.getAttribute("sessionID");
	if(!id.equals("관리자")){
%>
 	<c:redirect url="../err/errPage.html"/> 
<%
	}
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
<script>
	function alert_refund() {
		swal({
			title : "알림",
			text : "환불요청을 환불완료로, 환불완료를 환불요청으로\n처리하시겠습니까?",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				document.refund.submit();
			}
		});
	};
</script>
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
	cursor: pointer;
}
</style>
</head>
<%
	OrderService orderService = new OrderServiceImpl();
	UserService userService = new UserServiceImpl();
	BookService bookService = new BookServiceImpl();
	RefundService refundService = new RefundServiceImpl();
	RefundBooksService refundBooksService = new RefundBooksServiceImpl();
	
	List<Refund> refunds = refundService.listRefunds();
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
		<label class="search_label">주문관리 - 환불관리</label>
	</div>
	<div class="container">
		<div class="search_bar" style="background-color: white;">
			<form class="search_form" action="refundSearch.jsp">
			<label class="search_label1"
					style="font-size: 20px;  color: black;">정보검색&nbsp;</label>
				<input class="search_input" type="text" name="search_word" required />
				<button class="search_btn btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search">&nbsp;</span>검색
				</button>
			</form>
		</div>
		<br>
<%
				if (request.getAttribute("msgSuc") != null) {
%>
					<div class="alert fade in alert-success">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<strong>정상처리되었습니다.</strong>
					</div>
<%
				}
				if (request.getAttribute("msgFail") != null) {
%>
					<div class="alert fade in alert-danger">
						<a href="#" class="close" data-dismiss="alert">&times;</a>
						<strong>선택한 항목이 없습니다.</strong>
					</div>
<%
				}
%>
		<form name="refund" action="refundProc.jsp" >
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>처리선택</th>
						<th>접수일</th>
						<th>회원ID</th>
						<th>원주문번호</th>
						<th>환불번호</th>
						<th>환불내역</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
<%
				if(refunds.size() != 0){
					for(Refund refund : refunds){
						User user = userService.findUser(orderService.findOrder(refund.getOrderNum()).getUserNum());
						List<RefundBooks> refundBooks = refundBooksService.listRefundBooks(refund.getRefundNum());
						Long isbn = 0L;
						int cnt = 0;
						for(RefundBooks refundBook : refundBooks){
							cnt += refundBook.getRefundCnt();
							isbn = refundBook.getIsbn();
						}
%>		
						<tr>
							<td><input type="radio" name="refundNum" value="<%=refund.getRefundNum() %>" /></td>
							<td onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=refund.getRefundDate() %></td>
							<td onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=user.getUserId() %></td>
							<td onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=refund.getOrderNum() %></td>
							<td onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=refund.getRefundNum() %></td>
<%
							if(cnt == 1){
%>
							<td onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=bookService.findBook(isbn).getbookTitle() %></td>
<%
							}else{
%>
							<td onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=bookService.findBook(isbn).getbookTitle() %> 외 <%=cnt-1 %>권</td>
<%
							}
%>							
							<td style="color:
							<%
								if(refund.getRefundStatus().equals("환불완료")){
							%>
									green
							<%
								}else{
							%>
									red
							<%
								}
							%>
							;" onclick="location.href='refundBooksOut.jsp?refundNum=<%=refund.getRefundNum() %>'"><%=refund.getRefundStatus() %></td>
						</tr>
<%
					}
				}else{
%>
					<tr><td colspan='7' style="height: 200px; padding-top: 80px; font-size: 35px;">환불 내역이 없습니다.</td></tr>
<%
				}
%>
				</tbody>
			</table>
		</form>
		<button class="rf_btn" onclick="alert_refund()">변경</button>
		<a href="javascript:history.go(-1)"><button class="rf_btn" style="float: right; margin-right: 7px;">
		<span class="glyphicon glyphicon-arrow-left"></span> 뒤로가기</button></a>
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