<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="leehyun.book.user.service.UserService"%>
<%@ page import="leehyun.book.user.service.UserServiceImpl"%>
<%@ page import="leehyun.book.user.domain.User"%>
<%@ page import="java.util.List, java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
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
	function alert_join() {
		swal({
			title : "가입 성공",
			text : "로그인페이지로 이동합니다.",
			type : "success",
			showCancelButton : false,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : true
		}, function(isConfirm) {
			if (isConfirm) {
				location.href = 'addUserIn.jsp';
			}
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

.search_bar {
	height: 70px;
	background-color: #8FC9DB;
	text-align: center;
}

.title {
	margin-top: 7px;
	font-size: x-large;
}

.footer {
	text-align: center;
	height: 100px;
	margin-top: 150px;
	padding-top: 20px;
}

.footertext {
	font-size: small;
}

hr {
	border: solid 0.8px #8FC9DB;
}

label, p {
	font-size: large;
}

.blk70 {
	height: 70px;
}

.blk30 {
	height: 30px;
}

.sign_title_text {
	color: white;
	margin: 10px;
	margin-top: 17px;
	font-size: x-large;
}

.sign_btn {
	margin-left: 46%;
	margin-right: 46%;
}

.gender_radio {
	height: 20px;
	width: 20px;
}

header {
	border: solid black 1px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<div class="div_top">
			<a href="loginIn.jsp">로그인</a> / <a href="addUserIn.jsp">회원가입</a> / <a
				href="loginIn.jsp">마이페이지</a> / <a href="loginIn.jsp">장바구니</a>
		</div>
	</div>

	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<label class="white_text sign_title_text">회원가입</label>
	</div>
	<br>
	<br>
	<%
		String userId = (String) request.getAttribute("userId");
	%>
	<div class="sign_form container">
		<form class="form-horizontal" action="addUserProc.jsp" method="post">
			<div class="form-group">
				<label class="col-sm-5 control-label">아이디: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userId' type='text'
						placeholder='아이디' maxlength='12' minlength="4"
						<%if (userId != null) {%> value=<%=userId%> <%}%> required>
				</div>
				<div class="form-group">
					<input type="submit" value="아이디 확인" formaction="idCheck.jsp">
				</div>
			</div>
			<%
				String msgFail = (String) request.getAttribute("msgFail");
				String msgOk = (String) request.getAttribute("msgOk");
				if (msgFail != null) {
			%>
			<h3><%=msgFail%></h3>
			<%
				} else if (msgOk != null) {
			%>
			<h3><%=msgOk%></h3>
			<%
				}
			%>

			<div class="form-group">
				<label class="col-sm-5 control-label">비밀번호: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userPwd' type='password'
						placeholder='비밀번호' maxlength='16' minlength="8">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">비밀번호 확인: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userPwd2' type='password'
						placeholder='비밀번호 확인' maxlength='16' minlength="8">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">성명: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userName' type='text'
						placeholder='성명' maxlength='8' minlength="2">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">생년월일: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userDate' type='date'
						value='2020-04-17'>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">성별: </label>
				<div class="col-sm-4">
					<input class="gender_radio" name='gender' type='radio' value="남">남
					<input class="gender_radio" name='gender' type='radio' value="여">여
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">이메일: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userEmail' type='email'
						placeholder='이메일'>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">전화번호: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userTel' type='tel'
						placeholder="특수문자를 제외한 숫자만 입력해주세요." minlength="9">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">비밀번호 질문: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userQ' type='text'
						value='당신의 보물 제 1호는?' disabled>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-5 control-label">비밀번호 답변: </label>
				<div class="col-sm-4">
					<input class="form-control" name='userA' type='text'
						placeholder='답'>
				</div>
			</div>
			<br> <br>
			<button class="sign_btn btn btn-info" type="submit"
				<%if (msgFail == null && msgOk == null) {%> disabled
				<%} else if (msgFail != null) {%> disabled
				<%request.setAttribute("msgFail", null);
			}%>>가입하기</button>
			<br>
			<br>
			<div class='container'>
				<c:choose>
					<c:when test='${!empty param.msgId}'>
						<jsp:include page='msg.jsp' />
					</c:when>
				</c:choose>
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