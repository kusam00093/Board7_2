<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="/img/favicon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet"   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css">

<title>View</title>
<style>
 #table {      
      width: 800px;      
   }
             input[type=text]{
          	width: 100%;
          	
          }
          textarea{
          	width: 100%;
          	height:250px;
          
          }
   #maintable {
     td {
      	text-align :center;
      	padding :10px;
      
      &:nth-of-type(1) { width : 200px; 
          background-color : black;
          color            : white; 
          input[type=text]{
          	width: 100%;
          	
          }
          textarea{
          	width: 100%;
          	height:250px;
          
          }
          
      		}
      &:nth-of-type(2) { width : 200px;  }
      &:nth-of-type(3) { width : 200px; 
          background-color : black;
          color            : white;
     	    }
      &:nth-of-type(4) { width : 200px;  }    
     		}
    tr:nth-of-type(4) td[colspan] {
           height : 250px;
           width  : 600px;  
           text-align : left;
           vertical-align: baseline; 
    	}
    tr:nth-of-type(3) td:nth-of-type(2){
    		text-align: right;
    }	
    tr:last-child td {
           background-color : white;
           color            : black;   
    	}
   }
   


</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>

</head>  
<body>
  <main>
     <%@include file="/WEB-INF/include/menus.jsp" %>
    <h2>게시물 상세정보</h2>
    <form action="/Board/Update" method = "post">
    <input type="hidden" name ="bno" value="${ bo.bno }"> 
    <input type="hidden" name ="menu_id" value="${ bo.menu_id }"> 
      <table id = maintable>
    <tr>
      <td>글번호</td>
      <td>${ bo.bno }</td>
      <td>조회수</td>
      <td>${ bo.hit }</td>      
    </tr>
    <tr>
      <td>작성자</td>
      <td>
      <input type="text" name="writer" value="${bo.writer }">
      </td>
      <td>작성일</td>
      <td>${ bo.regdate }</td>
    </tr>
    <tr>
      <td>제목</td>
      <td colspan="3">
      <input type ="text" name="title" value="${bo.title}">
      </td>   
    </tr>
    <tr>
      <td>내용</td>
      <td colspan="3"><textarea name="content">${ bo.content }</textarea></td>
    </tr>  
      	<tr>
      	  <td colspan="4">
			<input class="btn btn-danger btn-sm" type="submit" value="수정">
			<a id="goList" class="btn btn-danger btn-sm" type="button" >목록</a>
      	  </td>
      	</tr>

      
      
      
      </table>
    </form>
                
  </main>
	<script>
	  const goListEl = document.getElementById('goList');
	  goListEl.addEventListener('click',function(e){
		  location.href = '/Board/List?menu_id=${bo.menu_id}';
	  })
	</script>
</body>
</html>