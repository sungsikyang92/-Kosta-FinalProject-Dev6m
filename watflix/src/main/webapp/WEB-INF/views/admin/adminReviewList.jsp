<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
//리뷰 디테일 팝업
function reviewDetailPopup(reviewNo){
	// popup
	var path = "${pageContext.request.contextPath}/reviewByReviewNo.do?reviewNo="+reviewNo;
	window.open(path, "commentsByComments","width=1000, height=420, top=150, left=200");
	
}
</script>
<div class="container-lg margin-top margin-bottom" style="margin:100px auto;">
<div class="container boardClassMain" style="border-radius: 1.5px;">
  <h4>리뷰리스트</h4>
  <c:if test="${requestScope.forNotUsePagingAndBtn != false}">
  <a href="reviewList.do?pageNo=1" style="float: right">더보기</a>         
  </c:if>   
  <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
    <thead>
      <tr>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>추천</th>
		<th>조회</th>
      </tr>
    </thead>
   <tbody>
		<c:forEach var="reviewList" items="${requestScope.reviewList.reviewList}">
			<tr>
				<!-- 리뷰제목 불러오기 -->
				<td><a href="#"  onclick="reviewDetailPopup(${reviewList.reviewNo});return false;">${reviewList.reviewTitle}</a></td>
				<td>${reviewList.memberVO.id}</td>					<!-- 리뷰작성자 불러오기 -->
				<td>${reviewList.reviewPostedTime}</td>				<!-- 리뷰작성일 불러오기 -->
				<td>${reviewList.reviewLikes}</td>					<!-- 리뷰추천수 불러오기 -->
				<td >${reviewList.reviewHits}</td>					<!-- 리뷰조회수 불러오기 -->
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
<div class="pagingInfo" id="pagingLocation">
	<c:set var="pagingBean" value="${requestScope.reviewList.pagingBean}"/>
	<ul class="pagination">
		<c:if test="${pagingBean.previousPageGroup}">		<!-- 이전 페이지으로 넘어갈 만큼 충분한 게시글이있으면 '<<' 페이지 넘기기 버튼이 생성된다. -->
		<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${pagingBean.startPageOfPageGroup-1}">&laquo;</a></li>	<!-- $laquo는 페이징에 나타나는'<<'왼쪽페이지 버튼이다. -->
		</c:if>
		<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pagingBean.nowPage != i}">
					<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pagingBean.nextPageGroup}">			<!-- 다음 페이지로 넘어갈 만큼 충분한 게시글이 있으면 '>>' 페이지 넘기기 버튼이 생성된다. -->
			<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${pagingBean.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div><!-- 페이징 DIV 끝 -->
</div><!-- 페이징과 리뷰작성을 감싸는 DIV 끝 -->
</c:if>
</div><!-- reviewList페이지 DIV 끝-->
</div>
