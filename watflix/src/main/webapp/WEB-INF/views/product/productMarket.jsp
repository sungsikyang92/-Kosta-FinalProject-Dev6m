<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">
$(document).ready(function(){
	$(".productListTd").hover(function(){
		$(this).attr("style","border:1px solid black");
	},function(){
		$(this).removeAttr("style");
	});
	$(".productListTd").click(function(){
		$(this).children(".productDetailForm").submit();
	})
})
</script>
<div class="tableMargin">
<div class="container-lg boardClassMain">
	<div class="productListDiv">
 	 <h2 align="center">상품 리스트</h2>  
	  <table class="table" style="border: none;" >
	  <c:forEach var="index" begin="1" end="${fn:length(productListVO.productList)/3+1}">
	  	<tr>
	  		<c:forEach items="${productListVO.productList}" var="pvo" begin="${(index-1)*3}" end="${index*3-1}">
	  			<!-- 정상판매하는것만 출력 START -->
	  			<c:if test="${pvo.proStatusVO.proStatusNo==1}">
	  				<td class="productListTd">
				  		<form action="${pageContext.request.contextPath}/productDetailForUser.do" class="productDetailForm">
				  			<input type="hidden" name="productNo" value="${pvo.productNo}">
				  			<img alt="상품이미지" src="${pageContext.request.contextPath}/${pvo.productPic}">
				  			<div class="row">
								<div class="col-4 text-left no-padding">
									품명: ${pvo.productName}
								</div>
								<div class="col-4 text-center no-padding">
									가격: ${pvo.productPoint}
								</div>
								<div class="col-4 text-right no-padding rating">
									재고: 
									<c:choose>
										<c:when test="${pvo.productStock>0}">${pvo.productStock}</c:when>
										<c:otherwise>품절</c:otherwise>
									</c:choose>
									
									
								</div>
							</div>
						</form>
			  		</td>
	  			</c:if>
	  			<!-- 정상판매하는것만 출력 END -->
	  		</c:forEach>
	  	</tr>
	  </c:forEach>
	  </table>
		<div class="boardBottomDiv">
			<div class="pagingInfo" id="pagingLocation">
				<c:set var="plp" value="${requestScope.productListVO.pagingBean}"/>
					<ul class="pagination">
						<c:if test="${plp.previousPageGroup}">		
							<li><a href="${pageContext.request.contextPath}/productList.do?pageNo=${plp.startPageOfPageGroup-1}">&laquo;</a></li>	<!-- $laquo는 페이징에 나타나는'<<'왼쪽페이지 버튼이다. -->
						</c:if>
						<c:forEach var="i" begin="${plp.startPageOfPageGroup}" end="${plp.endPageOfPageGroup}">
							<c:choose>
								<c:when test="${plp.nowPage != i}">
									<li><a href="${pageContext.request.contextPath}/productList.do?pageNo=${i}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a href="#">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${plp.nextPageGroup}">			
							<li><a href="${pageContext.request.contextPath}/productList.do?pageNo=${plp.endPageOfPageGroup+1}">&raquo;</a></li>
						</c:if>
					</ul>
			</div>
		</div>
	</div>
</div>
</div>