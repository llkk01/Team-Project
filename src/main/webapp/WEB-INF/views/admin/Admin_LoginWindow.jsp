<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/style/admin_header.css">
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
   font-family: "notokrR", Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움",
      sans-serif;
   font-size: 14px;
   line-height: 1.4;
   letter-spacing: -0.5px;
   background-color: #0d0d0d;
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
/* login 시작*/

.login-content{
   margin-top: 80px;
   text-align: center;
   margin-bottom: 100px;

}

#ullilogin{
   list-style: none;
   color: white;
}

#lilogin{
   display: inline;
   text-align: center;
   color: white;
}

#alogin{
   text-decoration: underline;
   color: white;
   margin: 20px;
}

b:hover {
  color: #666666;
}

.login-container{
   padding-top: 30px;
}

input[type="text"],input[type="password"] {
   width: 20%;
   padding: 5px 10px;
   margin: 10px;
   display: inline-block;
   box-sizing: border-box;
   border-color: black;
   text-align: center;
}

#checkbox-login{
   text-align: left;
   padding-left: 40%;
   color: white;
}

#loginbtn{
   width: 20%;
   padding: 10px 10px;
   margin: 10px;
   border: none;
   cursor: pointer;
   background-color: black;
   color: white;
   font-size: 15px;
   margin-bottom: 5px;
}

#loginbtn:hover {
   opacity: 0.8;
}

#ullilogin-join{
   list-style: none;
}

#lilogin-join{
   display: inline;
   text-align: center;
}

#alogin-join{
   text-decoration: none;
   color: #666666;
   text-align: center;
   font-size: 8px;
   margin: 5px;
   
}

#alogin-join:hover {
   opacity: 0.8;
}
/* login 끝 */
</style>

<head>
<meta charset="UTF-8">
<title>login</title>
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
						<a href="/admin_main"> <img alt="로고" src="/img/logo.png">
						</a>
					</div>
					<nav id="h_nav">

						<ul class="clear_fix">
							<li class="nav1">
								<h3><a href="/productadd">제품등록</a></h3>
								<ul class="nav2">
									<li><a href="/admin_productlist/1">배스</a></li>
									<li><a href="/admin_productlist/2">샤워</a></li>
									<li><a href="/admin_productlist/3">바디</a></li>
									<li><a href="/admin_productlist/4">페이스</a></li>
									<li><a href="/admin_productlist/5">헤어</a></li>
								</ul>
							</li>
							<li class="nav1" style="margin-right: 20px">
								<h3><a href="/adminnoticelist">공지 사항</a></h3>
							</li>
							<li class="nav1">
								<h3><a href="/memberList">회원 관리</a></h3>
							</li>
							<li class="nav1">
								<h3><a href="/admin_reviewlist">리뷰 관리</a></h3>
							</li>
							<li class="nav1">
								<h3>이벤트 관리</h3>
							</li>
							<li class="nav1" style="margin-left: 50px; margin-top: 39px;">
								<a href="#"> <img alt="검색" src="/img/search_icon.png">
							</a>
							</li>
							<li class="nav1" style="margin-left: -30px; margin-top: 39px;">
								<a href="#"><img alt="장바구니" src="/img/icon_cart.png">
							</a>
							</li>
							<li class="nav1" style="margin-left: -30px; margin-top: 39px;">
								<img alt="마이페이지" src="/img/icon_mypage.png">
								<ul class="nav2">
										<li><a href="/adminlogin">로그인</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
	</div>
<!-- 로그인 구간 -->
   <div class="body-content">

   </div>
   
   
   <div class="login-content">
      <h2 style="padding-bottom: 40px; color: white;">관리자 로그인</h2>
      
      <ul id="ullogin">
         <li id="lilogin"><a href="/login" id="alogin" style="color: #808080"><b>회원</b></a></li>
         <li id="lilogin"><a href="/adminlogin" id="alogin" style="color: white"><b>관리자</b></a></li>
      </ul>
      <form action="/adminlogin" method="post" >
      <div class="login-container">
         <input type="text" placeholder="아이디" id="id" name="id" required><br>
         <input type="password" placeholder="비밀번호" id="password" name="password" required><Br>
            <div id="checkbox-login">
            <input type="checkbox" name="remember"> 아이디저장 <br>
            </div>
          <button type="submit" id="loginbtn">로그인</button>
       
       <ul id="ullogin-join">
         <li id="lilogin-join"><a href="/login" id="alogin-join" ><b>아이디 찾기</b></a></li>
         <li id="lilogin-join"><a href="/login" id="alogin-join"><b>비밀번호 찾기</b></a></li>
      </ul>
      </div>
      </form>
   </div>
<!-- 로그인 구간 종료 -->
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