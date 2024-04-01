<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/img/favicon.png">
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<link rel="stylesheet" href="/css/common.css">
<title>Write</title>
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

td:not([colspan]):first-child{
	background-color: black;
	color : white;
	font-weight : bolder;
}

td{
	width : 800px;
}
#maintable td{
	padding : 10px;
}
#maintable{
	width : 80%;
}
td:nth-of-type(1){
	width : 200px;
	text-align : center;
}

input[readonly]{
	background: #ddd;
	
}

textarea{
	height : 300px;
	width  : 100%;

}
</style>
</head>  
<body>
  <main>
  <%@include file="/WEB-INF/include/menus.jsp" %>
 
    <h2>게시글 등록</h2>
    <form action="/Board/Write" method = "post">
    <input type="hidden" name ="menu_id" value="${ menu_id }"/>
      <table id = "maintable">
      	<tr>
      	  <td>제목</td>
      	  <td><input type="text" name ="title"></td>
      	</tr>

      	<tr>
      	  <td>작성자</td> 
      	  <td><input type="text" name ="writer" value="${sessionScope.login.userid }"></td>
      	</tr>
      	<tr>
      	  <td>내용</td>
      	  <td><textarea name="content"></textarea></td>
      	</tr>

      	<tr>
      	  <td colspan = "2">
      	  <input type ="submit" value = "글 쓰기">
      	  <input type ="button" value = "목록" id= "goList">
      	  </td>
      	</tr>
      
      
      
      </table>
                
    </form>
  </main>
	<script>
	  const goListEl = document.getElementById('goList');
	  goListEl.addEventListener('click',function(e){
		  location.href = '/Board/List?menu_id=MENU01';
	  })
	</script>
</body>
</html>