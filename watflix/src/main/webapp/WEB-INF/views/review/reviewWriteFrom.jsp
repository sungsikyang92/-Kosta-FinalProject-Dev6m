<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReviewWriteForm</title>
</head>
<body>
<h3> <a class="nav-link navbar-nav-item" href="${pageContext.request.contextPath}/reviewList.do">리뷰리스트로</a>
</h3>
<form action="${pageContext.request.contextPath}/reviewWrite.do" method="post" id="reviewWriteForm">
<sec:csrfInput/>
<input type="hidden" name="contentsNo" value="${param.contentsNo}">
<table class="table">
	<tr>
		<td>제목 &nbsp;&nbsp;
			<input type="text" name="reviewTitle" id="reviewTitle" placeholder="리뷰의 제목을 입력해주세요!" required="required">	
		</td>
	</tr>
	<tr>
		<td>
			<textarea cols="90" rows="15" name="reviewContents" id="reviewContents" placeholder="리뷰의 내용을 입력해주세요!" required="required"></textarea>
		</td>
	</tr>
</table>
<div class="btnArea">
	<button type="reset" class="btn">취소하기</button>
	<button type="submit" class="btn">게시하기</button>
</div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewWriteForm").submit(function(){
			return confirm("리뷰를 등록 하시겠습니까?");
		});
	});
</script>
</body>
</html>