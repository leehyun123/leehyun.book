<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="leehyun.book.img.service.ImgServiceImpl"%>
<%@page import="leehyun.book.img.service.ImgService"%>
<%@page import="leehyun.book.img.domain.Img"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	ImgService imgService = new ImgServiceImpl();
	List<Img> imgs = imgService.listImgs();
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
         title : "배너 수정 성공",
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

.div_top {
   margin-top: 10px;
   color: white;
   height: 20px;
   float: right;
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

.blk30 {
   height: 30px;
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
   margin-top: 50px;
   float: right;
}

hr {
   border: solid 0.8px #8FC9DB;
}

.test_background {
   width: 100%;
   height: 200px;
   padding: 15px 0;
   background-color: white;
}

.test_background>.test_area {
   width: 1170px;
   margin: 0 auto;
   height: 170px;
   background-color: lightblue;
}

.edit {
   float: right;
   margin-right: 15px;
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
         <a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
      </div>
   </div>
   <div class="search_bar">
      <label class="search_label">배너 관리</label>
   </div>
   <div class="blk30"></div>
   <form action = "imgProc.jsp" method="post" enctype="multipart/form-data">
   <div id="myCarousel" class="carousel slide" data-ride="carousel"  data-interval="false">
      <ol class="carousel-indicators">
         <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
         <li data-target="#myCarousel" data-slide-to="1"></li>
         <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
     
      <div class="test_background">
         <div class="carousel-inner test_area">
            <%

            %>
            <div class="item active">
               <c:choose>
               	<c:when test="${empty imgs}">
               	이미지없음.
               	</c:when>
               	<c:otherwise>
					<img src='../../img/<%=imgs.get(imgs.size()-1).getImgUrl()%>'>               		
               	</c:otherwise>
               </c:choose>
               <input class="img_btn" type="file" name="attachFile0">
            </div>
            <div class="item">
               <p>배너 이미지2</p>
               <input class="img_btn" type="file" name="attachFile1">
            </div>
            <div class="item">
               <p>배너 이미지3</p>
               <input class="img_btn" type="file" name="attachFile2">
            </div>
         </div>
      </div>
      
      <a class='left carousel-control' href='#myCarousel' data-slide='prev'>
         <span class='glyphicon glyphicon-chevron-left'></span>
      </a> <a class='right carousel-control' href='#myCarousel'
         data-slide='next'> <span
         class='glyphicon glyphicon-chevron-right'></span>
      </a>
   </div>
   <div class="blk30"></div>
   <div class="container">
      <button type="submit" class="edit btn btn-info">수정 완료</button>
   </div>
   </form>
   <br>
   <div class="container">
      <button type="submit" class="edit btn btn-default">배너 추가</button>
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