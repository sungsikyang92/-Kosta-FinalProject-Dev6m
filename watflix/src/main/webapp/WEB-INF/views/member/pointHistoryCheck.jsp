<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function(){
	//포인트조회 클릭시 비동기로 해당 데이터 가져오기
	$("#pointSelect").click(function(){
		$.ajax(function(){
			type:"get",
			url:"${pageContext.request.contextPath}/memberPointCheck.do",
			success:function(result){
				donate(result);
			}
		})
	})
	$("#pointHistoryCheck").click(function(){
		location.href="${pageContext.request.contextPath}/memberPointHistoryCheck.do";
	})
})
function donate(result){

	
}
</script>

<div class="container boardClassMain">
	<nav class="nav nav-fill nav-pills" id="explore-tabs" role="tablist">
           <a class="nav-item nav-link active" id="pointHistoryCheck" data-toggle="pill" href="#" aria-selected="true">
               <div class="icon-nav">
                   포인트사용내역
               </div>
           </a>
           <a class="nav-item nav-link" id="pointCheck" data-toggle="pill" href="#" aria-selected="false">
               <div class="icon-nav">
                   포인트 조회
               </div>
           </a>
       </nav>       
  <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
    <thead>
      <tr>
		<th>사용자명</th>
		<th>컨텐츠명</th>
		<th>리뷰제목</th>
		<th>평점제목</th>
		<th>주문번호</th>
		<th>포인트내역</th>
		<th>사용내역</th>
		<th>시간</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="phVO" items="${requestScope.pointHistoryListVO.pointHistoryList}">
			<tr>
				<td>${phVO.id}</td>
				<!--리뷰로 인해 받은 포인트인지, 평점으로 인해 받은 포인트인지에 따른 컨텐츠명 출력  -->
				<c:choose>
					<c:when test=""></c:when>
					<c:otherwise></c:otherwise>
				
				</c:choose>					
				<td>${phVO.id}</td>					
				<td><a href="${pageContext.request.contextPath}/reviewDetail.do?reviewNo=${phVO.reviewVO.reviewNo}">${phVO.reviewVO.reviewTitle}</a></td>				
				<td>${phVO.commentsVO.comments}</td>					
				<td><a href="${pageContext.request.contextPath}/">${phVO.productOrderVO.orderNo}</a></td>						
				<td>${phVO.point}</td>						
				<td>${phVO.pointHistoryContents}</td>						
				<td>${phVO.currentTime}</td>						
			</tr>	
		</c:forEach>
	</tbody>
  </table>
	<div class="boardBottomDiv">
		<div class="pagingInfo" id="pagingLocation">
			<c:set var="rpbc" value="${requestScope.pointHistoryListVO.pagingBean}"/>
			<ul class="pagination">
				<c:if test="${rpbc.previousPageGroup}">		
				<li><a href="${pageContext.request.contextPath}/contentsDetail.do?pageNo=${rpbc.startPageOfPageGroup-1}">&laquo;</a></li>	
				</c:if>
				<c:forEach var="i" begin="${rpbc.startPageOfPageGroup}" end="${rpbc.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${rpbc.nowPage != i}">
							<li><a href="${pageContext.request.contextPath}/contentsDetail.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${rpbc.nextPageGroup}">	
					<li><a href="${pageContext.request.contextPath}/contentsDetail.do?pageNo=${rpbc.endPageOfPageGroup+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>