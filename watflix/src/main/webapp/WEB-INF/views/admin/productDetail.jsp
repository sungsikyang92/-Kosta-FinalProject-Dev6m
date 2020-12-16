<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
	$(document).ready(function(){
		//상품삭제
		$("#productDelete").submit(function(){
			return confirm("삭제하시겠습니까?");
		})
		//상품수정
		$("#productUpdateForm").submit(function(){
			return confirm("수정하시겠습니까?");
		})
	})
</script>
 <div class="container-lg margin-top margin-bottom boardClassMain">     
  <table class="tabled">
  	<tr>
  		<td colspan="2"><font size="0.9rm;"><a href="${pageContext.request.contextPath}/productList.do">왓플릭스 마켓홈</a> >${productVO.productCategoryVO.productCategoryName}</font></td>
  	</tr>
		<tr>
			<td class="picTd"><img alt="상품이미지" src="${pageContext.request.contextPath}/${productVO.productPic}"></td>
			<td>
				<p><font color="#2E2EFE" size="1.2rm;">상품브랜드${productVO.productBrand}</font></p>
				<h1>상품명${productVO.productName}<font color="pink" size="1.8rm">(${productVO.proStatusVO.proStatusInfo})</font></h1>
				<hr>
				<div style="width:100%;height:50px; margin:50px 0;">
					<p><font color="#FA5858" style="font-weight:bold" size="4px;">상품가격${productVO.productPoint}원</font></p>
				</div>
				<hr>
				<!-- 상품설명 START -->
				<div class="detail">
					<p><font size="1.5rm"><pre>상품 설명: ${productVO.productDetail}</pre></font></p>
				</div>
				<!-- 상품설명 END -->
				<hr>
				<div style="width:100%; height:50px;">
					<!--재고확인란 START -->
					<div style="width:38%; margin:80px 0;float:left;">
						재고<input type="number" readonly="readonly" value="${productVO.productStock}" style="width:70%">
					</div>
					<!-- 재고확인란 END -->
					<!--수정버튼 START -->
					<div style="width:30%; margin:80px 0.5%;float:left;">		
						<button form="productUpdateForm" class="btn-danger" type="submit">수정</button>
						<form action="${pageContext.request.contextPath}/productUpdateForm.do" id="productUpdateForm">
							<input type="hidden" name="productNo" value="${productVO.productNo}">
						</form>
					</div>
					<!-- 수정버튼 END -->
					<!--삭제버튼 START -->
						<div style="width:30%; margin:80px 0.5%; float:left;">
						<c:choose>
							<c:when test="${productVO.proStatusVO.proStatusNo==1}">
								<button form="productDelete" class="btn-danger" type="submit">삭제</button>
							</c:when>
							<c:otherwise>
								<button form="productDelete" class="btn-danger" type="submit" disabled="disabled">삭제불가능</button>
							</c:otherwise>
						</c:choose>		

						<form action="${pageContext.request.contextPath}/productDelete.do" id="productDelete" method="post">
							<sec:csrfInput/>
							<input type="hidden" name="productNo" value="${productVO.productNo}">
						</form>
					</div>
					<!-- 삭제버튼 END -->
				</div>
			</td>
		</tr>
  </table>
</div>