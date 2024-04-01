<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/img/favicon.png">
<link rel="stylesheet" href="/css/common.css">
<title>Update</title>
<style>
input:not(input[type=submit]){
	width : 100%;
}
input[type="submit"]{
	width : 100px;
}
#goList {
	width : 100px;
}
#maintable{
	width : 80%;
}
td:not([colspan]):first-child{
	background-color: black;
	color : white;
	font-weight : bolder;
}
#maintable td{
	padding : 10px;
}
td{
	width : 800px;
}
td:nth-of-type(1){
	width : 200px;
	text-align : center;
}

input[readonly]{
	background: #ddd;
	
}
</style>
</head>  
<body>
  <main>
   <%@include file="/WEB-INF/include/menus.jsp" %>
    <h2>게시물 수정</h2>
    <form action="/Board/Update" method = "post">
      <table id="maintable">
      	<tr>
      	  <td>번호</td>
      	  <td><input type="text" name ="bno" value="${bo.bno}" readonly></td>
      	</tr>
      	<tr>
      	  <td>메뉴</td>
      	  <td><input type="text" name ="menu_id" value="${bo.menu_id}" ></td>
      	</tr>
      	<tr>
      	  <td>제목</td>
      	  <td><input type="text" name ="title" value="${bo.title}"></td>
      	</tr>
      	<tr>
      	  <td>글쓴이</td>
      	  <td><input type="text" name ="writer" value="${bo.writer}"></td>
      	</tr>
      	<tr>
      	  <td>내용</td>
      	  <td><input type="text" name ="content" value="${bo.content}"></td>
      	</tr>
      	<tr>
      	  <td>등록일</td>
      	  <td><input type="text"   value="${bo.regdate}" readonly ></td>
      	</tr>

      	<tr>
      	  <td colspan = "2">
      	  <input type ="submit" value = "수정">
      	  <input type ="button" value = "목록" id= "goList">
      	  </td>
      	</tr>
      
       
      
      </table>
                
    </form>
  </main>
	<script>
	  const goListEl = document.getElementById('goList');
	  goListEl.addEventListener('click',function(e){
		  location.href = '/';
	  })
	</script>
</body>
</html>