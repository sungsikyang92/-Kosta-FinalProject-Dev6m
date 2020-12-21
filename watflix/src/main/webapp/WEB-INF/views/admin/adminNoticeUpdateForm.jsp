<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<script type="text/javascript">
$(document).ready(function(){
// 공지글 목록으로 돌아가는 메소드
		$("#backToNoticeList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/getNoticeListAdmin.do?pageNo=${requestScope.pageNo}";
			}
		})
})
</script>
<div class="tableMargin">
	<div class="container-lg boardClassMainFaQ">
		<form method="post"
		 action="${pageContext.request.contextPath}/noticeUpdate.do">
		<sec:csrfInput />
		<table class="table table-bordered" style="border-radius: 1.5px;">
			<tr>
				<td>제목</td>	<td colspan="7"><input type="text" size="150" name="noticeTitle" value="${requestScope.noticeUpdateForm.noticeTitle}" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="7"><textarea cols="151" rows="15" name="noticeContents" required="required">${requestScope.noticeUpdateForm.noticeContents}</textarea></td>
			</tr>
			<tr>
				<td>번호</td>	<td>${requestScope.noticeUpdateForm.noticeNo}</td>
				<td>작성자</td><td>${requestScope.noticeUpdateForm.memberVO.id}</td>
				<td>작성시간</td><td>${requestScope.noticeUpdateForm.noticePostedTime}</td>
				<td>조회수</td><td>${requestScope.noticeUpdateForm.noticeHits}</td>
			</tr>
			<tr>
				<td colspan="8" class="btnArea">
					<input type="hidden" name="noticeNo" value="${requestScope.noticeUpdateForm.noticeNo}">
					<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
					<button style="color: black" type="submit" class="btn-list btn btn-default boardDetailBtn">수정</button>
					<button style="color: black" type="reset" class="btn-list btn btn-default boardDetailBtn">취소</button>
					<button style="color: black" type="button" class="btn-list btn btn-default boardDetailBtn" id="backToNoticeList">목록</button>
				</td>
			</tr>
		</table>
		</form>
</div>
</div>
</sec:authorize>