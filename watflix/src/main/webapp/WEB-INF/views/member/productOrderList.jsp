<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
$(document).ready(function(){
})//ready종료
</script>
<div class="tableMargin">
<div class="container boardClassMain">
<h2 align="center">주문내역</h2>  
  <div class="middleBox">       
  <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
    <thead>
      <tr>
		<th>상품명</th>
		<th>상품브랜드</th>
		<th>주문일자</th>
		<th>주문번호</th>
		<th>수량</th>
		<th>사용포인트</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="poVO" items="${requestScope.productOrderListVO.productOrderList}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/productDetailForUser.do?productNo=${poVO.productVO.productNo}">${poVO.productVO.productName}</a></td>
				<td>${poVO.productVO.productBrand}</td>
				<td>${poVO.purchasedTime}</td>
				<td><a href="${pageContext.request.contextPath}/productOrderDetail.do?orderNo=${poVO.orderNo}">${poVO.orderNo}</a></td>
				<td>${poVO.quantity}</td>
				<td>${poVO.productVO.productPoint*poVO.quantity}</td>
			</tr>	
		</c:forEach>
	</tbody>
  </table>
		<div class="boardBottomDiv">
			<div class="pagingInfo" id="pagingLocation">
				<c:set var="pb" value="${requestScope.productOrderListVO.pagingBean}"/>
				<ul class="pagination">
					<c:if test="${pb.previousPageGroup}">		
					<li><a href="${pageContext.request.contextPath}/memberProductOrderList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>	
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage != i}">
								<li><a href="${pageContext.request.contextPath}/memberProductOrderList.do?pageNo=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">	
						<li><a href="${pageContext.request.contextPath}/memberProductOrderList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>