<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function cart(cartcnt) {
		console.log(cartcnt);
		if(cartcnt < 10 ) {
			swal({
				title : "장바구니 담기 성공!",
				text : "장바구니로 이동하시겠습니까?",
				type : "success",
				showCancelButton : true,
				cancelButtonText : "아니오",
				confirmButtonText : "예",
				closeOnConfirm : false
				}, function() {
					location.href = '../order/cartProc.jsp';
			});
		}else{
			swal({
				title : "장바구니 담기 실패!",
				text : "장바구니는 10개까지만 저장됩니다.\n장바구니로 이동하시겠습니까?",
				type : "warning",
				showCancelButton : true,
				cancelButtonText : "아니오",
				confirmButtonText : "예",
				closeOnConfirm : false
				}, function() {
					location.href = '../order/cartOut.jsp';
			});
		}
	};
</script>
<style>
label, p {
	font-size: large;
}

.welcome {
	display: inline;
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

.book_img {
	width: 330px;
	height: 400px;
	margin-left: 40px;
	margin-right: 50px;
	border: medium solid #8FC9DB;
	float: left;
	text-align: center;
	font-size: 25px;
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
	border: solid 0.8px #8FC9DB;
}

.blk30 {
	height: 40px;
}

.blk20 {
	height: 10px;
}

.title {
	font-size: 35px;
}

.book_info {
	font-size: 23px;
	font-weight: 500;
}

.book_price {
	font-size: 40px;
}

.content {
	margin-left: 30px;
	font-weight: 600;
	font-size: 20px;
	overflow: auto;
	white-space: pre-wrap;
	font-family: '나눔고딕코딩';
}

.book_item {
	width: 1500px;
}

.cart_btn {
	margin-left: 15%;
	font-weight: 600;
	margin-bottom: 15px;
	font-size: 18px;
	width: 200px;
	height: 40px;
}
</style>
</head>
<%
	Cookie[] cookies = request.getCookies();

	int cartCnt = 0;

	for(Cookie cookie : cookies){
		if(cookie.getName().substring(0, 4).equals("ISBN"))
			cartCnt++;
	}
%>
<body>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">이현 님, 환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../main.jsp">로그아웃</a> / <a href="../mypage/01.html">마이페이지</a>
			/ <a href="../order/01.html">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<div class="search_bar">
		<form class="search_form" action="../book/01.html">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>
	<div class="blk30"></div>
	<div class="container">
		<div class="book_item">
			<div class="book_img">
				<br>도서 이미지
			</div>
			<label class="title">2020 정보처리기사 필기</label>
			<div class="blk30"></div>
			<label class="book_info">ISBN&nbsp;&nbsp;&nbsp;&nbsp;</label> <label
				class="book_info">98765432121233</label><br>
			<br> <label class="book_info">저자명&nbsp;</label> <label
				class="book_info">길벗알앤디</label><br> <br> <label
				class="book_info">출판사&nbsp;</label> <label class="book_info">길벗</label><br>
			<br> <label class="book_info">출판일&nbsp;</label> <label
				class="book_info">2019년 11월</label><br> <br>
			<div class="blk20"></div>
			<label class="book_info">&nbsp;&nbsp;가격&nbsp;&nbsp;</label> <label
				class="book_price">28,000</label> <label class="book_info">원</label>
			<button class="cart_btn btn btn-info" type="button" onClick="cart(<%=cartCnt%>)">
				<span class="glyphicon glyphicon-shopping-cart">&nbsp;</span>장바구니에
				담기
			</button>
			<br>
		</div>
	</div>
	<div class="container">
		<div class="blk30"></div>
		<hr>
		<h3 style="margin-left: 40px;">소개</h3>
		<br>
		<pre class="content">
2020년 정보처리기사 NCS기반 전면 개편! 

정보처리기사 시험은 NCS 학습 모듈 중 정보통신 분야의 ‘정보기술’ 분류에 포함된 ‘정보기술개발’과 ‘정보기술운영’에 속한 125개의 학습 모듈을 기반으로 하고있습니다. 
〈2020 시나공 정보처리기사 필기〉는 출제기준에 포함된 125개의 학습 모듈을 완전 분해하여 정보처리기사 수준에맞게 194개 섹션으로 엄선하여 정리하였습니다. 
또 처음 출제되는 방대한 시험 범위, 모든 걸 다 암기할 수는 없습니다.
시험에 나오는 것 중에서도 중요 난이도별 A, B, C, D 등급 섹션을 참고하여 주어진 시간동안 선별하여 학습할 수 있습니다. 

* NCS(국가직무능력표준)란 산업현장에서 직무를 수행하기 위해 요구되는 지식·기술·소양 등의 내용을 국가가 산업부문별·수준별로 체계화한 것입니다.
      </pre>
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