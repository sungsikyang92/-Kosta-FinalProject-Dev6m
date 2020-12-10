<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="beige">
회원관리
 <div class="row main">
<table border="1">
<caption>회원목록</caption>
			<tr>
				<th>아이디</th>
				<th>마지막접속</th>
				<th>회원상태</th>
				<th>경고현황</th>
				<th>비고</th>
			</tr>
			<c:forEach var="mlvo" items="${requestScope.MLVO.memberList}">
			<tr>
			<td>${mlvo.id}</td>
			<td>${mlvo.loginTime}</td>
			<td>${mlvo.accStatusVO.accStatusInfo}</td>
			</tr>
			</c:forEach>
			
</table>
</div>
</body>
</html>