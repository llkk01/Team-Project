<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%boolean isLogin = (boolean) request.getAttribute("isLogin"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link rel="stylesheet" type="text/css" href="/style/admin_header.css">
<link rel="stylesheet" type="text/css" href="/style/footer.css">

<script type="text/javascript">
function addAttach()
{
   var 첨부리스트=document.querySelector("#attachlist");//1
   //마지막 파일이 선택이 안되어 있는 경우 첨부 무효화
   if(첨부리스트.childNodes.length>0 && 
     //첨부리스트내의 li들=>첨부리스트.childNodes      
     //마지막 li의 인덱스(0부터의 순서)=>첨부리스트.childNodes.length-1
     //마지막 li =>첨부리스트.childNodes[첨부리스트.childNodes.length-1]     
     //li내 input type=>"file"인 요소=첨부리스트.childNodes[첨부리스트.childNodes.length-1].childNodes[0]
     //type="file"인 요소의 값=>첨부리스트.childNodes[첨부리스트.childNodes.length-1].childNodes[0].value
       첨부리스트.childNodes[첨부리스트.childNodes.length-1].childNodes[0].value==""){
      return 0;
   }
   var li        = document.createElement("li");//2
   var fileInput = document.createElement("input");//3
   fileInput.type="file";
   var btnDelete = document.createElement("input");//4
   btnDelete.type="button";
   btnDelete.value="삭제";
   btnDelete.containerLi=li;//삭제버튼에 삭제버튼을 가진 li를 containerLi란 이름으로 기억시킴
   btnDelete.addEventListener("click",function(event){//이벤트에 대한 모든 정보를 가진 객체를 제공함 현재는 event라고 이름 붙임
      //event.target=>이벤트가 발생한 요소
      //btnDelete 버튼 => event.target
      var 버튼을가진li=event.target.containerLi;//삭제버튼이  containerLi란 이름으로 기억하고 있는 
                                              //삭제버튼을 가진 li    
      var 첨부리스트ul=버튼을가진li.parentNode;//삭제버튼을 가진 li의 부모는 첨부리스트ul이다..
      첨부리스트ul.removeChild(버튼을가진li);//   첨부리스트ul에서 삭제   버튼을가진li를 제거함.
   });
   li.appendChild(fileInput);//5
   li.appendChild(btnDelete);//6
   첨부리스트.appendChild(li);//7   
}

function addProducts(){
   var 첨부리스트=document.querySelector("#attachlist");
   for(var idx=0; idx<첨부리스트.childNodes.length; idx++){
      var fileInput = 첨부리스트.childNodes[idx].childNodes[0];
      fileInput.name="attachFiles["+idx+"]";
   }   
   return true;   
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
.body-content {width: 100%;height: auto; margin-top: 0px; display: inline-block; }
/*대표,제품정보변경*/
.body-content .box_jh{padding: 50px; float: left;margin: 0, auto;margin-left: 400px;line-height: 30px;}
.body-content .box_jh .label_jh{float: left; width: 100px;}
/* 중간끝 */
input[type=submit]{
background-color: black;
   border: solid 1px black;
   color: white;
   padding: 10px 30px;
   text-align: right;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   margin: 4px -3px;
   cursor: pointer;
   float:right;
   margin-right:150px;
}
input[type=button]{
border:1px solid black;
padding:5px;
border-radius:1px;
}
input[type=text]{
border-bottom:1px solid black;
border-top:0px;
border-left:0px;
border-right:0px;
}
h1{
margin-top:30px;
text-align:center;
}
.reviewetc{
text-align:center;
margin-left:680px;
}
label{
font-weight:bold;
font-size:15px;
}
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

    <h1>ADD PRODUCT</h1><br>
    <span class="reviewetc">워시의 제품을 등록해 주세요!</span><br><br>
  

<div class="box_jh">
<form onsubmit="return addProducts()" action="/productadd" enctype="multipart/form-data" method="post">
<label for="name" class="label_jh">제품명</label><input type="text" id="name" name="name"/><br>
<label for="detail" class="label_jh">제품설명</label><textarea id="detail" name="detail" cols=50 rows=3 placeholder="#간단히 #설명해 #주세요"></textarea><br>
<label for="price" class="label_jh">제품가격</label><input type="text" id="price" name="price" placeholder="단위는 \ 입니다"/><br>
<label for="num" class="label_jh">제품유형</label>
<select id="num" name="num">
 <option value="">--제품 유형선택--</option>
 <option value="1">배스</option>
 <option value="2">샤워</option>
 <option value="3">바디</option>
 <option value="4">페이스</option>
 <option value="5">헤어</option>
</select>
<br>
<label for="quan" class="label_jh">수량</label><input type="text" id="quan" name="quan" placeholder="수량을 확인해 주세요"/><br>
<input type="hidden" name="state" value="1"/><br>
<label class="label_jh">첨부</label><br>
<ul id="attachlist" ></ul>
<input type="button" onclick="addAttach()" value="첨부추가"><br>
<input type="submit" value="등록" />
</form>
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