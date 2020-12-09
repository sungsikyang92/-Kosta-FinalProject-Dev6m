<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="tableMargin">
<a href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${ru.reviewNo}">이전페이지로</a>
해위
<form action="${pageContext.request.contextPath}/reviewUpdate.do" method="post" id="reviewUpdateForm">
<sec:csrfInput/>
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
	<button type="button" class="btn" id="backToReviewDetail">이전페이지</button>
	<button type="reset" class="btn">원문복구</button>
	<button type="submit" class="btn">수정하기</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewUpdateForm").submit(function(){
			return confirm("리뷰를 수정 하시겠습니까?");
		});	//confirm reviewUpdate function
		$("#backToReviewDetail").click(function(){
			if(confirm("이전페이지로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${ru.reviewNo}"
			}else
			return
		});	//backToReviewDetail function
	});	//ready
</script>
</form>
</div>