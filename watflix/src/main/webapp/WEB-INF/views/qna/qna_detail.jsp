<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
	<div class="container-lg">
<div id="qnaForm">
<script type="text/javascript">
	function qnaListBtn() {
	location.href="${pageContext.request.contextPath}/qnaList.do";
	}
</script>
<hr>
<hr>
<hr>
<table class="table table-hover">
	<thead>
		<tr>
			<th class="qnaNo">NO</th>
			<th class="qnaTypeNo">문의</th>
			<th class="qnaTitle"></th>
			<th class="qnaWriter"></th>
			<th class="qnaPostedTime"></th>
			<th class="qnaDetail"></th>
		</tr>
	</thead>
	<tbody>	
			<tr>
				<td>${requestScope.qvo.qnaNo}</td>
				<td>${requestScope.qvo.qnaTypeVO.qType}</td>
				<td>${requestScope.qvo.qnaTitle}</td>
				<td>${requestScope.qvo.memberVO.id}</td>
				<td>${requestScope.qvo.qnaPostedTime}</td>
			</tr>
			<tr>
			<td colspan="4"><div style="margin:0 auto;" ><pre style="white-space:pre-wrap;" ><br><br>${requestScope.qvo.qnaContents}</pre></div></td>
			</tr>
	</tbody>

</table>
<div class="qnaBtn">
<sec:authorize access="hasRole('ROLE_ADMIN')">
<button form="qnaDelete" type="submit" id="qna-delete-btn" >삭제</button>
</sec:authorize>
<button id="qnaListBtn" onclick="qnaListBtn()">내 문의 목록 보기</button>

<br><br>
</div>
<form action="qnaDelete.do" id="qnaDelete" method="post">
<sec:csrfInput/>
<input type="hidden" name="qnaNo" value="${requestScope.qvo.qnaNo}">
</form>
</div>
</div>
</html>

