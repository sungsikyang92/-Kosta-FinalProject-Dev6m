<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="container-lg" style="margin-top: 90px">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<form method="post"
		 action="${pageContext.request.contextPath}/noticeUpdate.do">
		<sec:csrfInput />
		<table>
			<tr>
				<td>번호</td>	<td>${requestScope.noticeUpdateForm.noticeNo}</td>
				<td>제목</td>	<td colspan="3"><input type="text" size="70" name="noticeTitle" value="${requestScope.noticeUpdateForm.noticeTitle}" required="required"></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
				<td colspan="5"><textarea cols="90" rows="15" name="noticeContents" required="required">${requestScope.noticeUpdateForm.noticeContents}</textarea></td>
			</tr>
			<tr>
				<td>작성자</td><td>${requestScope.noticeUpdateForm.memberVO.id}</td>
				<td>작성시간</td><td>${requestScope.noticeUpdateForm.noticePostedTime}</td>
				<td>조회수</td><td>${requestScope.noticeUpdateForm.noticeHits}</td>
			</tr>
			<tr>
				<td>
					<input type="hidden" name="noticeNo" value="${requestScope.noticeUpdateForm.noticeNo}">
					<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
					<button type="submit">수정</button>
				</td>
				<td>
					<button type="reset">취소</button>
				</td>
			</tr>
		</table>
		</form>
		</sec:authorize>
</div>