<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
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
hr {
   border: solid 0.8px #8FC9DB;
}

.div_logo {
   width: 300px;
   height: 70px;
   color: #8FC9DB;
   border: 1px solid black;
   text-align: center;
   margin: 0 auto;
}

.blk70 {
   height: 70px;
}

.blk30 {
   height: 30px;
}

.login_input {
   width: 400px;
   height: 50px;
   margin: 0 auto;
   display: block;
}

.login_btn {
   width: 300px;
   height: 50px;
   margin: 0 auto;
   display: block;
}

.item_center {
   text-align: center;
}
</style>
</head>
<body>
   <div class="container">
      <div class="blk70"></div>
      <div class="div_logo">
         <a href='../main.jsp' style="text-decoration: none">
            <h1>로고 이미지</h1>
         </a>
      </div>
      <div class="blk30"></div>
      <div class='container'>
			<c:choose>
				<c:when test='${!empty param.msgId}'>
					<jsp:include page='msg.jsp'/>
				</c:when>
			</c:choose>
		</div>
      <form action="loginProc.jsp" method="post">
         <input class="login_input" type="text" placeholder="아이디" maxlength='12' name="userId">
         <div class="blk30"></div>
         <input class="login_input" type="password" placeholder="비밀번호" name="password">
         <div class="blk70"></div>
         <button class="login_btn" type="submit">로그인</button>
      </form>
      <div class="blk30"></div>
   </div>
   <hr>
   <div class="blk30"></div>
   <div class="item_center">
      <a href="idFindIn.jsp">아이디 찾기</a>&nbsp;|&nbsp; <a href="pwFindIn.jsp">비밀번호
         찾기</a>&nbsp;|&nbsp; <a href="addUserIn.jsp">회원가입</a>
   </div>
</body>
</html>