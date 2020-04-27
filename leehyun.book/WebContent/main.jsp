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
   border: medium solid #8FC9DB;
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
         if(session.getAttribute("sessionID") == null){
%>
         <a href="user/loginIn.html">로그인</a> / 
         <a href="user/addUserIn.jsp">회원가입</a> /
<%
         }else{
%>
         <h5 class="welcome">${sessionID}님, 환영합니다 ! &nbsp;&nbsp;/</h5>
         <a href="user/logoutProc.jsp">로그아웃</a> / 
<%
         }
%>      
         <a href="../user/userInfo.jsp">마이페이지</a>
         / <a href="../order/addUserIn.jsp">장바구니</a>
      </div>
   </div>
   <div class="div_logo">
      <div class="logoimg">
         <a href='main.jsp' style="text-decoration: none;"> 로고이미지</a>
      </div>
   </div>
   <div class="search_bar">
      <form class="search_form" action="book/01.html">
         <label class="search_label">도서검색&nbsp;</label> <input
            class="search_input" type="text" required />
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
   <div class="item_cb">
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>2020 정보처리기사 실기</h4>
			<h6>길벗알앤디</h6>
		</div>
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>The Child in Time</h4>
			<h6>Anchor Books/Doubleday</h6>
		</div>
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>야생의 위로</h4>
			<h6>심심</h6>
		</div>
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>지금 시작하는 생각 인문학</h4>
			<h6>비즈니스북스</h6>
		</div>
	</div>
	<div class="item_cb">
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>2020 정보처리기사 실기</h4>
			<h6>길벗알앤디</h6>
		</div>
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>세상에서 가장 아름다운 책</h4>
			<h6>21세기 북스</h6>
		</div>
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>에크리</h4>
			<h6>새물결</h6>
		</div>
		<div class="book_item" onclick="location.href = 'book/02.html'">
			<div class="book_img">도서이미지</div>
			<h4>교양인의 논어</h4>
			<h6>미다스북스</h6>
		</div>
	</div>
	<div class="item_cb">
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>욕망과 탐욕의 인문학</h4>
			<h6>아이템하우스</h6>
		</div>
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>누구나 철학자가 되는 밤</h4>
			<h6>추수밭</h6>
		</div>
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>우리는 비 온 뒤를 걷는다</h4>
			<h6>알에이치코리아</h6>
		</div>
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>힐링 스페이스</h4>
			<h6>더퀘스트</h6>
		</div>
	</div>
	<div class="item_cb">
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>사랑받을 권리</h4>
			<h6>웅진지식하우스</h6>
		</div>
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>내 아이는 생각이 너무 많아</h4>
			<h6>부키</h6>
		</div>
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>명리심리학</h4>
			<h6>다산북스</h6>
		</div>
		<div class="book_item">
			<div class="book_img">도서이미지</div>
			<h4>신화 콘서트</h4>
			<h6>행복한작업실</h6>
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