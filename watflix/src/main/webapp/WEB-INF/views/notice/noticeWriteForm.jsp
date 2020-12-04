<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<script type="text/javascript">
			$(document).ready(function(){
				$("#noticeWriteForm").submit(function(){
				return confirm("글을 등록하시겠습니까?");
				})
			})
		</script>
		<form action="${pageContext.request.contextPath}/noticeWrite.do" method="post" id="noticeWriteForm">
			<sec:csrfInput/>
			<table class="table">
				<tr>
					<td>제목</td>	<td><input type="text" name="noticeTitle" placeholder="공지사항의 제목을 입력해주세요!" required="required"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="90" rows="15" name="noticeContents" placeholder="공지사항의 내용을 입력해주세요!" required="required"></textarea></td>
				</tr>				
				<tr>
					<td>
						<button type="submit">확인</button>
						<button type="reset">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>