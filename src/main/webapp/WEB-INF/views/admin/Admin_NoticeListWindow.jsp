<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.stone.springmvc.boardnotice.common.Notice" %>
<%@ page import="com.stone.springmvc.member.common.Admin"%>
<% List<Notice> notices = (List<Notice>)request.getAttribute("notices");
   boolean isAdmin = (boolean) request.getAttribute("isAdmin");
   boolean isLogin = (boolean) request.getAttribute("isLogin");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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
   font-family: "notokrR", Malgun Gothic, "맑은 고딕", AppleGothic, Dotum, "돋움", sans-serif;
   font-size: 14px;
   line-height: 1.4;
   letter-spacing: -0.5px;
}

div {margin: 0;padding: 0;box-sizing: border-box;}

.logo {text-align: left;}

#logo {float: left;width: 20%;}

#logo a {display: block;width: 50%;height: auto;text-align: center;}

#logo a img {width: 60%;}

.body-wrapper {min-height: 100%;position: relative;background: transparent;}

.body-content {width:100%;text-align: center; margin: 10px;display: inline-block; padding: 60px; padding-bottom:150px;}

.container:after {content:"";disply:table;clear:both;}
.grid-container {width:100%;display: grid;grid-template-columns: 15% 85%;grid-template-rows: 80px 200px;gap: 10px;padding: 10px;}
.column {float:relative;padding:10px;}
.leftcolumn {width:30%;margin:10px;}
.rightcolumn{padding-left: 20px;width:70%;}

.bt {text-align:left;width:100,margin:4px -3px}
.button1 {background-color: black;border: solid 1px black;color: white;padding: 10px 30px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px -3px;cursor: pointer;}

.button2 {background-color: white;border: solid 1px #ccc;color: #939393;padding: 10px 30px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 4px -3px;cursor: pointer;}
#submit-bt {
   background-color: white;
   border: solid 1px #ccc;
   color: black;
   padding: 10px 30px;
   text-align: right;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   cursor: pointer;
   float:right;
}
#submit-bt2 {
   background-color: white;
   border: solid 1px #ccc;
   color: black;
   padding: 10px 30px;
   text-align: right;
   text-decoration: none;
   display: inline-block;
   font-size: 16px;
   cursor: pointer;

}
#line1 {border-top:solid 1px black;border-bottom: solid 1px #ccc;} #line2 {border-bottom: solid 1px #ccc;}
.w70 {width:250px; padding:10px}.w500 {text-align:left;width:1000px; padding:10px; color:black;}.w120 {width:120px; }.w100 {width:100px; }

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
   <div class="container">
      <c:choose>
      <c:when test="${empty notices}">
          <p>등록된 공지사항 없음</p>
                <% if(isAdmin){ %>
         <a href="/noticeadd" id="submit-bt2">등록</a>
         
      <% } %>
      </c:when>
      <c:otherwise>
   <div class="grid-container">
      <!-- 사이드 추가? -->
      <div class="leftcolumn"></div>
      
      <!-- 본문 시작 -->
      <div class="rightcolumn">
         <h2>공지사항</h2><br>
         <p>WASH의 새로운 소식입니다.</p><br>
      <table class="notice-list">
      <!-- 리스트 내용 -->
         <tr class="bt"><td colspan="2"><input type="button" class="button1" value="공지사항">
         <input type="button" class="button2" value="직원채용"></td></tr>
         <tr><td id="line1" class="w70">번호</td>
            <td id="line1" class="w500">제목</td>
            <td id="line1" class="w100">날짜</td>
            <td id="line1" class="w100">조회수</td></tr>
         <%for(int i=1; i<= notices.size(); i++){
                Notice notice=notices.get(i-1);%>
          <tr>
               <td id="line2" class="w70"><%=i%> </td>
               <td id="line2" class="w500" "><a href="/adminnoticedetail/<%= notice.getNo()%>" style="color:black;">
                      <strong>[공지]</strong><%=notice.getTitle()%></a></td>
               <td id="line2" class="w70"><%=notice.getRdate() %></td>
               <td id="line2" class="w100"><%=notice.getViews() %></td>
          </tr>
         <%}%>
         
         </table>
               <% if(isAdmin){ %>
         <a href="/noticeadd" id="submit-bt">등록</a>
         
      <% } %>
         
         </div></div>
         </c:otherwise>
      </c:choose>

      
      <br><br><br>
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
</html> --%>