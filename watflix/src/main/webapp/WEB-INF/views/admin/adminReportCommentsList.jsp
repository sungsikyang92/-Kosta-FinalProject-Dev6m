<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<script type="text/javascript">
		function deleteCheck(){
			return confirm("삭제하시겠습니까?");
		}
	</script>
	<div class="container-lg margin-top margin-bottom" style="margin:100px auto;">
	<div class="container boardClassMain" style="border-radius: 1.5px;">
	<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
		<thead>
			<tr>
				<th><a href="${pageContext.request.contextPath}/reportReviewBoard.do">리뷰</a></th><th>평점</th>
			</tr>
			<tr>
				<th>No</th>
				<th>신고자ID</th>
				<th>신고 유형</th>
				<th>신고된 평점No</th>
				<th>평점 작성자ID</th>
				<th>신고 날짜</th>
				<th>비고</th>
			</tr>
		</thead>
		<!-- 신고 리스트(평점) -->
		<tbody>
			<c:forEach var="rvo" items="${requestScope.reportCommentsList.list}">
				<tr>
					<td>${rvo.reportNo}</td>
					<td>${rvo.memberVO.id}</td>
					<td>${rvo.reportTypeVO.reportTypeInfo}</td>
					<td>${rvo.commentsVO.commentsNo}</td>
					<td>${rvo.commentsVO.memberVO.id}</td>
					<td>${rvo.reportPostedTime}</td>
					<td>
						<!-- 신고글 삭제 -->
						<form action="deleteReport.do" method="post" onsubmit="return deleteCheck()">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="reportNo" value="${rvo.reportNo}">
							<input type="hidden" name="commentsNo" value="${rvo.commentsVO.commentsNo}">
							<input type="submit" value="deleteReport">
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<pre>${rvo.reportContents }</pre>
					</td>
					<td>
						<!-- 신고된 평점 삭제 -->
						<!-- CommentsController 참고 후 수정 -->
						<form action="" method="post">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="" value="${rvo.commentsVO.commentsNo}">
							<input type="submit" value="deleteComments">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!--
	전체게시물조회 메인화면에서 페이징과 버튼을 사용하지 않기 위해 사용한다.
	tiles를 통해서 불러오는 리스트의 경우 forNotUsePagingAndBtn의 값은 true
	-->
	<c:if test="${requestScope.forNotUsePagingAndBtn != true}">
	<div class="boardBottomDiv">
		<!-- 페이징 -->
		<div class="pagingInfo" id="pagingLocation">
			<!-- pagingBean을 pb변수로 지정 -->
			<c:set var="pb" value="${requestScope.reportCommentsList.pagingBean }"></c:set>
				<ul class="pagination">
					<!-- 조건이 맞으면 왼쪽 화살표 -->
					<c:if test="${pb.previousPageGroup}">
						<li><a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:if>
					<!-- 페이지 넘버 표시 -->
					<c:forEach var="pageNumber"	begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=pageNumber}">
								<li><a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pageNumber}">${pageNumber}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#">${pageNumber }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						<!-- 조건에 맞으면 오른쪽 화살표 -->
						<c:if test="${pb.nextPageGroup}">
							<li><a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
						</c:if>
						</ul>
					</div>
				</div>
			</c:if>
</div>
</div>
























