<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판</title>
</head>
<body>

	<table border="1">
		<thead>
			<tr>
				<th>No</th><th>신고자ID</th><th>신고 유형</th><th>신고된 평점No</th><th>평점 작성자ID</th><th>신고 날짜</th>
			</tr>
		</thead>
		<!-- 신고 리스트(평점) -->
		<tbody>
			<c:forEach var="rvo" items="${requestScope.ReportCommentsList.list}">
				<tr>
					<td>${rvo.reportNo}</td>
					<td>${rvo.memberVO.id}</td>
					<td>${rvo.reportTypeVO.reportTypeNo}</td>
					<td>${rvo.commentsVO.commentsNo}</td>
					<td>${rvo.commentsVO.memberVO.id}</td>
					<td>${rvo.reportPostedTime}</td>
				</tr>
			</c:forEach>
		</tbody>
		<!-- 페이징 -->
		<tfoot>
			<tr>
				<td colspan="6">
					<div>
						<!-- pagingBean을 pb변수로 지정 -->
						<c:set var="pb" value="${requestScope.ReportCommentsList.pagingBean }"></c:set>
						<ul>
							<!-- 조건이 맞으면 왼쪽 화살표 -->
							<c:if test="${pb.previousPageGroup}">
								<li>
									<a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pb.startPageOfPageGroup-1}">
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
											<a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pageNumber}">
												${pageNumber}
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pageNumber}">
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
									<a href="${pageContext.request.contextPath }/reportCommentsBoardNext.do?pageNo=${pb.endPageOfPageGroup+1}">
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
	<h5>이 구간은 test 구간</h5>
	<!-- comments 신고 폼 test -->
	<script type="text/javascript">
		function reportPopup(commentsNo, commentsWriter){
			//alert(commentsNo +", "+ commentsWriter);
			// commentsWriter id 혹은 네임 변수에 맞게 수정할 것
			var path = "${pageContext.request.contextPath}/reportCommentsForm.do?commentsNo="+commentsNo+"&&"+"commentsWriter="+commentsWriter;
			window.open(path, "reportComments","width=465, height=180, top=150, left=200");
			
		}
	</script>
    	<table>
    		<tbody>
    			<c:forEach var="rvo" items="${requestScope.ReportCommentsList.list}" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${rvo.reportNo}</td>
						<td>${rvo.commentsVO.memberVO.id}</td>
						<td>${rvo.reportPostedTime}</td>
						<!-- 신고 버튼 : reportPopup함수에 변수값을 넣어서 보낸다 -->
						<td><button onclick="reportPopup(${rvo.commentsVO.commentsNo},'${rvo.commentsVO.memberVO.id}')" >test</button></td>
					</tr>
				</c:forEach>
    		</tbody>
    	</table>    	
</body>
</html>

























