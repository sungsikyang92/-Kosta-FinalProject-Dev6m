<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 공지사항 게시판 목록 jsp -->
<script>
	$(document).ready(function(){
		<!-- 공지사항 게시글 작성 폼으로 이동하는 메소드 -->
		$("#noticeWriteButton").click(function(){
			location.href="noticeWriteForm.do";
		})
		$("#checkAll").click(function(){
			if($(this).is(":checked")){
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		})
		$("#deleteNoticeByCheckboxForm").submit(function(){
			var deleteCount = $("input[name='deleteCheckbox']:checked").length;
			if(deleteCount == 0){
				alert("삭제할 글을 선택해주세요.");
				return false;
			} else {
				return confirm("삭제하시겠습니까?");
			}
					
		})
	})
</script>
<div class="container-lg" style="margin-top: 90px">
	<h4>공지사항</h4>
	<!-- 공지사항 게시글 작성 폼으로 이동하는 버튼, ROLE_ADMIN 권한을 가진 관리자에게만 노출한다. -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<!-- 자바스크립트 메소드를 호출한다. -->
	<button type="button" id="noticeWriteButton">글쓰기</button>
	</sec:authorize>
	<form action="${pageContext.request.contextPath}/noticeDeleteByCheckbox.do"
	id="deleteNoticeByCheckboxForm" method="post">
	<sec:csrfInput/>
	<table class="table table-hover">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>아이디</td>
			<td>작성일자</td>
			<td>조회수</td>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<td><input type="checkbox" id="checkAll"></td>
			</sec:authorize>
		</tr>
		<c:forEach items="${requestScope.noticeList.list}" var="noticeList">
		<tr>
			<td>${noticeList.noticeNo}</td>
			<td>
				<a href="${pageContext.request.contextPath}/noticeDetail.do?noticeNo=${noticeList.noticeNo}&pageNo=${requestScope.noticeList.pagingBean.nowPage}">
					${noticeList.noticeTitle}</a> <!-- 공지사항 자세히보기 링크 -->
			</td>
			<td>${noticeList.memberVO.id}</td>
			<td>${noticeList.noticePostedTime}</td>
			<td>${noticeList.noticeHits}</td>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<td><input type="checkbox" value="${noticeList.noticeNo}" name="deleteCheckbox"></td>
			</sec:authorize>
		</tr>
		</c:forEach>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<tr>
			<td colspan="5"></td>
			<td>
				<input type="hidden" name="pageNo" value="${requestScope.noticeList.pagingBean.nowPage}">
				<input type="submit" value="삭제">
			</td>
		</tr>
		</sec:authorize>
	</table>
	</form>
<div class="pagingInfo">
	<c:set var="pagingBean" value="${requestScope.noticeList.pagingBean}"></c:set>
		<ul class="pagination">
		<c:if test="${pagingBean.previousPageGroup}">
		<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pagingBean.nowPage!=i}">
					<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
			&nbsp;
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">
			<li><a href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div><!-- pagingInfo -->
</div> <!-- container-fluid -->
<!-- </body>
</html> -->