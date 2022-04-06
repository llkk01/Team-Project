<%@page import="com.stone.springmvc.member.common.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	boolean isLogin = (boolean) request.getAttribute("isLogin");
	Member member = (Member)request.getAttribute("member");
	int no = (int)session.getAttribute("userNo");
	String name = (String)session.getAttribute("userName");

%>
<!DOCTYPE html>

<html>

<style>

* {
	margin: 0;
	padding: 0;
	color: #black;
	text-decoration: none;
	box-sizing: border-box;
	font-family: Noto Sans KR, Apple SD Gothic Neo, sans-serif;
}

body {
	color: #333;
	font-family: "notokrR", Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움",
		sans-serif;
	font-size: 14px;
	line-height: 1.4;
	letter-spacing: -0.5px;
}

div {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.logo {
	text-align: left;
}

#logo {
	float: left;
	width: 20%;
}

#logo a {
	display: block;
	width: 50%;
	height: auto;
	text-align: center;
}

#logo a img {
	width: 60%;
}
/* header */
li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.clear_fix:after {
	display: block;
	content: '';
	clear: both;
}

header {
	width: 100%;
	height: 100px;
	padding: 0px 0;
	background: black;
}

.navBox {
	width: 95%;
	height: 100%;
	margin: 0 auto;
}

#h_nav {
	float: left;
	width: 80%;
	margin-top: 0px;
}

#h_nav .nav1 {
	width: 10%;
	position: relative;
	float: left;
	text-align: center;
}

#h_nav .nav1 h3 {
	margin-top: 25px;
	line-height: 50px;
	color: #fff;
	cursor: pointer;
}

#h_nav .nav2 {
	position: absolute;
	width: 100%;
	padding: 20px 0;
	background: black;
	opacity: 0.8; /*sub메뉴바투명도*/
}

#h_nav .nav2 li, #h_nav .nav2 li a {
	color: #fff;
	line-height: 30px;
	font-size: 0.7em;
	cursor: pointer;
}
/* header 끝*/


.body-wrapper {
	min-height: 100%;
	position: relative;
	background: transparent;
}

.body-content {
	margin-top: 0px;
}




/* leave 시작*/

#leave-div0 {
	width: 800px;
	text-align: center;
	margin-top: 30px;
	margin-bottom: 50px;
	margin-left: 20%;
	height: 20px;
}

#leave-div {
	width: 800px;
	text-align: center;
	margin-bottom: 30px;
	margin-left: 20%;
	height: 20px;
}

#leave-div1 {
	width: 800px;
	text-align: left;
	margin-bottom: 100px;
	margin-left: 20%;
	margin-top: 5px;
	height: 200px;
	border: 1px solid #0d0d0d;
}

#leave-div2 {
	width: 800px;
	text-align: center;
	margin-bottom: 150px;
	margin-left: 20%;
	margin-top: 5px;
	height: 300px;
}

#leave-table {
	width: 800px;
	margin: 10px;
	border-spacing: 5px 20px;
}

#leavebtn1 {
	width: 200px;
	padding: 10px 10px;
	margin: 10px;
	border: none;
	cursor: pointer;
	background-color: white;
	color: black;
	height: 50px;
	font-size: 15px;
	margin-bottom: 5px;
	margin-right: 20px;
	border: 1px solid black;
}

#leavebtn2{
	width: 200px;
	padding: 10px 10px;
	margin: 10px;
	border: none;
	cursor: pointer;
	background-color: black;
	color: white;
	height: 50px;
	font-size: 15px;
	margin-bottom: 5px;
	margin-right: 20px;
}


/* leave 끝 */




/* footer */
.main-footer {
	position: absolute;
	width: 100%;
	height: 400px;
	font-size: 12px;
	font-weight: 200;
	color: #fff;
	background: black;
}

.main-footer_inner {
	width: 100%;
	max-width: 1565px;
	padding: 40px 0 30px 76px;
}

.main-footer_left {
	float: left;
}

.main-footer_title {
	font-size: 27px;
	font-weight: 700;
	margin-bottom: 20px;
}

.main-footer_company {
	font-size: 15px;
}

.main-footer_copy {
	margin-top: 20px;
	color: #787878;
}

em {
	font-style: normal;
	text-decoration: none;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.main-footer_right {
	float: right;
}

.footer-btns {
	padding-top:20px;
	padding-left:90px;
}

.btn-footer {
	cursor:pointer;
	border: none;
	background: black;
	position: relative;
	display: inline-block;
	min-width: 70px;
	height: 36px;
	color: #fff;
	vertical-align: middle;
	margin-left: 11px;
	padding: 0 6px;
	font-weight: 300;
	text-align: center;
}

.main-footer_customer {
	text-align: right;
	font-size: 13px;
	margin-top: 50px;
	padding-right: 50px;
}

.label {
	font-size:17px;
	font-weight: 500;
	padding-right: 6px;
}
.label2 {
	font-size:19px;
	font-weight: 600;
	padding-right: 6px;
}
.label3 {
	font-size:18px;
	font-weight: 500;
	padding-right: 6px;
}
input[type="email"] {
    width: 342px;
    height: 14px;
    padding: 12px 0 14px 20px;
    font-size: 14px;
    border: 0;
    line-height: 14px;
    vertical-align: middle;
}
/* footer 끝 */
</style>

<head>
<meta charset="UTF-8">

<title>회원 탈퇴</title>
</head>
<body>

<div class="body-wrapper">
		<div class="base-main" id="baseMain">
			<script
				src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

			<script>
				$(document).ready(function() {
					/* header */
					$("ul.nav2").hide();
					$('#h_nav .nav1').hover(function() {
						$(this).find(".nav2").slideDown();
					}, function() {
						$('.nav2').slideUp();
					});
				});
			</script>

			<header>
				<div class="navBox">
					<div id="logo">
						<a href="/main"> <img alt="로고" src="img/수정로고.png">
						</a>
					</div>
					<nav id="h_nav">

						<ul class="clear_fix">
							<li class="nav1">
								<h3>제품</h3>
								<ul class="nav2">
									<li><a href="/productlist/1">배스</a></li>
									<li><a href="/1_2">샤워</a></li>
									<li><a href="/1_2">바디</a></li>
									<li><a href="/1_2">페이스</a></li>
									<li><a href="/1_2">헤어</a></li>
								</ul>
							</li>
							<li class="nav1" style="margin-right: 20px">
								<h3>러쉬 소개</h3>
							</li>
							<li class="nav1">
								<h3>매장 안내</h3>
							</li>
							<li class="nav1">
								<h3>스파</h3>
							</li>
							<li class="nav1">
								<h3>이벤트</h3>
							</li>
							<li class="nav1" style="margin-left: 50px; margin-top: 39px;">
								<a href="/search"> <img alt="검색" src="img/search_icon.png">
							</a>
							</li>
							<li class="nav1" style="margin-left: -30px; margin-top: 39px;">
								<a href="/cartlist"><img alt="장바구니" src="img/icon_cart.png">
							</a>
							</li>
							<li class="nav1" style="margin-left: -30px; margin-top: 39px;">
								<a href="/mypage"><img alt="마이페이지" src="img/icon_mypage.png">
							</a>
								<ul class="nav2">
									<li>
										<%if (isLogin) {%> 
										<a href="/logout">로그아웃</a> 
										<%} else {%> <a href="/login">로그인</a>
										<%}%>
									</li>
									<li><a href="join">회원가입</a></li>
									<li>고객센터</li>
								</ul>
							</li>

						</ul>
					</nav>
				</div>
			</header>

		</div>
	</div>



<!-- 탈퇴 구간 -->
	<div class="body-content">

	</div>
	
<!-- 	-- -->
		<div id="leave-div0">
		
		</div>
		
		<p>
			<b style="margin-left:20%; font-size: 20px;">회원탈퇴</b>
		</p>
		<div id="leave-div">
			<hr style="border: solid 1px #000000;">
				<p style="margin-top: 10px; margin-bottom: 10px;">
				</p>
		</div>
		
		
		<p>
			<b style="margin-left:20%; font-size: 18px;">01.회원탈퇴 안내 </b>
		</p>
		<div id="leave-div1">
			<p style="margin: 10px;">
			<b style="font-size: 13px;">
			워시코리아 탈퇴 안내<br><br>
			불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.<br><br>
			■ 아울러 회원 탈퇴시의 아래의 사항을 숙지하시기 바랍니다.<br>
			1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한<br>
			&nbsp; 고객정보 보호정책에따라 관리 됩니다.<br>
			2. 탈퇴 시 회원님께서 보유하셨던 데이터는 삭제됩니다.
			</b>
			</p>
		</div>
				
		<p>
			<b style="margin-left:20%; font-size: 18px;">02.회원탈퇴 하기</b>
		</p>
		<div id="leave-div2">
			<hr>
			<form action="/leave" name="leaveForm" method="post">
				<table id="leave-table">
				<colgroup>
					<col style="width: 100px;"> 
				</colgroup>
	                <tr>
		                <th style="font-size: 15px;">회원 이름</th>
						<td style="text-align: left;">&nbsp; <b><%=name%>님</b></td>
	                </tr>
					<tr>
	                	<th style="font-size: 15px;">탈퇴사유 </th>
	              		<td>
	              			<p style="text-align: left;">
				              	<b style="margin-left: 10px;">
				              	<input type="checkbox" style="margin: 3px;">고객서비스(상담,포장 등)불만
				              	</b>
				              	<b style="margin-left: 130px;">
				              	<input type="checkbox" style="margin: 3px;">배송불만
				              	</b>
			              	</p>
			              	<p style="text-align: left;">
			              		<b style="margin-left: 10px;">
				              	<input type="checkbox" style="margin: 3px;">교환/환불/반품 불만
				              	</b>
				              	<b style="margin-left: 185px;">
				              	<input type="checkbox" style="margin: 3px;">방문 빈도가 낮음
				              	</b>
			              	</p>
			              	<p style="text-align: left;">
			              		<b style="margin-left: 10px;">
				              	<input type="checkbox" style="margin: 3px;">상품가격 불만
				              	</b>
				              		<b style="margin-left: 223px;">
				              	<input type="checkbox" style="margin: 3px;">개인 정보 유출 우려
				              	</b>
			              	</p>
	              		</td>
	                </tr>
					 <tr>
		                <th style="font-size: 15px;">남기실 말씀</th>
						<td>
							<div style="text-align: left;">
							<textarea rows="5" cols="30" style="width: 600px; text-align: left; margin-left: 10px;"></textarea>
							</div>
						</td>
	                </tr>
					<tr>
	             </table>
	             
					<input type="hidden" name="state" value="2" readonly="readonly">
					<input type="hidden" name="no" value="<%=no%>" readonly="readonly">
					<button type="button" value="이전으로" id="leavebtn1" onclick="location.href='/mypage'">이전으로</button>	
					<button type="button" onclick="successAlert()" id="leavebtn2">탈퇴하기</button>
			</form>
		</div>
			
<script type="text/javascript">
function successAlert() {
	alert("탈퇴가 완료되었습니다.");
	setTimeout(function(){
		leaveForm.submit();
	}, 2000)
	
}
</script>
		
	
<!-- 탈퇴 구간 종료 -->
	


	<div class="main-footer" style="z-index: 5;">
		<div class="main-footer_inner">
			<div class="main-footer_left">
				<div class="main-footer_title">
					<img alt="로고" src="img/logo.png">
				</div>
				<div class="main-footer_company">

					<p><span class="label">고객센터</span> 1644-2357</p>
					<p>webmaster@lush.co.kr</p>
					<p><span class="label">상담전화</span> 13 : 00 - 16 : 00(평일)</p>
					<p><span class="label">상담톡</span> 10 : 00 - 16 : 00(평일)</p>
					<br>

					<p><span class="label">기업선물</span> 070-4713-8543</p>
					<p>order@lush.co.kr</p>
					<p><span class="label">상담전화</span> 13 : 00 - 16 : 00(평일)</p>

				</div>
			</div>
			<div class="main-footer_right">
				<div class="footer-btns">
					<button type="button" class="btn-footer">
						<span>스카우트</span>
					</button>
					<button type="button" class="btn-footer">
						<span>회사소개</span>
					</button>
					<button type="button" class="btn-footer">
						<span style="font-weight: bold;">개인정보처리방침</span>
					</button>
					<button type="button" class="btn-footer">
						<span>영상정보관리지침</span>
					</button>
					<button type="button" class="btn-footer">
						<span>이용약관</span>
					</button>
					<button type="button" class="btn-footer">
						<span>고객센터</span>
					</button>
				</div>
				<div class="main-footer_customer">
					<p>
						<span class="label2">매주 금요일 오후, 구독자님을 위한 제품과 브랜드 이야기를 전해드립니다.</span><br>
						<span class="label3">구독은 언제든지 해지하실 수 있습니다.</span>
					</p><br>
					<p>
					<input type="email" placeholder="이메일 주소를 입력해 주세요." maxlength="50"> 
					<input type="button" value="구독하기" style="color:#fff; cursor: pointer; text-indent: 0px; background-color: #000;">
					</p>
					<br>
					<br>
					<br>
					<span class="main-footer_copy">서울특별시 서초구 서운로 138(서초동아타워) 6층&nbsp; | &nbsp;사이트 운영자 : 주식회사 러쉬코리아 &nbsp; | &nbsp; 대표이사 : 우미령</span><br>
					<span class="main-footer_copy">사업자 등록번호 : 201-81-77964 사업자정보확인&nbsp; | &nbsp;통신판매업 신고번호 : 2012-서울서초-0647 &nbsp; | &nbsp; 개인정보보호책임자 : 신상훈</span><br><br>
					<span class="main-footer_copy">COPYRIGHT ⓒ LUSHKOREA CO.LTD. ALL RIGHTS RESERVED</span>
				</div>
			</div>
		</div>
	</div>


</body>
</html>