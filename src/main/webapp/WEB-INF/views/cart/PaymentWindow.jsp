<%@page import="com.stone.springmvc.member.common.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Member member = (Member) request.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<style type="text/css">


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


input[type="text"] {
   width: 300px;
   padding: 5px 10px;
   margin: 10px;
   display: inline;
   text-align: left;
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

</style>
</head>
<body>

<div class="join-content" >
      <div id="join-info-div">
         <h1 align="center" style="color: black; margin-bottom: 15px;">주문/결제</h1>
         <b style="font-size: 12px; color: black;">주문정보</b>&nbsp; > &nbsp;<b style="font-size: 12px; color: #666666;">가입완료</b>
      </div> 
      
      <div id="pfont1">
         기본정보
      </div>
         
         <hr id="hrs1">
            <table id="join-table">
                   <tr>
                   <th>• 이름 </th>
               <td><input type="text" id="name" value="<%=member.getName() %>" /></td>
                   </tr>
               <tr>
                   <th>• 아이디 </th>
                    <td><input type="text" id="id" value="<%=member.getId() %>" readonly="readonly"/></td>
                   </tr>
                   <tr>
               <th>• 전화번호</th>
                   <td><input type="text" value="<%=member.getTel()%>" id="tel" placeholder="-없이 입력하세요." /></td>
                   </tr>                
                   <tr>
               <th>생년월일</th>
                    <td><input type="text" id="date" value="<%=member.getDate() %>" /> </td>
                   </tr>
                   <tr>
               <th>최근 배송지</th>
              	 <td>&nbsp;</td>
                   </tr>
                   <tr> 
               <th>우편번호</th>
                   <td><input type="text" value="<%=member.getPost() %>" id="post" /></td>
                   </tr>
                   <tr> 
               <th>주 소</th> 
                   <td><input type="text" value="<%=member.getAddress() %>" id="address" size=30 /></td>
                   </tr> 
                   <tr> 
               <th>상세 주소 </th> 
                   <td><input type="text" value="<%=member.getDetailaddress() %>" id="detailaddress" /></td>
               </tr>
                   <tr> 
               <th>이메일</th> 
                   <td><input type="text" id="email1" value="<%=member.getEmail() %>" /> </td>
               </tr>

         </table>
               <hr id="hrs2">   
               <input type='button' value='결제하기' onclick='purchase()' />
      </div>




<script type="text/javascript">
function purchase() {
	opener.pay();
	window.close();
}
</script>

</body>
</html>