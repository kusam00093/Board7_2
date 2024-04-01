<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link rel="icon" type="image/png" href="/img/favicon.png">
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<link rel = "stylesheet" href="/css/common.css">
<style>





#mainboard{
  td{
  	padding : 10px;
  	text-align : center;
  }
  
  td:nth-of-type(1){
  	width : 80px;
  }
  
  td:nth-of-type(2){
  	width : 400px;
  	text-align : left;
  }
  
  td:nth-of-type(3){
  	width : 100px;
  }
  
  td:nth-of-type(4){
  	width : 140px;
  }
  
  td:nth-of-type(5){
  	width : 80px;
  }
  

  tr:first-child{
   	background-color: black;
   	color : white;
   	font-weight : bolder;
   	td{
	  	text-align : center;
   		border-color : violet;   	
   	 }   	
  }
  /*
  tr:first-child> td {
  	border-color : white;
  }*/
    
  tr:nth-child(2)> td{
  	text-align : right;
  }
  }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
  <main>
    <%@include file="/WEB-INF/include/menus.jsp" %>
    
    <h2>${menu_name} 게시물 목록</h2>
    <table id="mainboard">
      <tr>
	    <td>번호</td>	     
	    <td>제목</td>	     
	    <td>작성자</td>	     
	    <td>등록일</td>	     
	    <td>조회수</td>	     
      </tr>
      <tr>
      <td colspan = "5">
		 [<a href = "/Board/WriteForm?menu_id=${param.menu_id}">새 글추가</a>    ]&nbsp;&nbsp;&nbsp;  
      </td>
      </tr>
     <c:forEach  var="board" items="${ boardList }">
      <tr>
	    <td>${board.bno}</td>	     
	    <td><a href="/Board/View?bno=${board.bno}&menu_id=${param.menu_id}">${board.title}</a></td>	     
	    <td>${board.writer}</td>	     
	    <td>${board.regdate}</td>	     
	    <td>${board.hit}</td>	     
      </tr>
      </c:forEach>
    </table>
  </main>

</body>
</html>