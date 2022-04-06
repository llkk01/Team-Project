<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   Boolean usable = (Boolean)request.getAttribute("usable");
   String id = (String)request.getAttribute("id");
%>

<!DOCTYPE html>
<html>

<style>

#idcheck-div {
   text-align: center;
   width: 600px;
   margin-left: 30%;
   text-align: left;
}

input[type="text"]{
   padding: 5px 10px;
   margin: 10px;
   display: inline;
   text-align: left;
}

#usediv {
   margin-left: 250px;
   color: blue;
}

#usediv2 {
   margin-left: 220px;
   color: red;
}

#check {
   width: 70px;
   background-color: white;
   color: black;
   height: 30px;
   font-size: 10px;
}

#cancelbtn {
   width: 70px;
   background-color: white;
   color: black;
   height: 30px;
   font-size: 10px;
   margin-left: 16px;
}

#usebtn {
   width: 70px;
   background-color: white;
   color: black;
   height: 30px;
   font-size: 10px;   
   margin-left: 16px;
}
 
</style>

<head>
<meta charset="UTF-8">
<title>id 중복검사 </title>


<script>

   //id 사용
   function idUse(){
      var id = document.querySelector("#id").value;
      opener.ids(id);
      close();
   }
   
   //취소버튼 클릭시 창 닫기
   function back(){
         window.close();
   }
   
</script>

</head>
<body>
<h1 align="center" style="margin-bottom: 15px;">ID CHECK</h1>
<div id="idcheck-div">
   <form action="/idcheck" method="post">
      <table id="idcheck-table">
         <tr>
         <th>아이디 </th>
         <td>
         <input type="text" name="id" id="id" value="<%=(id==null)?"":id%>"/>
         <input type="submit" value="중복검사" id="check"/>
         </td>
         </tr>
   </table>
   </form>
</div>

<!-- 사용가능여부/사용,취소 버튼 생성 -->

<% 
   if(usable!=null) {
      if(usable){
%>
   <div id="usediv">
   사용 가능한 아이디입니다. 
   <input type="button" id="usebtn" onclick="idUse()" value="사용"/> 
   
   </div>
<%
   } else {
%>
   <div id="usediv2" >아이디가 이미 사용 중 입니다.
      <input type="button" id="cancelbtn" value="취소" onclick="back()"/>
   </div>
<%
   } }
%>


</body>
</html>