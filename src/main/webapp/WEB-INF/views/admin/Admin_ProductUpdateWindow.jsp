<%@page import="com.stone.springmvc.product.common.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% Product product = (Product)request.getAttribute("product"); %>
<%boolean isLogin = (boolean) request.getAttribute("isLogin"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=product.getName() %></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/style/admin_header.css">
<link rel="stylesheet" type="text/css" href="/style/footer.css">
<script type="text/javascript">
function updateProduct() {
       updateForm.submit();
} 


</script>
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
/* 중간시작 */
.body-wrapper {min-height: 100%;position: relative;background: transparent;}
.body-content {width: 100%;height: 100%; margin-top: 0px; margin-bottom:50px;}
/*대표,제품정보변경*/
.body-content .box_jh{margin-top: 50px; margin-left: 13%;}
/* 왼쪽대표사진 */
.body-content .box_jh .jh1{text-align: center; float: left;width: 600px}
/* 대표사진 오른쪽 제품정보 */
.body-content .box_jh .jh2{float: left; margin-top: 50px;line-height: 35px;}
.body-content .box_jh .jh2 .span_jh{float: left; width: 75px;}
.body-content .box_jh .jh2 .input_jh{width: 230px;}

#cart-btndiv { text-align: center;}

#cart-gobtn {
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
/* 중간끝 */
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
										<%if (isLogin) {%> 
										<li><a href="/adminlogout">로그아웃</a></li>
										<%} else {%> 
										<li><a href="/adminlogin">로그인</a></li>
										<%}%>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
	</div>
	<div class="body-content">
		<div class="box_jh">
			<div class="jh1">
				<img width="350px" height="350px" src="/upload/items/${product.no}/<%=product.getAttachs().get(0).getName()%>"/><br>
			</div>
		<div class="jh2">
			<form action="/productupdate" name="updateForm" enctype="multipart/form-data" method="post" >
				<p><span class="span_jh">제품명: </span><input type="text" class="input_jh" name="name" value="${product.name}"/></p>
				<p><span class="span_jh">제품설명: </span><textarea class="text_jh input_jh" name="detail" cols=30 rows=5>${product.detail}</textarea></p>
				<p><span class="span_jh">제품가격: </span><input type="text" class="input_jh"  name="price" value="${product.price}"/></p>
				<p><span class="span_jh">잔여수량: </span><input type="text" class="input_jh"  name="quan" value="${product.quan}"/></p>
				<p><span class="span_jh">품절상태: </span><input type="text" class="input_jh"  name="state" value="${product.state}"/></p>
				<p>(1:판매가능, 2:일시품절, 3:판매중지)</p>
				<div id="cart-btndiv">
				<button type="button" id="cart-gobtn" onclick="updateProduct()">수정</button>
				</div>
				<!-- <input type="submit" value="수정"/></p> -->
				<input type="hidden" name="no" value="${product.no}">
				<input type="hidden" name="num" value="${product.num}">
			</form>
		</div>
	</div>
		<img src="/upload/items/<%=product.getNo() %>/<%=product.getAttachs().get(1).getName()%>"/> 
		<br>
		<br>
		<br>
		<br>
		<br>
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