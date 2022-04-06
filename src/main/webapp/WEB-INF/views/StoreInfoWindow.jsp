<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="style/header.css">
<link rel="stylesheet" type="text/css" href="style/footer.css">
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



.body-wrapper {
	min-height: 100%;
	position: relative;
	background: transparent;
}

.body-content {
	margin-top: 0px;
}


/* StoreInfo 시작 */

#storediv {
	margin-top: 50px;
	height: 1000px;
}

#storediv1 {
	width: 300px;
	text-align: center;
	margin-left: 40%;
}

#storediv2 {
	margin-top: 100px;
}

#storediv3 {
	margin-top: 500px;
}


/* StoreInfo 끝 */







</style>


<head>
<meta charset="UTF-8">
<title>Store</title>
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
						<a href="/main"> <img alt="로고" src="img/logo.png">
						</a>
					</div>
					<nav id="h_nav">

						<ul class="clear_fix">
							<li class="nav1">
								<h3>제품</h3>
								<ul class="nav2">
									<li><a href="/productlist/1">배스</a></li>
									<li><a href="/productlist/2">샤워</a></li>
									<li><a href="/productlist/3">바디</a></li>
									<li><a href="/productlist/4">페이스</a></li>
									<li><a href="/productlist/5">헤어</a></li>
								</ul>
							</li>
				    <li class="nav1" style="margin-right: 20px">
                        <h3>워시 소개</h3>
                     </li>
        			  <li class="nav1">
								<h3><a href="/store">매장 안내</a></h3>
							</li>
							<li class="nav1">
								<h3><a href="/noticelist">공지사항</a></h3>
							</li>
							<li class="nav1">
								<h3><a href="/event">이벤트</a></h3>
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
										<a href="/logout">로그아웃</a> 
									</li>
									<li>
										<a href="/productadd">상품등록</a>
									</li> 
									<li>
										<a href="join">회원가입</a>
									</li>
									<li>고객센터</li>
								</ul>
							</li>

						</ul>
					</nav>
				</div>
			</header>

		</div>
	</div>



<!-- 매장안내 구간 시작 -->
		<div class="body-content">
	
		</div>
		
		
		
		<div id="storediv">
			<div id="storediv1">
				<h1 align="center" style="color: black; margin-bottom: 20px;">SHOP INFORMATION</h1>
				<b style="font-size: 12px; color: black; ">가까운 워시 매장에서 느끼는 향기로운 경험!</b>
			</div> 
			<div id="storediv2">
				<div style="margin-left: 150px; float: left;">
					<img alt="현대아울렛 송도점" src="img/1.jpg">
					<p style="text-align: center; margin-top: 10px;">현대아울렛 송도점</p>
				</div>
				<div style="margin-left: 50px; float: left;">
					<img alt="롯데백화점  영등포점" src="img/2.jpg">
					<p style="text-align: center; margin-top: 10px;">롯데백화점  영등포점</p>
				</div>
				<div style="margin-left: 50px; float: left;">
					<img alt="현대백화점 판교점" src="img/3.jpg">
					<p style="text-align: center; margin-top: 10px;">현대백화점 판교점</p>
				</div>
				<div style="margin-left: 50px; float: left;" >
					<img alt="신세계백화점 대전점" src="img/4.jpg">
					<p style="text-align: center; margin-top: 10px;">신세계백화점 대전점</p>
				</div>
			</div>	
			<div id="storediv3">
				<div style="margin-left: 150px; float: left;">
					<img alt="현대백화점 충청점" src="img/5.jpg">
					<p style="text-align: center; margin-top: 10px;">현대백화점 충청점</p>
				</div>
				<div style="margin-left: 50px; float: left;">
					<img alt="롯데백화점 수원점" src="img/6.jpg">
					<p style="text-align: center; margin-top: 10px;">롯데백화점 수원점</p>
				</div>
				<div style="margin-left: 50px; float: left;">
					<img alt="롯데백화점 김포공항점" src="img/7.jpg">
					<p style="text-align: center; margin-top: 10px;">롯데백화점 김포공항점</p>
				</div>
				<div style="margin-left: 50px; float: left;" >
					<img alt="AK플라자 분당점" src="img/8.jpg">
					<p style="text-align: center; margin-top: 10px;">AK플라자 분당점</p>
				</div>
			</div>
		</div>
	


<!-- 매장안내 구간 종료 -->
	



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