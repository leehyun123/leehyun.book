<%@page import="leehyun.book.user.domain.User"%>
<%@page import="leehyun.book.user.service.UserServiceImpl"%>
<%@page import="leehyun.book.user.service.UserService"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='java.util.*'%>
<!DOCTYPE html>
<html lang="ko">
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
	function alert_correct() {
		swal({
			title : "수정하시겠습니까?",
			text : "회원 정보가 수정됩니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function alert_correct() {
			swal({
				title : "수정 성공",
				type : "success",
				showCancelButton : false,
				cancelButtonText : "",
				confirmButtonText : "확인",
				closeOnConfirm : true
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = '../main.html';
				}
			});
		});
	}

	function alert_secede() {
		swal({
			title : "탈퇴하시겠습니까?",
			text : "회원 정보가 삭제됩니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function alert_secede() {
			swal({
				title : "탈퇴 성공",
				type : "success",
				showCancelButton : false,
				cancelButtonText : "",
				confirmButtonText : "확인",
				closeOnConfirm : true
			}, function(isConfirm) {
				if (isConfirm) {
					location.href = '../main.html';
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
	margin-top: 20px;
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

.name {
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<body>
	<div class="container">
		<div class="div_top">
			<%
				if (session.getAttribute("sessionID") == null) {
			%>
			<a href="user/loginIn.html">로그인</a> / <a href="user/addUserIn.jsp">회원가입</a>
			/
			<%
				} else {
			%>
			<h5 class="welcome">${sessionID}님,환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="user/logoutProc.jsp">로그아웃</a> /
			<%
				}
			%>
			<a href="../mypage/01.html">마이페이지</a> / <a href="../order/01.html">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<!-- 메인 검색창 -->
	<div class="search_bar">
		<form class="search_form" action="../book/01.html">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>

	<!-- 메인 nav Bar -->
	<br>
	<div class='container'>
		<ul class='tab nav nav-tabs nav-justified'>
			<li class='active' style="font-weight: bold;"><a
				href='../user/07.html'><span class="glyphicon glyphicon-user"></span>
					회원정보</a></li>
			<li><a href='../order/01.html'><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
			<li><a href='../order/04.html'><span
					class="glyphicon glyphicon-list"></span> 주문내역</a></li>
			<li><a href='../refund/01.html'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
	</div>
	<%
		UserService userService = new UserServiceImpl();
		User user = userService.findUser((int) session.getAttribute("sessionUserNum"));
		String bday = user.getBirthday().substring(0, 11);
	%>
	<!-- 회원 정보 수정 폼 -->
	<br>
	<div class="sign_form container">
		<h1 class="name">회원정보</h1>
		<br> <br>
		<form class="form-horizontal" action="#" method="post">
			<div class="form-group">
				<label class="col-sm-4 control-label">성명: </label>
				<div class="col-sm-4">
					<input class="form-control" name="userName" type="text"
						value="<%=user.getUserName()%>" maxlength="8">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">아이디: </label>
				<div class="col-sm-4">
					<input class="form-control" name="userId" type="text"
						value="<%=user.getUserId()%>" maxlength="16" disabled>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">성별 : </label>
				<div class="col-sm-4">
					<input class="form-control" name='gender' type='text'
						value="<%=user.getGender()%>" maxlength='16' disabled>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">전화번호 : </label>
				<div class="col-sm-4">
					<input class="form-control" name='userTel' type='tel'
						value="<%=user.getPhoneNum()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">이메일: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userEmail' type='email'
						value="<%=user.getEmail()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-4 control-label">비밀번호: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userPwd' type='password'
						placeholder='현재 비밀번호' maxlength='16'>
				</div>
				<div>
					<button class="sign_btn btn btn-info" type="button"
						onclick="location.href='06.html'">비밀번호 변경</button>
				</div>
			</div>


			<div class="form-group">
				<label class="col-sm-4 control-label">생년월일: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userDate' type='text'
						value="<%=bday%>" disabled>
				</div>
			</div>
		</form>
	</div>
	<br>
	<br>
	<div class="container">
		<label class="col-sm-5 control-label"></label>
		<div class="col-sm-4">
			<button class="sign_btn btn btn-success" type="submit"
				onclick="alert_correct()">수정하기</button>
			<button class="sign_btn btn btn-danger" type="submit"
				onclick="alert_secede()">탈퇴하기</button>
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