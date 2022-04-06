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



/* info 시작 */

.info-title-div {
   height: 500px;
    text-align: center;
    color: #fff;
    background: url(img/info1.jpg) no-repeat 50%;
    background-size: cover;
}

.info-title-text {
    padding-top: 179px;
    text-align: center;
    color: #fff;
    font-size: 68px;
    font-family: 'notokrB';
    letter-spacing: 0.5em;
    text-indent: 0.5em;
    color: #fff;
}

.info-title-p {
    margin-top: 10px;
    font-size: 26px;
    font-family: "notokrL";
    letter-spacing: 0.2em;
    text-indent: 0.2em;
}

.info-title-div2 {
   text-align: center;
}

/* info 끝 */




</style>


<head>
<meta charset="UTF-8">
<title>WASH Info</title>
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



<!-- 러쉬소개 구간 시작 -->
      <div class="body-content">
   
      </div>

      <div class="info-title-div">
         <h2 class="info-title-text">워쉬 소개</h2>
         <p class="info-title-p">
            영국 프레쉬 핸드메이드 코스메틱 브랜드
         </p>
      </div>
      
      <div class="info-title-div2">
         <h3 style="margin: 100px;">
                “ 워쉬는 자연에서 얻은 신선한 재료와 동물실험을 하지 않는 정직한 재료를 사용하여 모든 제품을 손으로 만듭니다. <br>
             더불어 공정 거래, 인권 보호, 포장 최소화 등 다양한 캠페인 활동을 통해 기업 윤리와 신념을 알리고 있습니다. ”
         </h3>
         <img alt="info2" src="img/info2.jpg">
      </div>

<!-- 러쉬소개 구간 종료 -->
   



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