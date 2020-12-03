<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Detail Page</title>

</head>
<body>
<form action="faqDelete.do" id="faqDelete" method="post">
<table>
	<caption> FAQ Detail</caption>
	<thead>
		<tr>
			<th class="faqNo">NO</th>
			<th class="faqTitle"></th>
			<th class="faqWriter"></th>
			<th class="faqPostedTime"></th>
			<th class="faqDetail"></th>
		</tr>
	</thead>
	<tbody>	
			<tr>
				<td>${requestScope.fvo.faqNo}</td>
				<td>${requestScope.fvo.faqTitle}</td>
				<td>${requestScope.fvo.memberVO.id}</td>
				<td>${requestScope.fvo.faqPostedTime}</td>
				<td>${requestScope.fvo.faqContents}</td>
			</tr>
	</tbody>
</table>
<input type="submit" value="삭제하기" >
<input type="submit" value="수정하기" >
</form>
</body>
</html>