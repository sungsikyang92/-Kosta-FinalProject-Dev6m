<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
</head>
<body bgcolor="black" text="#ffffff" >
	<!-- 신고 글자수 제한은 ajax 사용할 것 -->
	<form action="reportCommentsRegister.do" method="post">
		<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
		<sec:csrfInput/>
		<!-- commentsNo -->
		<input type="hidden" name="commentsNo" value="${param.commentsNo }">
		<table>
			<thead>
				<tr>
					<!-- ${param.reviewWriterName} 변수명 수정할 것 -->
					<th>평점 No.${param.commentsNo }</th><th>평점 작성자 :${param.commentsWriter }</th>
					<th>
						<!-- 신고유형 선택을 안할시 false -->
						<select name="reportTypeNo" required>
							<option value="">신고유형</option>
							<option value="1">욕설</option>
							<option value="2">음란물</option>
						</select>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">
						<textarea name="reportContents" style="resize:none" rows="7" cols="45" required="required" placeholder="신고 사유를 작성해주세요."></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<input type="submit" value="작성 완료">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>