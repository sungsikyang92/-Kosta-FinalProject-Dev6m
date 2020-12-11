<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-lg margin-top margin-bottom" style="margin:100px auto;">
회원관리
 <div class="row main">
<table border="1">
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
			<td>${mlvo.reportCount}</td>
			<c:set var="accstatus" value="${mlvo.accStatusVO.accStatusInfo}"/>
			<c:choose>
			<c:when test="${accstatus eq '사용계정' || accstatus eq '휴먼계정' || accstatus eq '탈퇴계정'}">
			<td><form method="get" action="${pageContext.request.contextPath}/updateMemberStatus.do">
					<input type="hidden" name="accstatus" value="3">
					<input type="hidden" name="id" value="${mlvo.id}">
					<input type="submit" value="계정정지">
				</form>
			</td>
			</c:when>

			<c:otherwise>
			<td>
			<form method="get" action="${pageContext.request.contextPath}/updateMemberStatus.do">
					<input type="hidden" name="accstatus" value="0">
					<input type="hidden" name="id" value="${mlvo.id}">
					<input type="submit" value="정지해제">
				</form>
			</td>
			</c:otherwise>
			</c:choose>
			</tr>
			
						
			<!-- if 계정 상태가  정지상태 라면  -->
			
			</c:forEach>
			
</table>
</div>
</div>
</body>
</html>