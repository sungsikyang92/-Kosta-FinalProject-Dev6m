<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<a href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${ru.reviewNo}">이전페이지로</a>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
해위
<form action="${pageContext.request.contextPath}/reviewUpdate.do" method="post" id="reviewUpdateForm">
<input type="hidden" name="reviewNo" value="${requestScope.ru.reviewNo}">
<table class="table">
	<tr>
		<td>제목 &nbsp;&nbsp;
			<input type="text" name="reviewTitle" value="${requestScope.ru.reviewTitle}" required="required">
		</td>
	</tr>
	<tr>
		<td>
			<textarea rows="15" cols="90" name="reviewContents" required="required">${requestScope.ru.reviewContents}</textarea>
		<td>
	</tr>
</table>
<div class="btnArea">
	<button type="reset" class="btn">원문복구</button>
	<button type="submit" class="btn">수정하기</button>
</div>
</form>
</body>
</html>