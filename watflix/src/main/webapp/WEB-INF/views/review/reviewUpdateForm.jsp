<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('#reviewTitle').keyup(function(){
			if($(this).val().length>$(this).attr('maxlength')){
				alert('제목 입력은 30자까지 가능합니다!');
				$(this).val($(this).val().substr(0,$(this).attr('maxlength')));
			}
		});//keyup
		$("#reviewUpdate").submit(function(){
			return confirm("리뷰를 수정 하시겠습니까?");
		});	//confirm reviewUpdate function
		$("#backToReviewDetail").click(function(){
			if(confirm("이전페이지로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${ru.reviewNo}"
			}else{
				return
			}
		});	//backToReviewDetail function
	});	//ready
</script>
<div class="container-lg margin-top margin-bottom boardClassMain">
  <h2>리뷰 수정하기</h2>           
	<form action="${pageContext.request.contextPath}/reviewUpdate.do" method="post" id="reviewUpdate">
		<sec:csrfInput/>
		<input type="hidden" name="reviewNo" value="${requestScope.ru.reviewNo}">
	  	<table class="table table-bordered" style="border-radius: 1.5px;">
			<tr>
				<td class="boardTd">제목</td>
				<td><input type="text" name="reviewTitle" id="reviewTitle" class="boardTitle" placeholder="리뷰의 제목을 입력해주세요!" value="${requestScope.ru.reviewTitle}" maxlength="30" required="required"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="reviewContents" required="required" class="boardTextarea" placeholder="리뷰의 내용을 입력해주세요!">${requestScope.ru.reviewContents}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btnArea">
					<button type="button" class="btn btn-default boardDetailBtn" id="backToReviewDetail">이전페이지</button>
					<button type="reset" class="btn-reset btn btn-default boardDetailBtn">초기화</button>
					<button type="submit" class="btn btn-default boardDetailBtn" >수정</button>
				</td>
			</tr>
	  	</table>
	</form>
</div>