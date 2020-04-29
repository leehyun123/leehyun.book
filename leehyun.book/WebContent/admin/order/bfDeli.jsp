<%@page import="leehyun.book.user.domain.User"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@page import="leehyun.book.order.domain.Order"%>
<%@page import="java.util.List"%>
<%@page import="leehyun.book.order.service.OrderServiceImpl"%>
<%@page import="leehyun.book.order.service.OrderService"%>
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
<script>
	function alert_refund() {
		swal({
			title : "알림",
			text : "배송전을 배송중으로 처리 하시겠습니까?",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function() {
			swal({
				title : "배송중 처리 완료",
				text : "메인으로 이동하시겠습니까?",
				type : "success",
				showCancelButton : true,
				cancelButtonText : "아니오",
				confirmButtonText : "예",
				closeOnConfirm : true
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = '../main.jsp';
				}
			});
		});
	}
</script>
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
	width: 100px;
	height: 40px;
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
	background-color: #8FC9DB;
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
	List<Order> orders = orderService.listAdminOrders("배송전");
	
	User user = null;	
%>
<body>
	<div class="container">
		<div class="div_top">
			<a href="../../user/logoutProc.jsp">로그아웃</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<label class="search_label">주문관리 - 배송전</label>
	</div>
	<div class="container">
		<div class="search_bar" style="background-color: white;">
			<form class="search_form" action="#">
			<label class="search_label1"
					style="font-size: 20px;  color: black;">정보검색&nbsp;</label>
				<input class="search_input" type="text" required />
				<button class="search_btn btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search">&nbsp;</span>검색
				</button>
			</form>
		</div>
		<br>
		<form>
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>처리선택</th>
						<th>접수일</th>
						<th>회원ID</th>
						<th>주문번호</th>
						<th>송장번호</th>
						<th>주문내역</th>
					</tr>
				</thead>
				<tbody>
<%
					for(Order order : orders){
						user = userService.findUser(order.getUserNum());
%>		
						<tr>
							<td><input type="checkbox" name="cb" value="" /></td>
							<td onclick="location.href='04.html'"><%=order.getOrderDate() %></td>
							<td onclick="location.href='04.html'"><%=user.getUserId() %></td>
							<td onclick="location.href='04.html'"><%=order.getOrderNum() %></td>
							<td><input type="text" name="deliNum"/></td>
							<td onclick="location.href='04.html'">호밀 밭의 파수꾼 외 1건</td>
						</tr>
<%
					}
%>
				</tbody>
			</table>
		</form>
		<button class="rf_btn" onclick="alert_refund()">완료 처리</button>
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