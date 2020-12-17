<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<div class="container-lg margin-top margin-bottom boardClassMain">
  <h2>리뷰 수정하기</h2>           
	<form action="${pageContext.request.contextPath}/reviewUpdate.do" method="post" id="reviewUpdateForm">
		<sec:csrfInput/>
		<input type="hidden" name="reviewNo" value="${requestScope.ru.reviewNo}">
	  	<table class="table table-bordered" style="border-radius: 1.5px;">
			<tr>
				<td class="boardTd">제목</td>
				<td><input type="text" name="reviewTitle" class="boardTitle" value="${requestScope.ru.reviewTitle}" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="reviewContents" required="required" class="boardTextarea">${requestScope.ru.reviewContents}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btnArea">
					<button type="button" class="btn btn-default boardDetailBtn" onclick="location.href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${requestScope.ru.contentsVO.contentsNo}'">목록</button>
					<button type="reset" class="btn btn-default boardDetailBtn" type="submit">초기화</button>
					<button form="reviewUpdateForm" class="btn btn-default boardDetailBtn" type="submit">수정</button>
					<form action="reviewUpdateForm.do" id="reviewUpdateForm" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
					</form>
				</td>
			</tr>
	  	</table>
	</form>
</div>