<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ajax 페이징 -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		function reviewPaging(reviewPageNo){
			// 테이블에 집어넣을 문자열 데이터 변수
			var reviewTbody = "";
			var reportTfoot ="";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myReviewList.do?pageNo="+reviewPageNo,
				success:function(data){
					//table의 tbody
					for (var i = 0; i < data.reviewList.length; i++){
						reviewTbody += "<tr>";
							reviewTbody += "<th><a href=\"${pageContext.request.contextPath}/reviewDetailNoHits.do?reviewNo="+data.reviewList[i].reviewNo+"\">"+ data.reviewList[i].reviewTitle + "</a></th>";
							reviewTbody += "<th>"+ data.reviewList[i].reviewPostedTime + "</th>";
							reviewTbody += "<th>"+ data.reviewList[i].reviewLikes +"</th>";
							reviewTbody += "<th>"+ data.reviewList[i].reviewHits +"</th>";
						reviewTbody += "</tr>";
					}
					$("#reviewTbody").html(reviewTbody);
					
					// table 페이징
					var startPageGroup = data.pagingBean.startPageOfPageGroup;
					var endPageGroup = data.pagingBean.endPageOfPageGroup;
					// 왼쪽 페이징 화살표
					if (data.pagingBean.previousPageGroup){
						reportTfoot += "<li><a href=\"#\" onclick=\"reviewPaging("+ (startPageGroup -1) +");return false;\">&laquo;</a></li>";
					}
					// 페이징 번호
					for (var reviewPageNo = startPageGroup; reviewPageNo < endPageGroup + 1; reviewPageNo++){
						if(data.pagingBean.nowPage != reviewPageNo){
							reportTfoot += "<li><a href=\"#\" onclick=\"reviewPaging("+ reviewPageNo +");return false;\">"+ reviewPageNo +"</a></li>";
						}else{
							reportTfoot += "<li><a href=\"#\" onclick=\"return false\">"+ reviewPageNo +"</a></li>";
						}
					}
					// 오른쪽 화살표 페이징
					if(data.pagingBean.nextPageGroup){
						reportTfoot += "<li><a href=\"#\" onclick=\"reviewPaging("+ (endPageGroup + 1) +");return false\">&raquo;</a></li>";
					}
					$("#reviewPaging").html(reportTfoot);
				}
			})
		}
	</script>
	<div class="container boardClassMain">
	  <h2>리뷰리스트</h2>           
	  <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
	    <thead>
	      <tr>
			<th>제목</th>
			<th>작성일</th>
			<th>추천</th>
			<th>조회</th>
	      </tr>
	    </thead>
	    <tbody id="reviewTbody">
			<c:forEach var="rvoc" items="${requestScope.reviewListVO.reviewList}">
				<tr>
					<!-- 리뷰제목 불러오기 -->
					<td><a href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${rvoc.reviewNo}">${rvoc.reviewTitle}</a></td>
					<td>${rvoc.reviewPostedTime}</td>				<!-- 리뷰작성일 불러오기 -->
					<td>${rvoc.reviewLikes}</td>					<!-- 리뷰추천수 불러오기 -->
					<td>${rvoc.reviewHits}</td>						<!-- 리뷰조회수 불러오기 -->
				</tr>	
			</c:forEach>
		</tbody>
	  </table>
		<div class="boardBottomDiv">
			<div class="pagingInfo" id="pagingLocation">
				<c:set var="rpbc" value="${requestScope.reviewListVO.pagingBean}"/>
				<ul class="pagination" id = "reviewPaging">
					<c:forEach var="i" begin="${rpbc.startPageOfPageGroup}" end="${rpbc.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${rpbc.nowPage != i}">
								<li><a href="#" onclick="reviewPaging(${i});return false;">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#" onclick="return false">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${rpbc.nextPageGroup}">			<!-- 다음 페이지로 넘어갈 만큼 충분한 게시글이 있으면 '>>' 페이지 넘기기 버튼이 생성된다. -->
						<li><a href="#" onclick="reviewPaging(${rpbc.endPageOfPageGroup+1});return false;">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>