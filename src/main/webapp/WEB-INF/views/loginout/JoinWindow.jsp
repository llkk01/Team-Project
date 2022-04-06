<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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



/* Join 시작*/

.join-content {
   margin-top: 80px;
   text-align: center;
   margin-bottom: 100px;
}

#join-info-div {
   width: 300px;
   text-align: center;
   margin-left: 40%
}

#pfont1 {
   width: 1000px;
   margin-top: 50px;
   text-align: left;
   font-weight: bolder;
   margin-left: 30%;
   font-size: 20px;
   color: black;
}

#hrs1 {
   border: solid 1px #000000;
   width: 700px;
   margin-left: 30%;
   margin-bottom: 10px;
}

#join-table {
   width: 1000px;
   margin-left: 30%;
   margin-right: 30px;
   text-align: left;
}

table tr th {
   width: 100px;
}

#id,#post {
   width: 215px;
}

#email1{
   width: 140px;
}

#email2 {
   height: 30px;
   font-size: 15px;
   margin: 10px;
}


input[type="text"],input[type="password"] {
   width: 300px;
   padding: 5px 10px;
   margin: 10px;
   display: inline;
   text-align: left;
}

input[type="radio"] {
   width: 60px;
   margin: 10px;
   margin-left: 15px;
   text-align: center;
}


#hrs2 {
   width: 700px;
   margin-left: 30%;
   margin-bottom: 10px;
}


#idbtn {
   width: 70px;
   background-color: white;
   color: black;
   height: 30px;
   font-size: 10px;
}

#postbtn {
   width: 70px;
   background-color: white;
   color: black;
   height: 30px;
   font-size: 10px;
}

#joinbtn {
   width: 300px;
   padding: 10px 10px;
   margin: 10px;
   border: none;
   cursor: pointer;
   background-color: black;
   color: white;
   height: 50px;
   font-size: 15px;
   margin-bottom: 5px;
   margin-right: 30px;
}


#joinbtn:hover {
   opacity: 0.8;
}

/* Join 끝 */








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
<title>Join</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

   //우편번호 조회(다음에서 제공하는 src활용)
   function postReference(){
      new daum.Postcode({
           oncomplete: function(data) {
               document.querySelector("#post").value=data.zonecode;
               document.querySelector("#address").value=data.roadAddress;
               document.querySelector("#detailaddress").focus();
           }
       }).open();
   }
   
   //id 중복검사
   function idCheck() {
      document.querySelector("#id").value="";
      window.open("/idcheck","","width=600,height=400");
   }
   
   //id 받기
   function ids(id) {
      document.querySelector("#id").value=id;
   }
   
   
   /* onsubmit true/false에 따라 submit버튼 동작여부 이벤트 발생(name,id,password 필수입력 이벤트) */
   //회원등록()
   function joins() {
      
      let name = document.querySelector("#name").value;
      if(name.trim()==""){
         alert("성명을 입력해주세요.");
         return false; //false > submit 실행안함
      }
      
      let id = document.querySelector("#id").value;
      if(id.trim()==""){
         alert("아이디를 입력해주세요.");
         return false; //false > submit 실행안함
      }
      
      let password = document.querySelector("#password").value;
      if(password.trim()==""){
         alert("비밀번호를 입력해주세요.");
         return false; //false > submit 실행안함
      }
      
      let password2 = document.querySelector("#password2").value;
      if(password2.trim()==""){
         alert("위에 입력한 비밀번호를 다시 입력해주세요.");
         return false; //false > submit 실행안함
      }
      
      if(password!=password2){
         alert("비밀번호는 동일해야 합니다.");
         return false; //false > submit 실행안함
      }
      
      let tel = document.querySelector("#tel").value;
      if(tel.trim()==""){
         alert("전화번호를 입력해주세요.");
         return false; //false > submit 실행안함
      }
      
      //email 하나로 합치기
      let email1 = document.querySelector("#email1").value;
      let email2 = document.querySelector("#email2").value;
      let email = document.querySelector("#email");
      email.value=email1+"@"+email2;
      
      
      return true; //submit 동작
   }

</script>

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
                               <a href="/login">로그인</a>
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




   <div class="body-content">

   </div> 
   
   
   
<!-- 회원가입 구간 시작-->
   <div class="join-content" >
      <div id="join-info-div">
         <h1 align="center" style="color: black; margin-bottom: 15px;">JOIN US</h1>
         <b style="font-size: 12px; color: black;">정보입력</b>&nbsp; > &nbsp;<b style="font-size: 12px; color: #666666;">가입완료</b>
      </div> 
      
      <div id="pfont1">
         기본정보 <b style="font-size: 13px; margin-left: 360px;">• 표시는 반드시 입력하셔야 하는 항목입니다.</b>
      </div>
         
         <hr id="hrs1">
         <form action="/join" method="post" onsubmit="return joins()">
            <table id="join-table">
                   <tr>
                   <th>• 이름 </th>
               <td><input type="text" name="name" id="name" /></td>
                   </tr>
               <tr>
                   <th>• 아이디 </th>
                    <td><input type="text" name="id" id="id" readonly="readonly"/>
                     <input type="button" id="idbtn" onclick="idCheck()" value="ID중복검사" /></td>
                   </tr>
                   <tr>
               <th>• 비밀번호</th>
                   <td><input type="password" name="password" id="password" /></td>
                   </tr>
                   <tr>
               <th>• 비밀번호 확인 </th>
                   <td> <input type="password" name="password2" id="password2" /> </td>
                   </tr>               
                   <tr>
               <th>• 전화번호</th>
                   <td><input type="text" name="tel" id="tel" placeholder="-없이 입력하세요." />
                     <input type="checkbox" name="televent" style="margin: 3px;">정보/이벤트 SMS 수신에 동의합니다.<br>
                   </td>
                   </tr>                
                   <tr>
               <th>생년월일</th>
                    <td><input type="text" name="date" id="date" /> </td>
                   </tr>
                   <tr>
               <th>성별</th>
               <td><input type="radio" name="gender" id="gender" value="F" />
                   <label for="gender">여자 &nbsp; &nbsp; &nbsp;</label>
               <input type="radio" name="gender" id="gender" value="M" />
                  <label for="gender">&nbsp;&nbsp;남자</label></td>
               </tr>
                   <tr>
               <th>우편번호</th>
                   <td><input type="text" name="post" id="post" />
                    <input type="button" id="postbtn" onclick="postReference()" value="우편번호검색" /></td>
                   </tr>
                   <tr> 
               <th>주 소</th> 
                   <td><input type="text" name="address" id="address" size=30 /></td>
                   </tr> 
                   <tr> 
               <th>상세 주소 </th> 
                   <td><input type="text" name="detailaddress" id="detailaddress" /></td>
               </tr>
                   <tr> 
               <th>이메일</th> 
                   <td><input type="text" id="email1" />&nbsp;<b style="font-size: 20px;">@</b> &nbsp;
                     <select id="email2">
                     <option value="gmail.com">gmail.com</option>
                     <option value="naver.com">naver.com</option>
                     <option value="daun.net">daun.net</option>
                     <option value="hanmail.net">hanmail.net</option>
                     <option value="nate.com">nate.com</option>
                     <option value="직접입력">직접입력</option>
                     </select>
                  <input type="checkbox" name="emailevent" style="margin: 3px;">정보/이벤트 메일 수신에 동의합니다.<br>      
               </td>
               </tr>

         </table>
               <hr id="hrs2">   
               <input type="hidden" name="email" id="email"><br>
               <input type="submit" id="joinbtn" value="회원가입">
         </form>
      </div>
<!-- 회원가입 구간 종료 -->
   



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