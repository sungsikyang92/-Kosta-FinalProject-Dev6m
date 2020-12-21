<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		// 수정 확인 메소드
		$('#noticeUpdateForm').submit(function(){
			return confirm("수정하시겠습니까?");
		})
		// 삭제 확인 메소드
		$('#noticeDeleteForm').submit(function(){
			return confirm("삭제하시겠습니까?");
		})
		// 공지글 목록으로 돌아가는 메소드
		$("#backToNoticeList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/getNoticeListAdmin.do?pageNo=${requestScope.pageNo}";
			}
		})
	})
</script>
<div class="container-lg margin-top margin-bottom boardClassMain">
	<table class="table table-bordered" style="border-radius: 1.5px;">
		<tr>

			<td>제목</td>
			<td colspan="7">${requestScope.noticeDetail.noticeTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="7">${requestScope.noticeDetail.noticeContents}</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>${requestScope.noticeDetail.noticeNo}</td>
			<td>작성자</td>
			<td>${requestScope.noticeDetail.memberVO.id}</td>
			<td>작성일자</td>
			<td>${requestScope.noticeDetail.noticePostedTime}</td>
			<td>조회수</td>
			<td>${requestScope.noticeDetail.noticeHits}</td>
		</tr>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<tr>
			<td colspan="8" class="btnArea">
				<button style="color: black" type="button" class="btn-list btn btn-default boardDetailBtn" id="backToNoticeList">목록</button>
				<button style="color: black" form="noticeUpdateForm" class="btn btn-default boardDetailBtn">수정</button>
				<form action="noticeUpdateForm.do" id="noticeUpdateForm" method="post">
					<sec:csrfInput />
					<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
					<input type="hidden" name="noticeNo" value="${requestScope.noticeDetail.noticeNo}">
				</form>
				<button style="color: black" form="noticeDeleteForm" class="btn btn-default boardDetailBtn" type="submit">삭제</button>
				<form action="noticeDelete.do" id="noticeDeleteForm" method="post">
					<sec:csrfInput />
					<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
					<input type="hidden" name="noticeNo" value="${requestScope.noticeDetail.noticeNo}">
				</form>
			</td>
		</tr>
		</sec:authorize>
	</table>
</div>