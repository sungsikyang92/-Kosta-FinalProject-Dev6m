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
 <c:set var="nowPage" value="${param.pageNo}"/>
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
					<input type="hidden" name="nowPage" value="${nowPage}">
					<input type="submit" value="계정정지">
				</form>
			</td>
			</c:when>

			<c:otherwise>
			<td>
			<form method="get" action="${pageContext.request.contextPath}/updateMemberStatus.do">
					<input type="hidden" name="accstatus" value="0">
					<input type="hidden" name="id" value="${mlvo.id}">
					<input type="hidden" name="nowPage" value="${nowPage}">
					<input type="submit" value="정지해제">
				</form>
			</td>
			</c:otherwise>
			</c:choose>
			</tr>
			</c:forEach>
</table>
</div>
</div>
<%-- 페이징빈 처리 영역 --%>
		<div class="pagingInfo">
			<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
			<c:set var="pb" value="${requestScope.MLVO.pagingBean}"></c:set>
			<ul class="pagination">
				<c:if test="${pb.previousPageGroup}">
					<li><a class="btn btn-outline-primary"
						href="${pageContext.request.contextPath}/adminControlMember.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a
								href="${pageContext.request.contextPath}/adminControlMember.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>&nbsp;
				</c:forEach>
				<c:if test="${pb.nextPageGroup}">
					<li><a class="btn btn-outline-primary"
						href="${pageContext.request.contextPath}/adminControlMember.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>

</body>
</html>