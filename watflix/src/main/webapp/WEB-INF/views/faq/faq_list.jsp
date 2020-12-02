<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqList</title>
</head>
<body>
FAQ Page
<form >
<table>
	<caption> FAQ 목록</caption>
	<thead>
		<tr>
			<th class="faqNo">NO</th>
			<th class="faqTitle"></th>
			<th class="faqWriter"></th>
			<th class="faqPostedTime"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="fvo" items="${requestScope.lvo.faqList}">
	
			<tr>
				<td>${fvo.faqNo}</td>
				<td><a href="${pageContext.request.contextPath}/faqDetail.do?faqNo=${fvo.faqNo}">${fvo.faqTitle}</a></td>
				<td>${fvo.memberVO.id}</td>
				<td>${fvo.faqPostedTime}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<a href="${pageContext.request.contextPath}/faqWriteForm.do"><input type="button" value="FAQ 작성"></a>
</form>
</body>
</html>




