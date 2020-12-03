<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>faq Update</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/board.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
	<div class="container-fluid">
		<div class="row header">
			<div class="col-sm-2"></div>
			<div class="col-sm-8" align="right">
			</div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row main">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form method="post" id="faqUpdate"
					action="${pageContext.request.contextPath}/faqUpdate.do">
					<sec:csrfInput />
					<input type="hidden" name="faqNo" value="${fvo.faqNo}">
					<table class="table">
						<tr>
							<td>제목 &nbsp;&nbsp; <input type="text" name="faqTitle"
								value="${fvo.faqTitle}" required="required">
							</td>
						</tr>
						<tr>
							<td><textarea cols="90" rows="15" name="faqContents"
									required="required">${fvo.faqContents}</textarea></td>
						</tr>
					</table>
					<div class="btnArea">
						<button type="submit" class="btn">수정</button>
						<button type="reset" class="btn">취소</button>
					</div>				
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>


