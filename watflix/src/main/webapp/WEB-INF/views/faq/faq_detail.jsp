<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript">
function updateBtn() {
	
	location.href="${pageContext.request.contextPath}/faqUpdateForm.do?faqNo="+${requestScope.fvo.faqNo};
}
	function faqListBtn(){
	location.href="${pageContext.request.contextPath}/faqList.do";
}
	function qnaListBtn() {
	location.href="${pageContext.request.contextPath}/qnaWriteForm.do";
	}
</script>
<div class="tableMargin" id="commentsList">
<div class="container-lg boardClassMain">
<!-- <div id="faqForm"> -->
<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
		<tr>
			<td>제목</td>
			<td colspan="7">${requestScope.fvo.faqTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="7"><div style="margin:0 auto;" ><pre style="white-space:pre-wrap;" >${requestScope.fvo.faqContents}</pre></div></td>
		</tr>
		<tr>
			<td>NO</td><td>${requestScope.fvo.faqNo}</td>
			<td>조회수</td><td>${requestScope.fvo.faqHits}</td>
			<td>작성자</td><td>${requestScope.fvo.memberVO.id}</td>
			<td>작성시간</td><td>${requestScope.fvo.faqPostedTime}</td>
		</tr>	
</table>
<div class="faqBtn">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button id="updateBtn" onclick="updateBtn()">수정</button>
<button form="faqDelete" type="submit" id="faq-delete-btn" >삭제</button>
</sec:authorize>
<button id="faqListBtn" onclick="faqListBtn()">목록</button>
<br><br>
<button id="qnaBtn" onclick="qnaListBtn()">문의하기</button>
</div>
<form action="faqDelete.do" id="faqDelete" method="post">
<sec:csrfInput/>
<input type="hidden" name="faqNo" value="${requestScope.fvo.faqNo}">
</form>
<!-- </div> -->
</div>
</div>






