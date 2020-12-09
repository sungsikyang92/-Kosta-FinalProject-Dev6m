<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- reviewList페이지 DIV -->
<div class="tableMargin" id="reviewList">
<div class="container-lg">
  <h3><p align="center">리뷰리스트ByContentsNo.${requestScope.contentsNo}</p></h3>          
  <table class="table table-hover">
    <thead>
      <tr>
		<th class="reviewTitle">제목</th>
		<th class="reviewWriter">작성자</th>
		<th class="reviewDate">작성일</th>
		<th class="reviewLikes">추천</th>
		<th class="reviewHits">조회</th>
      </tr>
    </thead>
   <tbody>
		<c:forEach var="rvoc" items="${requestScope.reviewListByContentsNo.reviewList}">
			<tr style=" border-bottom: 1px solid #ddd;">
				<!-- 리뷰제목 불러오기 -->
				<td><a href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${rvoc.reviewNo}">${rvoc.reviewTitle}</a></td>
				<td>${rvoc.memberVO.id}</td>					<!-- 리뷰작성자 불러오기 -->
				<td>${rvoc.reviewPostedTime}</td>				<!-- 리뷰작성일 불러오기 -->
				<td>${rvoc.reviewLikes}</td>					<!-- 리뷰추천수 불러오기 -->
				<td>${rvoc.reviewHits}</td>						<!-- 리뷰조회수 불러오기 -->
			</tr>	
		</c:forEach>
	</tbody>
  </table>
</div>
<!-- 페이징과 리뷰작성을 감싸는 DIV -->
<div>
<!-- 페이징 DIV -->
<div class="pagingInfo" id="pagingLocation">
	<c:set var="rpbc" value="${requestScope.reviewListByContentsNo.pagingBean}"/>
	<ul class="pagination">
		<c:if test="${rpbc.previousPageGroup}">		<!-- 이전 페이지으로 넘어갈 만큼 충분한 게시글이있으면 '<<' 페이지 넘기기 버튼이 생성된다. -->
		<li><a href="${pageContext.request.contextPath}/contentsDetail.do?pageNo=${rpbc.startPageOfPageGroup-1}&contentsNo=${requestScope.contentsNo}">&laquo;</a></li>	<!-- $laquo는 페이징에 나타나는'<<'왼쪽페이지 버튼이다. -->
		</c:if>
		<c:forEach var="i" begin="${rpbc.startPageOfPageGroup}" end="${rpbc.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${rpbc.nowPage != i}">
					<li><a href="${pageContext.request.contextPath}/contentsDetail.do?pageNo=${i}&contentsNo=${requestScope.contentsNo}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${rpbc.nextPageGroup}">			<!-- 다음 페이지로 넘어갈 만큼 충분한 게시글이 있으면 '>>' 페이지 넘기기 버튼이 생성된다. -->
			<li><a href="${pageContext.request.contextPath}/contentsDetail.do?pageNo=${rpbc.endPageOfPageGroup+1}&contentsNo=${requestScope.contentsNo}">&raquo;</a></li>
		</c:if>
	</ul>
</div><!-- 페이징 DIV 끝 -->
<!-- 리뷰작성 DIV -->
<div>
<button type="button" class="btn-submit" style="width: 126px;" onclick="location.href = '${pageContext.request.contextPath}/reviewWriteForm.do?contentsNo=${requestScope.contentsNo}' ">리뷰작성하기</button>
</div><!-- 리뷰작성 DIV 끝 -->
</div><!-- 페이징과 리뷰작성을 감싸는 DIV 끝 -->
</div><!-- reviewList페이지 DIV 끝-->
