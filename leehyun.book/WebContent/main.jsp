<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
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

.item_cb {
	text-align: center;
	width: 1300px;
	margin-right: auto;
	margin-left: auto;
}

.book_item {
	margin: 15px;
	height: 300px;
	width: 250px;
	padding: 15px;
	text-align: center;
	border: thin solid #8FC9DB;
	display: inline-block;
}

.book_img {
	width: 170px;
	height: 200px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 20px;
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

.test_background {
	width: 100%;
	height: 200px;
	padding: 15px 0;
	background-color: #E0ECF8
}

.test_background>.test_area {
	width: 1170px;
	margin: 0 auto;
	height: 170px;
	background-color: gray;
}
</style>
</head>
<body>
	<div class="container">
		<div class="div_top">
			<%
				if (session.getAttribute("sessionID") == null) {
			%>
			<a href="user/loginIn.jsp">로그인</a> / <a href="user/addUserIn.jsp">회원가입</a>
			/ <a href="user/loginIn.jsp">마이페이지</a> / <a
				href="user/loginIn.jsp">장바구니</a>
			<%
				} else {
			%>
			<h5 class="welcome">${sessionID}님,환영합니다!&nbsp;&nbsp;/</h5>
			<a href="user/logoutProc.jsp">로그아웃</a> /
			<a href="user/userInfo.jsp">마이페이지</a> / <a
				href="order/cartOut.jsp">장바구니</a>
			<%
				}
			%>
		</div>
		
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<form class="search_form" action="book/search.jsp">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" name="search_words" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="test_background">
			<div class="carousel-inner test_area">
				<div class="item active">
					<p>배너 이미지1</p>
				</div>
				<div class="item">
					<p>배너 이미지2</p>
				</div>
				<div class="item">
					<p>배너 이미지3</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 메인 도서 목록들 -->
	<br>
	<div class="item_cb">
		<div>
			<jsp:include page='book/list.jsp' />
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