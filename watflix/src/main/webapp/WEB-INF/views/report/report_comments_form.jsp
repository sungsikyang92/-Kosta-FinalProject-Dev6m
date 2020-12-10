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
	<!-- 글자수 제한 스크립트 -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			// 제한할 글자수 범위 선언
			var maxCount = $("#maxWriteCount").html(100)
			$("#writeCheck").keyup(function(){
				// 현제 장성한 글자수
				var inputLength = $(this).val().length;
				// 작성한 글자수 변경
				$("#writeCount").html(inputLength);
				if (inputLength > maxCount.html()){
					alert(maxCount.html()+"자 이내로 작성해주세요.");
					// 제한한 범위를 넘긴 글자를 지워버린다.
					var reWrite =$(this).val().substring(0, maxCount.html());
					$(this).val(reWrite);
					$("#writeCount").html(reWrite.length);
				}
			})
		})		
	</script>
	<form action="reportCommentsRegister.do" method="post">
		<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
		<sec:csrfInput/>
		<!-- commentsNo -->
		<input type="hidden" name="commentsNo" value="${param.commentsNo}">
		<table class="table table-hover">
			<thead>
				<tr>
					<!-- ${param.reviewWriterName} 변수명 수정할 것 -->
					<th>평점 No.${param.commentsNo }</th><th>평점 작성자 :${param.commentsWriterId }</th>
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
						<textarea id="writeCheck" name="reportContents" style="resize:none" rows="7" cols="45" required="required" placeholder="신고 사유를 작성해주세요."></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성 완료">
					</td>
					<!-- text 오른쪽 정렬 -->
					<td style="text-align:right;">
						<span id="writeCount">0</span>/<span id="maxWriteCount">0</span>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>