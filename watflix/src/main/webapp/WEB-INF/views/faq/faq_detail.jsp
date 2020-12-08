<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<title>FAQ Detail Page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
	<div class="container-lg">
<div id="faqForm">
<script type="text/javascript">
function updateBtn() {
	// alert("업뎃버튼을 눌렀츄");
	location.href="${pageContext.request.contextPath}/faqUpdateForm.do?faqNo="+${requestScope.fvo.faqNo};
}
	function faqListBtn(){
	location.href="${pageContext.request.contextPath}/faqList.do";
}
</script>
<hr>
<hr>
<hr>
<table class="table table-hover">
	<thead>
		<tr>
			<th class="faqNo">NO</th>
			<th class="faqTitle"></th>
			<th class="faqWriter"></th>
			<th class="faqPostedTime"></th>
			<th class="faqDetail"></th>
		</tr>
	</thead>
	<tbody>	
			<tr>
				<td>${requestScope.fvo.faqNo}</td>
				<td>${requestScope.fvo.faqTitle}</td>
				<td>${requestScope.fvo.memberVO.id}</td>
				<td>${requestScope.fvo.faqPostedTime}</td>
			</tr>
			<tr>
			<td colspan="4"><div style="margin:0 auto;" ><pre style="white-space:pre-wrap;" ><br><br>${requestScope.fvo.faqContents}</pre></div></td>
			</tr>
	</tbody>

</table>
<div class="faqBtn">
<button id="updateBtn" onclick="updateBtn()">수정</button>
<button form="faqDelete" type="submit" id="faq-delete-btn" >삭제</button>
<button id="faqListBtn" onclick="faqListBtn()">목록</button>
<br><br>
<button id="qnaBtn" onclick="">문의하기</button>
</div>
<form action="faqDelete.do" id="faqDelete" method="post">
<sec:csrfInput/>
<input type="hidden" name="faqNo" value="${requestScope.fvo.faqNo}">
</form>
</div>
</div>





