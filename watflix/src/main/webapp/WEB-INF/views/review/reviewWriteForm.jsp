<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$('#reviewTitle').keyup(function(){
			if($(this).val().length>$(this).attr('maxlength')){
				alert('제목 입력은 30자까지 가능합니다!');
				$(this).val($(this).val().substr(0,$(this).attr('maxlength')));
			}
		});//keyup
	});//ready
</script>
<!-- reviewWriteForm DIV 시작 -->
<div class="tableMargin">
<form action="${pageContext.request.contextPath}/reviewWrite.do" method="post" id="reviewWriteForm">
<sec:csrfInput/>
<input type="hidden" name="contentsNo" value="${param.contentsNo}">
<div class="TableAndButtons">
<table class="table">
	<tr>
		<td>
			<input type="text" name="reviewTitle" id="reviewTitle" class="allTitle" maxlength="30" placeholder="리뷰의 제목을 입력해주세요!" required="required">	
		</td>
	</tr>
	<tr>
		<td>
			<textarea cols="90" rows="15" name="reviewContents" class="allTextArea" placeholder="리뷰의 내용을 입력해주세요!" required="required"></textarea>
		</td>
	</tr>
</table>
<div class="btnArea">
	<button type="button" class="btn-list" id="backToReviewList">리스트로이동</button>
	<button type="reset" class="btn-reset">비우기</button>
	<button type="submit" class="btn-submit">게시하기</button>
</div>
</div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewWriteForm").submit(function(){
			return confirm("리뷰를 등록 하시겠습니까?");
		});
		$("#backToReviewList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
			return location.href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${requestScope.contentsNo}'
			}else{
				return
			}
		});
	});
</script>
</div><!-- reviewWriteForm DIV 끝 -->
