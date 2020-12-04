<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$(doucment).ready(function(){
		$('#commentsWriteForm').submit(function(){
			return confirm("작성하시겠습니까?");
		})
	})
</script>
<title>commentsWriteForm</title>
</head>
<body>
	<form action="commentsWrite.do" id="commentsWriteForm" method="post">
	<sec:csrfInput/>
	<table>
		<tr>			
			<td>별점</td><td><input type="number" name="commentsStars" min="1" max="10" required="required"></td>
		</tr>
		<tr>
			<td>한줄평</td><td><textarea cols="90" rows="15" name="commentsContents" placeholder="한줄평을 입력해주세요!" required="required"></textarea></td>
		</tr>
		<tr>
			<td><input type="submit" value="작성"></td>
		</tr>
	</table>
	</form>
</body>
</html>