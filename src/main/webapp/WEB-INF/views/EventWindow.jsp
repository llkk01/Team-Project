<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워시코리아 EVENT</title>
<link rel="stylesheet" type="text/css" href="/style/header.css">
<link rel="stylesheet" type="text/css" href="/style/footer.css">
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
	font-family: "notokrR", Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움", sans-serif;
	font-size: 14px;line-height: 1.4;letter-spacing: -0.5px;
	}
div {margin: 0;padding: 0;box-sizing: border-box;}
.logo {text-align: left;}
#logo {float: left;width: 20%;}
#logo a {display: block;width: 50%;height: auto;text-align: center;}
#logo a img {width: 60%;}
.body-wrapper {min-height: 100%;position: relative;background: transparent;}
.body-content {width: 100%;height: 100%;margin: 0 auto;text-align:center;}
h2 {font-size:30px;font-family: 'HelveticaNeue-Heavy', 'notokrB';}
.section-header {margin-top: 75px;padding-bottom: 75px;}
.section-search {margin:0 10%; background-color:#F7F8F9;}
.event-content {float:center;margin:0 5%;}
.keyword {border:solid 1px #ccc;width:350px;height:40px;margin:25px 25px 25px 10px;}
select {border:solid 1px #ccc;width:100px;height:40px;}
button {background-color:black;color:white;border:solid 1px black;width:150px;height:40px;}
.event-sorting {display: inline;}
.t1{margin:40px auto 10px auto;font-weight:bold;} .t2{margin: 50px 10% 15px 10%;} .t3{margin: 100px 10% 250px 10%;}
sort1{padding:0 20 0 20px;}
.sort2{padding:0px 20px;color:#999999;border-left:solid 1px #999999;border-right:solid 1px #999999;}
.sort3{padding:0px 20px;color:#999999;} .pic { border-collapse: separate;border-spacing: 0 15 0 15px;} .pic2{padding:50 0 0 0px;float:left;text-align:center;margin:80 0px;}
.p1{font-size:20px;font-weight:bolder;} .p2{font-size:15px;font-weight:500;padding:20 0 20 0px;} .p3{color:#999999;}
.p4{font-size:20px;font-weight:bolder;float:left;} .p5{font-size:15px;font-weight:500;padding:20 0 20 0px;float:left;} .p6{color:#999999;float:left;}
</style>
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
						<a href="/main"> <img alt="로고" src="/img/logo.png">
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
								<h3><a href="/washinfo">워시 소개</a></h3>
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
								<a href="/search"> <img alt="검색" src="/img/search_icon.png">
							</a>
							</li>
							<li class="nav1" style="margin-left: -30px; margin-top: 39px;">
								<a href="/cartlist/<%=session.getAttribute("userNo")%>"><img alt="장바구니" src="/img/icon_cart.png">
							</a>
							</li>
							<li class="nav1" style="margin-left: -30px; margin-top: 39px;">
								<a href="/mypage"><img alt="마이페이지" src="/img/icon_mypage.png">
							</a>
								<ul class="nav2">
										
										<li><a href="/login">로그인</a></li>
										<li><a href="/adminlogin">관리자로그인</a></li>
										
									<li>회원가입</li>
									<li>고객센터</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</header>

		</div>
	</div>
	
	<div class="body-content">
	
		<div class="section-header"><h2>EVENT</h2></div>
		<div class="event-content">
		<div class="section-search">
			<form name="search" method="get">
				<select name="searchField">
					<option value="subject">제목</option>
					<option value="contents">내용</option>
				</select>
				<input type="text" class="keyword" name="search" size="40" required="required"/>
				<button>검색</button>
			</form>
		</div>
	
		<div class="event-sorting">
			<table class="t1"><tr>
			<td class="sort1">진행중 이벤트(4)</td><td class="sort2">선정자 발표</td><td class="sort3">종료된 이벤트(206)</td>
			</tr></table>
		</div>
		
		<div class=contents>
			<table class="t2">
				<tr class="pic"><td><img src="img/event0216.png" width="372" height="212"></td>
					<td><img src="img/event0215.png" width="372" height="212"></td>
					<td><img src="img/event0204.png" width="372" height="212"></td></tr>
				<tr class="p1"><td><p>좋은 건 더 크게</p></td><td><p>비밀스럽게 열리는 입욕의 세계</p></td><td><p>다운로드 러쉬 2월</p></td></tr>
				<tr class="p2"><td><p>대용량 보틀 론칭 이벤트</p></td><td><p>신규 배쓰 밤 5종 론칭</p></td><td><p>비밀스러운 입욕의 세계로 여러분을 초대합니다!</p></td></tr>
				<tr class="p3"><td><p>2022.02.16 00:00 - 2022.02.28 23:59</p></td><td><p>2022.02.15 00:00 - 2022.02.28 23:59</p></td><td><p>2022.02.04 00:00 - 2022.02.28 23:59</p></td></tr>
			</table>
			<table class="t3">
				<tr><td class="pic2" colspan="3"><img src="img/event0203.png" width="372" height="212"></td></tr>
				<tr class="p1"><td><p>핑크빛 향기로 물든 순간</p></td><td></td><td></td></tr>
				<tr class="p2"><td><p>2월 포토 리뷰 이벤트</p></td><td></td><td></td></tr>
				<tr class="p3"><td><p>2022.02.03 00:00 - 2022.02.28 23:59</p></td><td></td><td></td></tr>
			</table>
		</div>
		</div>
	</div>
	
	
	<div class="main-footer" style="z-index: 5;">
		<div class="main-footer_inner">
			<div class="main-footer_left">
				<div class="main-footer_title">
					<img alt="로고" src="/img/logo.png">
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