<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	
		$('#faqTitle').keyup(function(){
			if($(this).val().length>$(this).attr('maxlength')){
				alert('제목 입력은 30자까지 가능합니다!');
				$(this).val($(this).val().substr(0,$(this).attr('maxlength')));
			}
		});//keyup
		$("#faqWriteForm").submit(function(){
			return confirm("FAQ를 등록 하시겠습니까?");
		});
		$("#backToFaqList").click(function(){
			if(confirm("FAQ 목록으로 이동하시겠습니까?")){
			return location.href='${pageContext.request.contextPath}/adminFaqList.do'
			}else{
				return;
			}
		});
	});//ready
</script>
<div class="tableMargin">
	<div class="container-lg boardClassMainFaQ">
  <h2>FAQ 등록하기</h2>           
	<form action="${pageContext.request.contextPath}/faqWrite.do" method="post" id="faqWriteForm">
		<sec:csrfInput/>
		<input type="hidden" name="contentsNo" value="${param.contentsNo}">
	  	<table class="table table-bordered" style="border-radius: 1.5px;">
			<tr>
				<td class="boardTdFaQ">제목</td>
				<td><input type="text" name="faqTitle" id="faqTitle"  class="boardTitleFaQ" required="required" maxlength="30" placeholder="FAQ의 제목을 입력해주세요!"></td>
			</tr>
			<tr>
				<td class="boardCtFaQ">내용</td>
				<td>
					<textarea name="faqContents" required="required" class="boardTextareaFaQ" name="faqContents" placeholder="FAQ의 내용을 입력해주세요!"></textarea>
				</td>
			</tr>
			<tr>			
				<td colspan="2" class="btnArea" style="inline">
					<button type="button" class="btn-listFaQ btnFaQ boardDetailBtnFaQ" id="backToFaqList">목록</button>
					<button type="reset" class="btn-resetFaQ btnFaQ boardDetailBtnFaQ">초기화</button>
					<button type="submit" class="btn-submitFaQ btnFaQ boardDetailBtnFaQ">등록</button>
				</td>
			</tr>
	  	</table>
	</form>
</div>
</div>


