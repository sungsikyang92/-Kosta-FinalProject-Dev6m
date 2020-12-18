<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#faqDeleteForm").submit(function(){
			return confirm("정말 삭제하시겠습니까?");
		});//reviewDelete
		$("#faqUpdateForm").submit(function(){
			return confirm("수정 페이지로 이동 하시겠습니까?");
		});
	});//document.ready
</script>

<div class="container-lg margin-top margin-bottom boardClassMain">
  <h2>FAQ상세보기</h2>           
  <table class="table table-bordered" style="border-radius: 1.5px;">
		<tr>
			<td>조회${requestScope.fvo.faqHits}</td>
			<td>작성자${requestScope.fvo.memberVO.id}</td>
			<th class="faqPostedTime">${requestScope.fvo.faqPostedTime}</th>
		</tr>
		<tr>
			<td class="contentsTitle">제목</td>
			<th colspan="2" class="MemberId">${requestScope.fvo.faqTitle}</th>
		</tr>
		<tr class="boardDetailTr">
			<td>내용</td>
			<td colspan="2" class="reviewContents"><pre style="white-space:pre-wrap;">${requestScope.fvo.faqContents}</pre></td>
		</tr>
		<tr>		
			<td colspan="3" class="btnArea">
				<button type="button" class="btn btn-default boardDetailBtn" onclick="location.href='${pageContext.request.contextPath}/adminFaqList.do'">목록</button>
				<button form="faqDeleteForm" class="btn btn-default boardDetailBtn" type="submit">삭제</button>
				<button form="faqUpdateForm" class="btn btn-default boardDetailBtn" type="submit">수정</button>
				<form action="${pageContext.request.contextPath}/faqDelete.do" id="faqDeleteForm" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="faqNo" value="${requestScope.fvo.faqNo}">
				</form>
				<form action="${pageContext.request.contextPath}/faqUpdateForm.do" id="faqUpdateForm" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="faqNo" value="${requestScope.fvo.faqNo}">
				</form>
			</td>
		</tr>
  </table>
</div>

