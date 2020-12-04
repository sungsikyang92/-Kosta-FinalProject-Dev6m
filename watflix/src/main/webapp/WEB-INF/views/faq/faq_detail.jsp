<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Detail Page</title>
</head>
<script type="text/javascript">
function updateBtn() {
	// alert("업뎃버튼을 눌렀츄");
	location.href="${pageContext.request.contextPath}/faqUpdateForm.do?faqNo=${requestScope.fvo.faqNo}";
}
</script>
<body>

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

<button form="faqDelete" type="submit">삭제</button>
<form action="faqDelete.do" id="faqDelete" method="post">
<sec:csrfInput/>
<input type="hidden" name="faqNo" value="${requestScope.fvo.faqNo}">
</form>
<button id="updateBtn" onclick="updateBtn()">수정</button>
</table>
</body>
</html>




