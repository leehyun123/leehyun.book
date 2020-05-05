<%@page import="java.text.DecimalFormat"%>
<%@page import="com.sun.scenario.effect.impl.prism.PrTexture"%>
<%@page import="leehyun.book.book.service.BookServiceImpl"%>
<%@page import="leehyun.book.book.service.BookService"%>
<%@page import="leehyun.book.book.domain.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function alert_delete(){
		swal({
			title : "삭제하시겠습니까?",
			text : "선택한 상품들이 삭제됩니다.",
			type : "warning",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				document.cart.action = "cartDelProc.jsp";
				document.cart.submit();
			}
		});
	};
	
	function alert_emp(){
		swal({
			title : "체크된 항목이 없습니다.",
			text : "선택해주세요.",
			type : "warning",
			showCancelButton : false,
			confirmButtonText : "예",
			closeOnConfirm : false
		});
	};
	
	function alert_cnterr(){
		swal({
			title : "수량을 확인해주세요.",
			text : "체크한 도서의 수량은 최소 1개 여야 합니다.",
			type : "warning",
			showCancelButton : false,
			confirmButtonText : "예",
			closeOnConfirm : false
		});
	};
	
	function ck(){
		if($("input:checkbox[class=cb_item]:checked").length == 0){
			alert_emp();
		}else if($("input:checkbox[name=cart0]").is(":checked") && $('input.cart0').val() < 1 || 
				$("input:checkbox[name=cart1]").is(":checked") && $('input.cart1').val() < 1 ||
				$("input:checkbox[name=cart2]").is(":checked") && $('input.cart2').val() < 1 ||
				$("input:checkbox[name=cart3]").is(":checked") && $('input.cart3').val() < 1 ||
				$("input:checkbox[name=cart4]").is(":checked") && $('input.cart4').val() < 1 ||
				$("input:checkbox[name=cart5]").is(":checked") && $('input.cart5').val() < 1 ||
				$("input:checkbox[name=cart6]").is(":checked") && $('input.cart6').val() < 1 ||
				$("input:checkbox[name=cart7]").is(":checked") && $('input.cart7').val() < 1 ||
				$("input:checkbox[name=cart8]").is(":checked") && $('input.cart8').val() < 1 ||
				$("input:checkbox[name=cart9]").is(":checked") && $('input.cart9').val() < 1){
			alert_cnterr();
		}else{
			document.cart.submit();
		}
	};
	
	function ck2(){
		if($("input:checkbox[class=cb_item]:checked").length == 0){
			alert_emp();
		}else{
			alert_delete()();
		}
	};

	$( document ).ready( function() {
		$( '.check_all' ).click( function() {
          	$( '.cb_item' ).prop( 'checked', this.checked );
          	if($(".check_all").is(":checked") == true) {
          		$('label.cart0').text((parseInt($('p.cart0').text()) * $('input.cart0').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart1').text((parseInt($('p.cart1').text()) * $('input.cart1').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart2').text((parseInt($('p.cart2').text()) * $('input.cart2').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart3').text((parseInt($('p.cart3').text()) * $('input.cart3').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart4').text((parseInt($('p.cart4').text()) * $('input.cart4').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart5').text((parseInt($('p.cart5').text()) * $('input.cart5').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart6').text((parseInt($('p.cart6').text()) * $('input.cart6').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart7').text((parseInt($('p.cart7').text()) * $('input.cart7').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart8').text((parseInt($('p.cart8').text()) * $('input.cart8').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
          		$('label.cart9').text((parseInt($('p.cart9').text()) * $('input.cart9').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
  			}else{
  				$('label.cart0').text('');
  				$('label.cart1').text('');
  				$('label.cart2').text('');
  				$('label.cart3').text('');
  				$('label.cart4').text('');
  				$('label.cart5').text('');
  				$('label.cart6').text('');
  				$('label.cart7').text('');
  				$('label.cart8').text('');
  				$('label.cart9').text('');
  			}
          	calcsum();
        } );
        
        $("input:checkbox[name=cart0]").on('change',function(e) {
        	if($("input:checkbox[name=cart0]").is(":checked") == true) {
        		$('label.cart0').text((parseInt($('p.cart0').text()) * $('input.cart0').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart0').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart1]").on('change',function(e) {
        	if($("input:checkbox[name=cart1]").is(":checked") == true) {
        		$('label.cart1').text((parseInt($('p.cart1').text()) * $('input.cart1').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart1').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart2]").on('change',function(e) {
        	if($("input:checkbox[name=cart2]").is(":checked") == true) {
        		$('label.cart2').text((parseInt($('p.cart2').text()) * $('input.cart2').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart2').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart3]").on('change',function(e) {
        	if($("input:checkbox[name=cart3]").is(":checked") == true) {
        		$('label.cart3').text((parseInt($('p.cart3').text()) * $('input.cart3').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart3').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart4]").on('change',function(e) {
        	if($("input:checkbox[name=cart4]").is(":checked") == true) {
        		$('label.cart4').text((parseInt($('p.cart4').text()) * $('input.cart4').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart4').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart5]").on('change',function(e) {
        	if($("input:checkbox[name=cart5]").is(":checked") == true) {
        		$('label.cart5').text((parseInt($('p.cart5').text()) * $('input.cart5').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart5').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart6]").on('change',function(e) {
        	if($("input:checkbox[name=cart6]").is(":checked") == true) {
        		$('label.cart6').text((parseInt($('p.cart6').text()) * $('input.cart6').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart6').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart7]").on('change',function(e) {
        	if($("input:checkbox[name=cart7]").is(":checked") == true) {
        		$('label.cart7').text((parseInt($('p.cart7').text()) * $('input.cart7').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart7').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart8]").on('change',function(e) {
        	if($("input:checkbox[name=cart8]").is(":checked") == true) {
        		$('label.cart8').text((parseInt($('p.cart8').text()) * $('input.cart8').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart8').text('');
    		}
        	calcsum();
        } );
        
        $("input:checkbox[name=cart9]").on('change',function(e) {
        	if($("input:checkbox[name=cart9]").is(":checked") == true) {
        		$('label.cart9').text((parseInt($('p.cart9').text()) * $('input.cart9').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart9').text('');
    		}
        	calcsum();
        } );
        
        $('input.cart0').on('change',function(e){
        	if($("input:checkbox[name=cart0]").is(":checked") == true) {
        		$('label.cart0').text((parseInt($('p.cart0').text()) * $('input.cart0').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart0').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart1').on('change',function(e){
        	if($("input:checkbox[name=cart1]").is(":checked") == true) {
        		$('label.cart1').text((parseInt($('p.cart1').text()) * $('input.cart1').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart1').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart2').on('change',function(e){
        	if($("input:checkbox[name=cart2]").is(":checked") == true) {
        		$('label.cart2').text((parseInt($('p.cart2').text()) * $('input.cart2').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart2').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart3').on('change',function(e){
        	if($("input:checkbox[name=cart3]").is(":checked") == true) {
        		$('label.cart3').text((parseInt($('p.cart3').text()) * $('input.cart3').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart3').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart4').on('change',function(e){
        	if($("input:checkbox[name=cart4]").is(":checked") == true) {
        		$('label.cart4').text((parseInt($('p.cart4').text()) * $('input.cart4').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart4').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart5').on('change',function(e){
        	if($("input:checkbox[name=cart5]").is(":checked") == true) {
        		$('label.cart5').text((parseInt($('p.cart5').text()) * $('input.cart5').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart5').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart6').on('change',function(e){
        	if($("input:checkbox[name=cart6]").is(":checked") == true) {
        		$('label.cart6').text((parseInt($('p.cart6').text()) * $('input.cart6').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart6').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart7').on('change',function(e){
        	if($("input:checkbox[name=cart7]").is(":checked") == true) {
        		$('label.cart7').text((parseInt($('p.cart7').text()) * $('input.cart7').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart7').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart8').on('change',function(e){
        	if($("input:checkbox[name=cart8]").is(":checked") == true) {
        		$('label.cart8').text((parseInt($('p.cart8').text()) * $('input.cart8').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart8').text('');
    		}
        	calcsum();
    	});
        
        $('input.cart9').on('change',function(e){
        	if($("input:checkbox[name=cart9]").is(":checked") == true) {
        		$('label.cart9').text((parseInt($('p.cart9').text()) * $('input.cart9').val()).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
    		}else{
    			$('label.cart9').text('');
    		}
        	calcsum();
    	});
        
	});
	
	function calcsum(){
		var sum0 = ( parseInt($('label.cart0').text().replace(/[^\d]+/g, '')) || 0);
		var sum1 = ( parseInt($('label.cart1').text().replace(/[^\d]+/g, '')) || 0);
		var sum2 = ( parseInt($('label.cart2').text().replace(/[^\d]+/g, '')) || 0);
		var sum3 = ( parseInt($('label.cart3').text().replace(/[^\d]+/g, '')) || 0);
		var sum4 = ( parseInt($('label.cart4').text().replace(/[^\d]+/g, '')) || 0);
		var sum5 = ( parseInt($('label.cart5').text().replace(/[^\d]+/g, '')) || 0);
		var sum6 = ( parseInt($('label.cart6').text().replace(/[^\d]+/g, '')) || 0);
		var sum7 = ( parseInt($('label.cart7').text().replace(/[^\d]+/g, '')) || 0);
		var sum8 = ( parseInt($('label.cart8').text().replace(/[^\d]+/g, '')) || 0);
		var sum9 = ( parseInt($('label.cart9').text().replace(/[^\d]+/g, '')) || 0);

		var sum = sum0 + sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7 + sum8 + sum9;
		$(".sumc").text( sum.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
	};
	
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
	width: 85px;
	height: 100px;
	border: 1px solid black;
	margin: 0 auto;
	font-size: 15px;
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

.tab {
	text-align: center;
	font-size: 15px;
}

.sub_result {
	overflow: hidden;
}

.sub_result .button-buy {
	float: left;
}

.sub_result .button-delete {
	float: left;
	margin-left: 20px;
}

.sub_result .sub_charge {
	float: right;
}

.sub_charge span {
	font-weight: bold;
	font-size: 28px;
}

.chart {
	background-color: #8FC9DB;
	color: white;
}

th, td {
	font-size: 16px;
	text-align: center;
}

.input_width {
	width: 40px;
}

.name {
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<%
	int te = 300;	

	BookService bookService = new BookServiceImpl();

	Cookie[] cookies = request.getCookies();
	List<String> ISBN = new ArrayList<>();
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	for(Cookie cookie : cookies){
		if(cookie.getName().substring(0, 4).equals("ISBN"))
		ISBN.add(cookie.getValue());
	}
	List<Book> books = null;
	List<String> cartItem = new ArrayList<>();
	
	if( ISBN.size() != 0 ){

	books = bookService.getCart(ISBN);
	
	for(int i=0; i<books.size(); i++)
		cartItem.add("cart" + i);
	
	}
	
	session.setAttribute("cart", cartItem);
%>
<body>
	<div class="container">
		<div class="div_top">
			<%
				if(session.getAttribute("sessionID") == null){
			%>
			<a href="../user/loginIn.html">로그인</a> / <a href="../user/addUserIn.html">회원가입</a>
			/
			<%
				}else{
			%>
			<h5 class="welcome">${sessionID} 님, 환영합니다 ! &nbsp;&nbsp;/</h5>
			<a href="../user/logoutProc.jsp">로그아웃</a> /
			<%
				}
			%>
			<a href="../user/userInfo.jsp">마이페이지</a> / <a href="cartOut.jsp">장바구니</a>
		</div>
	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<!-- 메인 검색창 -->
	<div class="search_bar">
		<form class="search_form" action="../book/search.jsp">
			<label class="search_label">도서검색&nbsp;</label> <input
				class="search_input" type="text" name="search_words" required />
			<button class="search_btn btn btn-default" type="submit">
				<span class="glyphicon glyphicon-search">&nbsp;</span>검색
			</button>
		</form>
	</div>

	<!-- 메인 nav Bar -->
	<br>
	<div class='container'>
		<ul class='tab nav nav-tabs nav-justified'>
			<li><a href='../user/userInfo.jsp'><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li class='active' style="font-weight: bold;"><a
				href='cartOut.jsp'><span
					class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
			<li><a href='../order/orderOut.jsp'><span
					class="glyphicon glyphicon-list"></span> 주문내역</a></li>
			<li><a href='../refund/refundOut.jsp'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
		<br>
		<h1 class="name">장바구니</h1>
		<br> <br>
		<!-- 장바구니 내역 -->
		<form name="cart" action="orderIn.jsp">
		<table class="table table-hover">
			<thead>
				<tr class="chart">
					<td><input type="checkbox" class="check_all" checked></td>
					<th colspan='2'>도서</th>
					<th>수량</th>
					<th>가격</th>
					<th>총액</th>
				</tr>
			</thead>
			<tbody>
<%
				int i=0;
				int sum=0;
				if( ISBN.size() != 0 ){
					for(Book book : books){
						String name = cartItem.get(i);
						i++;
						sum += book.getbookPrice();
						String price = df.format(book.getbookPrice());
%>
						<tr>
							<td align="center"><input type="checkbox" name="<%=name%>" class="cb_item"
								value="<%=book.getisbn()%>" checked></td>
							<td><div class="book_img">도서 이미지</div></td>
							<td align="center"><%=book.getbookTitle()%><input name="<%=name%>" value="<%=book.getbookImg()%>" style="display: none;">
							<input name="<%=name%>" value="<%=book.getbookTitle()%>" style="display: none;"></td>
							<td align="center"><input type="number" name="<%=name%>" value="1"
								class="input_width <%=name%>" min="1" max="99" maxlength="2"><input name="<%=name%>" value="<%=book.getbookPrice()%>" style="display: none;"></td>
							<td align="center"><label><%=price%></label>
							<p class="<%=name%>" style="display: none;"><%=book.getbookPrice()%></p></td>
							<td align="center"><label class="<%=name%>"><%=price%></label></td>
						</tr>
<%
					}
				}else{
%>
					<tr><td colspan='6' style="height: 200px; padding-top: 80px; font-size: 35px;">장바구니가 비었습니다.</td></tr>
<%
				}
%>
			</tbody>
		</table>
		
		<!-- 구매&삭제 버튼 -->
		<br>
		<hr>
		<br>
		<div class="sub_result">
			<div class="button-buy" align="left">
<%
				if( ISBN.size() != 0 ){
%>
					<button class="btn btn-success" type="button"
						style="font-size: 15px;" onclick="ck()">
						<span class="glyphicon glyphicon-ok"></span> 구매
					</button>
<%
				}else{
%>
					<button class="btn btn-success" type="button"
						style="font-size: 15px;" onclick="alert_emp()">
						<span class="glyphicon glyphicon-ok"></span> 구매
					</button>
<%
				}
%>
			</div>

			<div class="button-delete" align="left">
				<button class="btn btn-danger" type="button"
					onclick="ck2()"  style="font-size: 15px;">
					<span class="glyphicon glyphicon-remove"></span> 삭제
				</button>
			</div>
			
<%
			String sumc = df.format(sum);
%>
			<div class="sub_charge">
				<span>총 금액(￦) : </span><span class="sumc"><%=sumc%></span><span>원</span>
			</div>
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

