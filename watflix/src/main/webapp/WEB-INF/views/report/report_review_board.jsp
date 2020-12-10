<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판</title>
<!-- 테스트 중인 css 나중에 지울것 -->
  <style type="text/css">
	.table-hover{
		background: white;
		/* table 중앙 정렬 */
		margin:auto;
		width: 55%;
		text-align: center;
	}
	a{
		color: black;
	}
  </style>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<script type="text/javascript">
		function deleteCheck(){
			return confirm("삭제하시겠습니까?");
		}
	</script>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>리뷰</th><th><a href="${pageContext.request.contextPath}/reportCommentsBoard.do">평점</a></th>
			</tr>
			<tr>
				<th>No</th>
				<th>신고자ID</th>
				<th>신고 유형</th>
				<th>신고된 리뷰No</th>
				<th>리뷰 작성자ID</th>
				<th>신고 날짜</th>
				<th>비고</th>
			</tr>
		</thead>
		<!-- 신고 리스트(리뷰) -->
		<tbody>
			<c:forEach var="rvo" items="${requestScope.reportReviewList.list}">
				<tr>
					<td>${rvo.reportNo}</td>
					<td>${rvo.memberVO.id}</td>
					<td>${rvo.reportTypeVO.reportTypeInfo}</td>
					<td>${rvo.reviewVO.reviewNo}</td>
					<td>${rvo.reviewVO.memberVO.id}</td>
					<td>${rvo.reportPostedTime}</td>
					<td>
						<!-- 신고글 삭제 -->
						<form action="deleteReport.do" method="post" onsubmit="return deleteCheck()">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="reportNo" value="${rvo.reportNo}">
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
						<!-- ReviewController 참고 후 수정 -->
						<form action="" method="post">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="" value="${rvo.reviewVO.reviewNo}">
							<input type="hidden" name="commentsNo" value="${rvo.commentsVO.commentsNo}">
							<input type="submit" value="deleteComments">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<!-- 페이징 -->
		<tfoot>
			<tr>
				<td colspan="7">
					<div class="tableTopMargin">
						<!-- pagingBean을 pb변수로 지정 -->
						<c:set var="pb" value="${requestScope.reportReviewList.pagingBean }"></c:set>
						<ul class="pagination">
							<!-- 조건이 맞으면 왼쪽 화살표 -->
							<c:if test="${pb.previousPageGroup}">
								<li>
									<a href="${pageContext.request.contextPath }/reportReviewBoardNext.do?pageNo=${pb.startPageOfPageGroup-1}">
										&laquo;
									</a>
								</li>
							</c:if>
							<!-- 페이지 넘버 표시 -->
							<c:forEach var="pageNumber"
								begin="${pb.startPageOfPageGroup}"
								end="${pb.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${pb.nowPage!=pageNumber }">
										<li>
											<a href="${pageContext.request.contextPath }/reportReviewBoardNext.do?pageNo=${pageNumber}">
												${pageNumber}
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="#">
												${pageNumber }
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								&nbsp;
							</c:forEach>
							<!-- 조건에 맞으면 오른쪽 화살표 -->
							<c:if test="${pb.nextPageGroup}">
								<li>
									<a href="${pageContext.request.contextPath }/reportReviewBoardNext.do?pageNo=${pb.endPageOfPageGroup+1}">
										&raquo;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	
	
    <hr>
    <h5>신고 테스트 구간입니다.</h5>
	<!-- 신고 폼 test -->
	<script type="text/javascript">
		function reportPopup(){
			// 게시판No, 작성자 id 혹은 name을 가져와야함
			var path = "${pageContext.request.contextPath}/reportReviewForm.do?";
			window.open(path, "reportReview","width=465, height=180, top=150, left=200");
		}
	</script>
	<!-- 신고 버튼 -->
	<input type="button" value="신고 한다" onclick="reportPopup()">
    <hr>
    	<table>
    		<tbody>
    			<c:forEach var="rvo" items="${requestScope.reportReviewList.list}" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${rvo.reportNo}</td>
						<td>
							
						</td>
						<td>${rvo.commentsVO.memberVO.id}</td>
						<td>${rvo.reportPostedTime}</td>
						<td><input type="hidden" id="delete${status.count }" name="" value=""></td>
						<td><button onclick="reportPopup()" ></button></td>
					</tr>
				</c:forEach>
    		</tbody>
    	</table>
</body>
</html>