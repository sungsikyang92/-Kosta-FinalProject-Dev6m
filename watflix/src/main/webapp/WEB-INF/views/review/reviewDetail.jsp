<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- reviewDetail 감싸는 DIV 시작 -->
<div class="tableMargin">
<!-- Table 부트스트랩 끝 -->
<!-- JQuery에용 ㅎㅎ -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewDelete").submit(function(){
			return confirm("정말 삭제하시겠습니까?");
		});//reviewDelete
		$("#reviewUpdateForm").submit(function(){
			return confirm("수정 페이지로 이동 하시겠습니까?");
		});
	});//ready
</script>
<table class="table table-hover" style="color:white">
	<c:set var="reviewDetail" value="${requestScope.rdvo}"></c:set>
		<tr>
			<th class="reviewTitle">${reviewDetail.reviewTitle}</th>
			<th class="reviewHits">조회${reviewDetail.reviewHits}</th>
			<th class="reviewLikes">추천${reviewDetail.reviewLikes}</th>
			<th class="reportBtn"><a href="#">신고</a></th>
		</tr>
		<tr>
			<td class="contentsTitle">${requestScope.contentsTitle}리뷰</td>
			<th colspan="2" class="MemberId">${reviewDetail.memberVO.id}의 모든리뷰보기(모든리뷰보기만드냐?)</th>
			<th class="reviewPostedTime">${reviewDetail.reviewPostedTime}</th>
		</tr>
		<tr>
			<td width="20%" colspan="4" class="reviewContents"><pre style="white-space:pre-wrap;">${reviewDetail.reviewContents}</pre></td>
		</tr>
		<tr>			<!-- 임시로 align="center"줘서 중앙배열 시켜놓음 CSS로 해야함 -->
			<td colspan="4" class="btnArea" align="center">
				<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${reviewDetail.contentsVO.contentsNo}'">목록</button>
				<button form="reviewDelete" class="btn btn-default" type="submit">삭제</button>
				<button form="reviewUpdateForm" class="btn btn-default" type="submit">수정</button>
				<form action="reviewDelete.do" id="reviewDelete" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
				</form>
				<form action="reviewUpdateForm.do" id="reviewUpdateForm" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
				</form>
			</td>
		</tr>
</table>
</div><!-- reviewDetail 감싸는 DIV 끝 -->