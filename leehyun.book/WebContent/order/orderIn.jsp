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
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var roadAddr = data.roadAddress;
						var extraRoadAddr = '';

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}

						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						document.getElementById("roadAddr").value = roadAddr;

						if (roadAddr !== '') {
							document.getElementById("sample4_extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("sample4_extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");

						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>
<script>
	function alert_buy() {
		swal({
			title : "결제 확인",
			text : "결제 하시겠습니까?",
			type : "info",
			showCancelButton : true,
			cancelButtonText : "아니오",
			confirmButtonText : "예",
			closeOnConfirm : false
		}, function(isConfirm) {
			if (isConfirm) {
				document.order.submit();
			}
		});
	}
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
	margin-right: 15px;
	border: 1px solid black;
	float: left;
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

.cen {
	text-align: center;
}

.div_half {
	width: 50%;
	display: inline;
	float: left;
}

.div_float {
	background-color: #8FC9DB;
	padding-top: 10px;
	height: 210px;
}

.ta {
	width: 90%;
	height: 120px;
}

.d_op {
	width: 20%;
	text-align: right;
	margin: 5px;
	color: white;
}

.d_op_in {
	height: 35px;
	margin: 5px;
	width: 60%;
}

.buy_div {
	height: 100px;
}

.buy_half {
	height: 50%;
	width: 50%;
	margin: 0px;
	display: inline-block;
	float: left;
}

.fs24 {
	font-size: 25px;
}

.pad_top {
	padding-top: 20px;
}

.div_mt {
	text-align: center;
	margin-top: 20px;
}

.pad_bottom {
	padding: 5px;
	padding-left: 7%;
}

.l_m1 {
	margin: 0 20px;
	margin-left: 75px;
}

.l_m2 {
	margin: 0 20px;
	margin-left: 40px;
}

.l_m3 {
	margin: 0 20px;
	margin-left: 20px;
}

.l_m {
	margin: 0 40px;
}

#way {
	width: 100px;
	height: 30px;
}

.bt_fr {
	float: right;
	margin-right: 10px;
}

.chart {
	background-color: #8FC9DB;
	color: white;
}

.delivery {
	text-align: left;
	padding: 15px;
	background-color: #8FC9DB;
}

th, td {
	font-size: 17px;
	text-align: center;
}

.name {
	text-align: center;
	font-weight: 700;
}
</style>
</head>
<body>
	<%
		List<String> cartArr = (List<String>) session.getAttribute("cart");

		for (String str : cartArr) {
			if (request.getParameterValues(str) != null)
				session.setAttribute(str, request.getParameterValues(str));
		}

		String receiver = (String) request.getAttribute("receiver");
		String baseAddr = (String) request.getAttribute("baseAddr");
		String detailAddr = (String) request.getAttribute("detailAddr");
		String receiverTel = (String) request.getAttribute("receiverTel");
	%>
	<div class="container">
		<div class="div_top">
			<h5 class="welcome">${sessionID}님,환영합니다! &nbsp;&nbsp;/</h5>
			<a href="../user/logoutProc.jsp">로그아웃</a> / <a
				href="../user/userInfo.jsp">마이페이지</a> / <a href="cartOut.jsp">장바구니</a>
		</div>

	</div>
	<div class="div_logo">
		<div class="logoimg">
			<a href='../main.jsp' style="text-decoration: none;"> 로고이미지</a>
		</div>
	</div>
	<!-- 메인 검색창 -->
	<div class="search_bar">
		<form action="../book/search.jsp">
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
			<li><a href='orderOut.jsp'><span
					class="glyphicon glyphicon-list"></span> 주문내역</a></li>
			<li><a href='../refund/01.html'><span
					class="glyphicon glyphicon-refresh"></span> 환불내역</a></li>
		</ul>
		<br>
		<h1 class="name">결제 정보</h1>
		<br>
		<!-- 상품확인 -->
		<h3>상품 확인</h3>

		<!-- 장바구니 내역 -->
		<form action="orderProc.jsp" name="order">
			<table class="table fs24">
				<thead>
					<tr class="chart">
						<th class="cen"></th>
						<th class="cen">도서명</th>
						<th class="cen">수량</th>
						<th class="cen">총액</th>
					</tr>
				</thead>
				<tbody>
					<%
						int sum = 0;
						for (String str : cartArr) {
							String[] cartItem = (String[]) session.getAttribute(str);
							if (cartItem.length == 5) {
								int sumPrice = Integer.parseInt(cartItem[3]) * Integer.parseInt(cartItem[4]);
					%> 
					<tr>
						<td class="cen"><div class="book_img">
								<input name="isbn" value="<%=cartItem[0]%>"
									style="display: none;">
							</div></td>
						<td class="cen"><%=cartItem[2]%></td>
						<td class="cen"><%=cartItem[3]%><input name="orderCnt"
							value="<%=cartItem[3]%>" style="display: none;"></td>
						<td class="cen"><%=sumPrice%></td>
					</tr>
					<%
						sum += sumPrice;
							}
						}
					%>
				</tbody>
			</table>
			<br>
			<!-- 배송정보 -->
			<%
				if (request.getAttribute("conErr") != null) {
			%>
			<div class="alert fade in alert-danger">
				<a href="#" class="close" data-dismiss="alert">&times;</a> <strong>입력정보가
					충분하지 않습니다.</strong>
			</div>
			<%
				}
			%>
			<h3>배송 정보</h3>
			<div class="div_float">
				<div class="div_half">
					<label class="d_op">수령인 : </label> <input class="d_op_in"
						type="text" name="receiver" placeholder="수령인"
						<%if (receiver != null) {%> value=<%=receiver%> <%}%>><br>

					<label class="d_op">배송지: &nbsp;</label>

					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="baseAddr" placeholder="도로명주소" name="baseAddr"
					<%if (baseAddr != null) {%> value=<%=baseAddr%> <%}%> required>
					<input type="text" id="detailAddr" placeholder="상세주소" name="detailAddr" 
					<%if (detailAddr != null) {%> value=<%=detailAddr%> <%}%> required>
					
					<label class="d_op">핸드폰번호 : </label> <input class="d_op_in"
						type="tel" name="receiverTel" placeholder="특수문자를 제외한 숫자만 입력해주세요"
						<%if (receiverTel != null) {%> value=<%=receiverTel%> <%}%>>
				</div>

				<div class="div_half">
					<label class="d_op">배송요청사항</label>
					<textarea class="ta" name="deliveryReq"></textarea>
				</div>
			</div>

			<!-- 구매&삭제 버튼 -->
			<br>
			<hr>
			<div class="buy_div">
				<div class="buy_half pad_top">
					<label class="l_m1">금액(￦):</label><label class="l_m2">배송비(￦):</label>
					<label class="fs24 l_m3">총 금액(￦):</label>
				</div>
				<div class="buy_half">
					<div class="div_mt">
						<label for="way">결제 방식&nbsp;&nbsp;</label> <select
							name="paymentType" id="way">
							<option value="신용카드">신용카드</option>
							<option value="무통장 입금">무통장 입금</option>
						</select>
						<button class="btn btn-success bt_fr" type="button"
							onclick="alert_buy()" style="font-size: 15px;">
							<span class="glyphicon glyphicon-ok"></span> 결제
						</button>
						<button class="btn btn-danger bt_fr" type="button"
							onclick="location.href='cartOut.jsp'" style="font-size: 15px;">
							<span class="glyphicon glyphicon-remove"></span> 취소
						</button>
					</div>
				</div>
				<div class="buy_half pad_bottom">
					<label><%=sum%></label><label class="l_m">+</label> <label>2,500</label><label
						class="l_m">=</label> <label class="fs24"><%=sum + 2500%></label>
				</div>
				<div class="buy_half"></div>
			</div>
			<!-- 우편번호 API -->
			<script
				src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				function sample4_execDaumPostcode() {
					new daum.Postcode(
							{
								oncomplete : function(data) {
									// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

									// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
									// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
									var baseAddr = data.roadAddress; // 도로명 주소 변수
									var extraRoadAddr = ''; // 참고 항목 변수

									// 법정동명이 있을 경우 추가한다. (법정리는 제외)
									// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
									if (data.bname !== ''
											&& /[동|로|가]$/g.test(data.bname)) {
										extraRoadAddr += data.bname;
									}
									// 건물명이 있고, 공동주택일 경우 추가한다.
									if (data.buildingName !== ''
											&& data.apartment === 'Y') {
										extraRoadAddr += (extraRoadAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
									if (extraRoadAddr !== '') {
										extraRoadAddr = ' (' + extraRoadAddr
												+ ')';
									}

									// 우편번호와 주소 정보를 해당 필드에 넣는다.
									document
											.getElementById("baseAddr").value = baseAddr;

									// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
									if (baseAddr !== '') {
										document
												.getElementById("sample4_extraAddress").value = extraRoadAddr;
									} else {
										document
												.getElementById("sample4_extraAddress").value = '';
									}

									var guideTextBox = document
											.getElementById("guide");
									// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
									if (data.autoRoadAddress) {
										var expRoadAddr = data.autoRoadAddress
												+ extraRoadAddr;
										guideTextBox.innerHTML = '(예상 도로명 주소 : '
												+ expRoadAddr + ')';
										guideTextBox.style.display = 'block';

									} else if (data.autoJibunAddress) {
										var expJibunAddr = data.autoJibunAddress;
										guideTextBox.innerHTML = '(예상 지번 주소 : '
												+ expJibunAddr + ')';
										guideTextBox.style.display = 'block';
									} else {
										guideTextBox.innerHTML = '';
										guideTextBox.style.display = 'none';
									}
								}
							}).open();
				}
			</script>
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
