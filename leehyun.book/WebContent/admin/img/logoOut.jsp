<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="leehyun.book.img.service.ImgService"%>
<%@ page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@ page import="leehyun.book.img.domain.Img"%>
<%@ page import="java.util.List, java.util.ArrayList"%>

<%
	request.setCharacterEncoding("utf-8");
	ImgService imgService = new ImgServiceImpl();
	Img img = imgService.findImg(1);
	if(img == null){
		img = new Img();
		img.setImgNum(1);
		img.setImgUrl("noImg.png");
		imgService.joinImg(img);
	}
	
	
%>

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
	function alert_banner() {
		swal({
			title : "로고 수정 성공",
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
	}
</script>
<style>
label, p {
	font-size: large;
}

h2 {
	font-weight: bold;
}

.div_top {
	margin-top: 10px;
	color: white;
	height: 20px;
	float: right;
}

.logoimg {
	color: #8FC9DB;
	background-color: white;
	width: 600px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 50px;
}

.div_logo {
	height: 180px;
	text-align: center;
}

.search_bar {
	height: 70px;
	background-color: #8FC9DB;
}

.search_label {
	color: white;
	margin: 10px;
	margin-top: 14px;
	margin-left: 300px;
	font-size: 30px;
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

.img_btn {
	font-size: 18px;
}

.item {
	padding: 30px;
}

hr {
	border: solid 0.8px #8FC9DB;
}

.edit {
	float: right;
	margin-right: 15px;
	font-size: 15px;
}

.logo_img {
	margin-top: 18px; 
	width: 100%;
	height: 190px;
}
</style>
</head>
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
		<label class="search_label">로고 관리</label>
	</div>
	<div style="height: 20px;"></div>
	<form action = "logoProc.jsp" method="post" enctype="multipart/form-data">
	<div class="container">
		<h2>MAIN 로고 이미지</h2>
		<input class="img_btn" type="file" name="uploadFile">
		<img src='../../img/<%=img.getImgUrl()%>'>
	</div>
	<div class="container" style="margin-top: 30px;">
		<button type="submit" class="edit btn btn-success">수정 완료</button>
	
	</div>
	</form>
	<div class=footer>
		<hr>
		<p class='footertext'>
			대표이사 이 현 | 대표 전화 02 – 0000 – 0000<br> 본사 서울시 마포구 서교동 | 주소 서울시
			마포구 서교동<br> 고객센터 02 – 1234 - 1234
		</p>
	</div>
</body>
</html>