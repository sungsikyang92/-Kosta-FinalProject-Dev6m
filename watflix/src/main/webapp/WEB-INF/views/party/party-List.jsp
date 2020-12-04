<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".partyUpdate").submit(function() {
			return confirm("수정하시겠습니까?");
		})
		$(".partyDelete").submit(function() {
			return confirm("삭제하시겠습니까?");
		})

		$(".partyApply").click(function() {
			alert(1);
		})

	})
</script>
<style type="text/css">
#partyList {
	background-color: #99ccff;
	height: 75%;
	width: 75%;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="partyList">
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이용권종류</th>
				<th>모집 인원</th>
				<th>모집 상태</th>
				<th>작성자</th>
				<th>등록일</th>
			</tr>
			<tbody>
				<c:forEach var="plvo" items="${requestScope.PLVO.partyList}">
					<tr>
						<td>${plvo.partyNo}</td>
						<td>${plvo.partyTitle}</td>
						<td>${plvo.membershipVO.membershipName}</td>
						<td>${plvo.partyHeadCount}</td>
						<td>${plvo.partyStatus}</td>
						<td>${plvo.memberVO.id}</td>
						<td>${plvo.partyPostedTime}</td>
						<!--로그인한 경우 Start  -->
						<sec:authorize access="isAuthenticated()">
							<sec:authentication var="mvo" property="principal" />
							<c:choose>
								
								<c:when test="${mvo.id eq plvo.memberVO.id}">
									<td>
										<form action="goPartyUpdate.do" class=partyUpdate method="get"
											class="partyUpdate">
											<sec:csrfInput />
											<!-- csrf 토큰  -->
											<input type="hidden" name="partyNo" value="${plvo.partyNo}">
											<button class="checkBtn btn-outline-primary">수정</button>
										</form>
									</td>
									<td>
										<form action="partyDelete.do" class=partyDelete method="post">
											<sec:csrfInput />
											<!-- csrf 토큰 -->
											<input type="hidden" name="partyNo" value="${plvo.partyNo}">
											<button class="checkBtn btn-outline-primary">삭제</button>
										</form>
									</td>
								</c:when>
								<c:otherwise>
									<td><button type="button"
											class="checkBtn btn-outline-primary partyApply">지원하기</button></td>
								</c:otherwise>
						</c:choose>
						</sec:authorize>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>


