<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
 <script type="text/javascript">
	$(document).ready(function(){
		$('#faqTitle').keyup(function(){
			if($(this).val().length>$(this).attr('maxlength')){
				alert('제목 입력은 30자까지 가능합니다!');
				$(this).val($(this).val().substr(0,$(this).attr('maxlength')));
			}
		});//keyup
		$("#faqUpdate").submit(function(){
			return confirm("FAQ를 수정 하시겠습니까?");
		});	//confirm reviewUpdate function
		$("#backToFaqDetail").click(function(){
			if(confirm("이전페이지로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/faqDetailNoHitsForAdmin.do?faqNo=${fvo.faqNo}"
			}else{
				return
			}
		});	//backToReviewDetail function
	});	//ready
</script>
<div class="tableMargin">
	<div class="container-lg boardClassMainFaQ">
  <h2>FAQ 수정하기</h2>           
	<form action="${pageContext.request.contextPath}/faqUpdate.do" method="post" id="faqUpdate">
		<sec:csrfInput/>
		<input type="hidden" name="faqNo" value="${fvo.faqNo}">
	  	<table class="table table-bordered" style="border-radius: 1.5px;">
			<tr>
				<td class="boardTdFaQ">제목</td>
				<td><input type="text" name="faqTitle" id="faqTitle" class="boardTitleFaQ" value="${fvo.faqTitle}" required="required" placeholder="FAQ의 제목을 입력해주세요!"></td>
			</tr>
			<tr>
				<td class="boardCtFaQ">내용</td>
				<td>
					<textarea name="faqContents" required="required" class="boardTextareaFaQ" placeholder="FAQ의 내용을 입력해주세요!">${fvo.faqContents}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btnArea">
					<button type="button" class="btn-listFaQ btnFaQ boardDetailBtnFaQ" id="backToFaqDetail">이전페이지</button>
					<button type="reset" class="btn-listFaQ btnFaQ boardDetailBtnFaQ">초기화</button>
					<button type="submit" class="btn-listFaQ btnFaQ boardDetailBtnFaQ" >수정</button>
				</td>
			</tr>
	  	</table>
	</form>
</div>
</div>