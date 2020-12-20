<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$("#backToQnAList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
			return location.href='${pageContext.request.contextPath}/qnaList.do?qnaNo=${requestScope.qnaNo}'
			}else{
				return
			}
		});
		//form id로 제어한다 
		$("#qna_write").submit(function() {
			return confirm("문의를 등록하시겠습니까?");
		});
	});//ready
</script>
<div class="tableMargin">
<div class="container-lg boardClassMain">
	<div class="row">
		<div class="col-lg-12">
			<form action="${pageContext.request.contextPath}/qnaWrite.do"
				method="post" id="qna_write">
				<sec:csrfInput />
				<!--  post 방식일 때 form안에 꼭 들어가 있어야 하는 토큰 -->
				<h2>문의하기</h2><hr>
				<table class="table table-bordered" style="border-radius: 1.5px;">
				<tr>
				<td class="QnACategory">유형</td>
				<td>
					<select name="qnaTypeNo" id="QnAType">
						<option value="1">포인트</option>
						<option value="2">회원문의</option>
					</select>
				</td>
				</tr>
				<tr>
					<td class="boardTd">제목</td>
					<td><input type="text" name="qnaTitle" id="qnaTitle"  class="boardTitle" required="required" maxlength="30" placeholder="문의글 제목을 입력해주세요!"></td>
				</tr>
				<tr>
					<td class="boardCt">내용</td>
					<td>
						<textarea name="qnaContents" id="qnaContents" required="required" class="boardTextarea" placeholder="문의내용을 입력해주세요!"></textarea>
					</td>
				</tr>
		  	</table>
				<div class="btnArea">
					<button type="reset" class="btn btn-default boardDetailBtn">취소</button>
					<button type="submit" class="btn btn-default boardDetailBtn">확인</button>
					<button type="button" class="btn-list btn btn-default boardDetailBtn" id="backToQnAList">목록</button>
				</div>
			</form>
		</div>
	</div>
	</div>
	</div>