<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
</head>
<body bgcolor="black" text="#ffffff" >
	<!-- 신고 글자수 제한은 ajax 사용할 것 -->
	<form action="post">
		<table>
			<thead>
				<tr>
					<th>리뷰 No.1</th><th>리뷰 작성자 : java</th>
					<th>
						<!-- 신고유형 선택을 안할시 false -->
						<select name="reportType" required>
							<option value="">신고유형</option>
							<option>욕설</option>
							<option>음란물</option>
						</select>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">
						<textarea style="resize:none" rows="7" cols="45" name="" required="required" placeholder="신고 사유를 작성해주세요."></textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>