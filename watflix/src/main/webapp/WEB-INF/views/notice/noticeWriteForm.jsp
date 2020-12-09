<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#noticeWriteForm").submit(function(){
			return confirm("글을 등록하시겠습니까?");
		})
	})
</script>
<div class="container-lg" style="margin-top: 90px">
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