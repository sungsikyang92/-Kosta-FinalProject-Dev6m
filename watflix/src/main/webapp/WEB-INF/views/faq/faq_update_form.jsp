<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">
	$(document).ready(function() {
		
	});
</script>
</head>
<hr>
<hr>
<hr><hr>
<body>
	<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
	
		<div class="row main">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form method="post" id="faqUpdate"
					action="${pageContext.request.contextPath}/faqUpdate.do">
					<sec:csrfInput />
					<input type="hidden" name="faqNo" value="${fvo.faqNo}">
					<table class="table table-hover">
						<tr>
							<td>제목 &nbsp;&nbsp; <input type="text" name="faqTitle"
								value="${fvo.faqTitle}" required="required" width=80%>
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
</body>
</html>


