<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<title>noticeDetail</title>
</head>
<body>
	<table>
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
		<tr>
			<td>
				<button form="noticeUpdateForm">수정</button>
				<form action="noticeUpdateForm.do" id="noticeUpdateForm" method="post">
					<input type="hidden" name="noticeNo" value="${requestScope.noticeDetail.noticeNo}">
				</form>
			</td>
			<td>
				<button form="noticeDeleteForm" type="submit">삭제</button>
				<form action="noticeDelete.do" id="noticeDeleteForm" method="post">
					<sec:csrfInput />
					<input type="hidden" name="noticeNo" value="${requestScope.noticeDetail.noticeNo}">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>