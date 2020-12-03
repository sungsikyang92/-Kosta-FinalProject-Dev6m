<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#noticeUpdateFormButton').click(function(){
			alert("1");
			location.href="${pageContext.request.contextPath}/noticeUpdateForm.do?noticeNo=${requestScope.noticeDetail.noticeNo}";
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
			<td><button id="noticeUpdateFormButton">수정</button></td>
			<td><button id="noticeDeleteButon">삭제</button></td>
		</tr>
	</table>
</body>
</html>