<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$("#reviewTitle").keyup(function(){
			if($(this).val().length>$(this).attr("maxlength")){
				alert("제목 입력은 30자까지 가능합니다!");
				$(this).val($(this).val().substr(0,$(this).attr("maxlength")));
			}
		});//keyup
		$("#reviewWriteForm").submit(function(){
			if($("#reviewTitle").val().trim() == ""){
				alert("리뷰 제목 공란으로는 등록이 불가능합니다!");
				return false;
			}else if($("#reviewContents").val().trim() == ""){
				alert("리뷰 내용 공란으로는 등록이 불가능합니다!")
				return false;
			}else{
				return confirm("리뷰를 등록 하시겠습니까?");
			}
		});
		$("#backToReviewList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
			return location.href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${requestScope.contentsNo}'
			}else{
				return
			}
		});
	});//ready
</script>
<div class="tableMargin">
	<div class="container-lg  boardClassMain">
	  <h2>리뷰 등록하기</h2>           
		<form action="${pageContext.request.contextPath}/reviewWrite.do" method="post" id="reviewWriteForm">
			<sec:csrfInput/>
			<input type="hidden" name="contentsNo" value="${param.contentsNo}">
		  	<table class="table table-bordered" style="border-radius: 1.5px;">
				<tr>
					<td class="boardTd">제목</td>
					<td><input type="text" name="reviewTitle" id="reviewTitle"  class="boardTitle" required="required" maxlength="30" placeholder="리뷰의 제목을 입력해주세요!"></td>
				</tr>
				<tr>
					<td class="boardCt">내용</td>
					<td>
						<textarea name="reviewContents" id="reviewContents" required="required" class="boardTextarea" placeholder="리뷰의 내용을 입력해주세요!"></textarea>
					</td>
				</tr>
				<tr>			
					<td colspan="2" class="btnArea">
						<button type="button" class="btn-list btn btn-default boardDetailBtn" id="backToReviewList">목록</button>
						<button type="reset" class="btn-reset btn btn-default boardDetailBtn">초기화</button>
						<button type="submit" class="btn btn-default boardDetailBtn">등록</button>
					</td>
				</tr>
		  	</table>
		</form>
	</div>
</div>