<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>


<style>

/* button 화면 시작*/

#cart-textdiv {
   text-align: center;
   margin-top: 100px;
}

#cart-btndiv {
   margin-top: 50px;
   text-align: center;
}

#cart-closebtn {
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

/* button 끝*/

</style>

<head>
<meta charset="UTF-8">
<title>Cart Success</title>

<script type="text/javascript">
   
   function goCart() {
      opener.location.href='/cartlist/<%=session.getAttribute("userNo") %>';
      window.close();
   }
   
</script>

</head>
<body>

   <div id="cart-textdiv">
      <p>
         <b style="font-size: 30px;">상품이 장바구니에 담겼습니다.</b>
      </p>
      <p style="font-size: 20px;">
         바로 확인하시겠습니까?
      </p>
   </div>
   
   <div id="cart-btndiv">
      <button type="button" id="cart-closebtn" onclick="javascript:self.close();">계속 쇼핑하기</button>
      <button type="button" id="cart-gobtn" onclick="goCart()">확인하기</button>
   </div>

</body>
</html>