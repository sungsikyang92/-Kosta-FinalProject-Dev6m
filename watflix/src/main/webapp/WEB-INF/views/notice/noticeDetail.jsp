<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		$('#noticeUpdateForm').submit(function(){
			return confirm("수정하시겠습니까?");
		})
		$('#noticeDeleteForm').submit(function(){
			return confirm("삭제하시겠습니까?");
		})
	})
</script>
<div class="container-lg" style="margin-top: 90px">
	<table class="table table-hover">
		<tr>
			<td>번호</td>
			<td>${requestScope.noticeDetail.noticeNo}</td>
			<td>제목</td>
			<td>${requestScope.noticeDetail.noticeTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${requestScope.noticeDetail.noticeContents}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${requestScope.noticeDetail.memberVO.id}</td>
			<td>작성일자</td>
			<td>${requestScope.noticeDetail.noticePostedTime}</td>
			<td>조회수</td>
			<td>${requestScope.noticeDetail.noticeHits}</td>
		</tr>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<tr>
			<td>
				<button form="noticeUpdateForm">수정</button>
				<form action="noticeUpdateForm.do" id="noticeUpdateForm" method="post">
					<sec:csrfInput />
					<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
					<input type="hidden" name="noticeNo" value="${requestScope.noticeDetail.noticeNo}">
				</form>
			</td>
			<td>
				<button form="noticeDeleteForm" type="submit">삭제</button>
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