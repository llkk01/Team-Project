<%@page import="com.stone.springmvc.cart.common.Cart"%>
<%@page import="com.stone.springmvc.product.common.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%  List<Cart> carts = (List<Cart>)request.getAttribute("carts"); %>
<%  List<Product> products = (List<Product>)request.getAttribute("products"); %>
<% boolean isLogin = (boolean) request.getAttribute("isLogin"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>상품목록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="https://malsup.github.io/jquery.form.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/style/header.css">
<link rel="stylesheet" type="text/css" href="/style/footer.css">


<script>

   //장바구니 수량변경
   function cartEdit(num,num_count){
      ef.no.value=num;
      var qty=$('#oqty'+num_count).val();
      ef.count.value=qty;
      ef.method='post';
      ef.submit();
   }
   
   //삭제 버튼 클릭시
   function cart_delete() {
       if (confirm("삭제하시겠습니까?") == true){ 
          deleteForm.action='/cartdelete';
          deleteForm.submit();
       }else{return false;}
   } 
   
   //선택제품만 구매시
   function payment() {
       if(confirm("선택한 상품결제하시겠습니까?") == true){
          window.open("/payment","","width=1000,height=700,left=200,top=100");
          window.pay = function () {
             deleteForm.action='/payment';
             deleteForm.submit();
            };
       }else{return false;}
   } 
   
   //전체선택
   function checkSelectAll()  {
        // 전체 체크박스
        const checkboxes = document.querySelectorAll('input[name="no"]');
        // 선택된 체크박스
        const checked = document.querySelectorAll('input[name="no"]:checked');
        // select all 체크박스
        const selectAll = document.querySelector('input[name="selectall"]');
        
        if(checkboxes.length === checked.length)  {
          selectAll.checked = true;
        }else {
          selectAll.checked = false;
        }
      }
   
   function selectAll(selectAll)  {
       const checkboxes = document.getElementsByName('no');
        
        checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
       })
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

/* 장바구니전체 테이블 */

#cart-title-div {
   margin-top: 80px;
   width: 300px;
   text-align: center;
   margin-left: 40%;

}

#cart-div {
   text-align: center;
}

#cart-table {
   width: 900px;
   margin-left: 20%;
   border-top: 1px solid #444444;
    border-collapse: collapse;
    margin-bottom: 200px;
}

th, td {
   border-bottom: 1px solid #444444;
}


/* 장바구니비었을때 */
#cart-empty-div {
   width: 900px;
   text-align: center;
   margin-bottom: 30px;
   margin-left: 20%;
   height: auto;
}  

#cart-empty-div1 {
   width: 900px;
   margin: 30px;
   margin-top: 100px;
   text-align: center;
   margin-bottom: 30px;
   height: 50px;
   
}

#cart-empty-div1-1 {
   width: 900px;
   margin-top: 100px;
   text-align: center;
   margin-bottom: 200px;
   height: 100px;
   background-color: #d9d9d9;

}

#cart-empty-div1-2 {
   padding-top: 35px;
}

#cart-table2 {

}

#cart-table3-1 {
   width: 900px;
   text-align: center;
   background-color: #d9d9d9;
   height: 150px;
   
}


  
/* .body-content .div_jh2 .lastTd_jh{ */
/*    height: 200px;  */
/*    font-size: 30px; */
/*    background-color: #d9d9d9; */
/* } */

#cart-table-btn {
   text-align: center;
   margin-top: 20px;
   margin-bottom: 20px;
}

#cart-table-btn1 {
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

#cart-table-btn2 {
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

#cartoptionbtn {
   width: 60px;
   cursor: pointer;
   background-color: black;
      color: white;
}


.body-wrapper {
   min-height: 100%;
   position: relative;
   background: transparent;
}

.body-content {
   width: 100%;
   height: 100%; 
   margin-top: 0px; 
   margin-bottom: 800px;
}


/* table, th, td { border: 1px solid black; }  */

</style>

</head>
<body>
   <div class="body-wrapper">
      <div class="base-main" id="baseMain">
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

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
                              <%if (isLogin) {%> 
                              <li><a href="/logout">로그아웃</a> </li>
                              <li>회원가입</li>
                              <li>고객센터</li>
                              <%} else {%>
                              <li><a href="/login">로그인</a></li>
                              <li>회원가입</li>
                              <li>고객센터</li>
                              <%}%>
                           </ul>
                        </li>
                     </ul>
                  </nav>
               </div>
            </header>
         </div>
      </div>
      
      
      

<!--    장바구니 구간 시작    -->
 
   <div class="body-content">
      <div id="cart-title-div">
         <h1 align="center" style="color: black; margin-bottom: 15px;">SHOPPING CART</h1>
         <b style="font-size: 12px; color: black;">Cart</b>
         &nbsp; > &nbsp;
         <b style="font-size: 12px; color: #666666;">Order</b>
      </div>
      
      <c:choose>
       <c:when test="${empty carts}"> 
      	<div id="cart-empty-div">
	         <p style="margin-top: 20px; text-align: left;">
	            <b style="font-size: 20px;">제품</b>
	         </p>
         	<hr style="border: solid 1px #000000;">
         	
                <div id="cart-empty-div1">
                  <p style="font-size: 20px; ">장바구니에 담겨있는 상품이 없습니다.</p>
               </div>
               <div id="cart-empty-div1-1">
                  <div id="cart-empty-div1-2">
                     <p style="font-size: 15px; text-align: center;">
                        총 0개의 금액  &nbsp; ₩ 0 &nbsp; + 배송비 &nbsp;  ₩ 0 &nbsp; = &nbsp; <b style="font-size: 18px;"> 총 주문 금액  &nbsp; ₩ 0 </b> 
                     </p><br>
            
                     
                  </div>
               </div>
      		</div>
       </c:when>
       <c:otherwise>
   		<div id="cart-div">
      		<form method="post" name="deleteForm">
         		<table id="cart-table">
		            <tr>
		               <th height="50px" width="80px">
		                  <input type='checkbox' name='selectall' value='selectall' onclick='selectAll(this)'/>
		               </th>
		               <th colspan="2">제품정보</th>
		               <th width="130px">수량</th>
		               <th width="130px">금액</th>
		               <th width="130px">복지혜택</th>
		               <th width="130px">합계금액</th>
		               <th width="130px">배송비</th>
		            </tr>
         <%    
            int sumPrice = 0;
            int sum_sumPrice = 0;
            int deliveryfee = 0;
               for(int i = 0; i<carts.size(); i++){
                  int price = products.get(i).getPrice();
                  int count = carts.get(i).getCount();
                  int price_count = price*count;
               
                  sumPrice = sumPrice + price_count;
                     
                  if(sumPrice < 50000){
                     deliveryfee = 2500;
                  }else{
                     deliveryfee = 0;
                  }
                  sum_sumPrice = sumPrice + deliveryfee;
         %>
            		<tr>
		               <td>
		                  <input type="checkbox" class="cart_no" name="no" value="<%=carts.get(i).getNo() %>">
		               </td>
		               <td>
		                  <a href="/productdetail/<%=products.get(i).getNo()%>">
		                  <img width="200px" height="200px" src="/upload/items/<%=products.get(i).getNo()%>/<%=products.get(i).getAttachs().get(0).getName() %>"/></a>
		               </td>
		               <td width="400px" style="text-align: left;"> 
		                  <%=products.get(i).getName() %>
		               </td>
		               <td>
		                  <input type="number" name="count" id="oqty<%=carts.get(i).getCount() %>"  min="1" max="<%=carts.get(i).getProduct().getQuan() %>" value="<%=carts.get(i).getCount() %>" />
		               <p>
		                  <button type="button" style="margin-top: 5px;" id="cartoptionbtn" onclick="cartEdit('<%=carts.get(i).getNo() %>','<%=carts.get(i).getCount() %>')">변경</button>
		               </p>
		               </td>
		               <td>
		                  ₩<fmt:formatNumber value="<%=price %>" pattern="#,###" />
		               </td>
		               <td>&nbsp;</td>
		               <td> 
		                  ₩<fmt:formatNumber value="<%=price_count %>" pattern="#,###" />
		               </td>
		               <td> 
		                  ₩<fmt:formatNumber value="<%=deliveryfee %>" pattern="#,###" />
		               </td>
            		</tr>
            <%} %>

            	<div id="cart-table3">
	               <tr>
	                  <td id="cart-table3-1" colspan="8">
	                     <span>
	                        	총 <%=carts.size() %>개의 금액 ₩<fmt:formatNumber value="<%=sumPrice %>" pattern="#,###" />
	                     </span>
	                        +
	                     <span>
	                       	 배송비  ₩<fmt:formatNumber value="<%=deliveryfee %>" pattern="#,###" />
	                     </span>
	                        =
	                     <span>
	                        <b>총 주문금액 ₩</b>
	                     </span>
	                     <b>
	                        <fmt:formatNumber value="<%=sum_sumPrice %>" pattern="#,###" />
	                     </b>
	                  </td>
	               </tr>
	            
	                      
	           </div>
         
		         <div  id="cart-table-btn">
		            <tr>
		               <td class="lastTd_jh" colspan="8">
		                  <button type="submit" onclick="cart_delete()" id="cart-table-btn1" >선택한품목삭제</button>
		                  <input type="button" onclick="payment()" value="선택한 품목 구매" id="cart-table-btn2" />
		               </td>
		            </tr>
		       </div>
       		</table>
       	   </form>
       	 </div>
       </c:otherwise>
      </c:choose>
   </div> 
       
     
  

    
<!-- 장바구니수량변경 form 시작 -->
   <form name="ef" action="/cartupdate">
      <input type="hidden" name="no">
      <input type="hidden" name="count">
   </form>
<!-- 장바구니수량변경 form 끝 -->

   
<!--    장바구니 구간 끝    -->






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