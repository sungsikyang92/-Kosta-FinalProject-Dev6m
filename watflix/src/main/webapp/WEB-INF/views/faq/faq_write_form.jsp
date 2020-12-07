<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>FAQ 작성 Form </title>
</head>
<body>
<form action="${pageContext.request.contextPath}/faqWrite.do" method="post" id="faq_write">
 <sec:csrfInput/>  <!--  post 방식일 때 form안에 꼭 들어가 있어야 하는 토큰 -->
 <table>
 		<tr>			<!-- name 의 "faqTitle"은 FaqVO에 있는 변수명  -->
 			<td> 제목 <input type="text" name="faqTitle" placeholder="게시글 제목을 입력하세요" required="required">
 			<br><br></td>
 			<td> 
 			<br><br>
 		   <textarea cols="90" rows="15" name="faqContents" required="required" placeholder="본문내용을 입력하세요"></textarea>
 			</td>
 		</tr>
 </table>
 <div class="btnArea">
     <button type="submit" class="btn" >확인</button>  
     <button type="reset" class="btn" >취소</button>   
    </div>  
 </form>
 <script type="text/javascript">
   	$(document).ready(function(){
   		//form id로 제어한다 
   		$("#faq_write").submit(function(){
   			return confirm("FAQ를 등록하시겠습니까?");   			
   		});
   	}); 	
   </script> 
</body>
</html>