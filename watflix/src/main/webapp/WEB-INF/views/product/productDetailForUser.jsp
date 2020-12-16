<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
	$(document).ready(function(){
		//상품구매하기
		$("#productBuyForm").submit(function(){
			var quantity = $("#quantity").val();
			if(quantity>0){
				if(confirm(quantity+"개를 구매하시겠습니까?")){
					if($("#quantity").val()>${productVO.productStock}){
						alert("재고가 부족합니다. 최대 ${productVO.productStock} 구매 가능합니다.");
						$("#productStock").val(${productVO.productStock});
						$("#productStock").focus();
						return false;
					}//재고부족
					else{
						return true;
					}
				}//confirm
				else{
					return false;
				}
			}
			//1개이상부터 구매가능
			else{
				alert("구매는 1개이상부터만 가능합니다.");
				$("#productStock").val("1");
				$("#productStock").focus();
				return false;
			}
	})//submit
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
				<h1>상품명: ${productVO.productName}</h1>
				<hr>
				<div style="width:100%;height:50px; margin:50px 0;">
					<p><font color="#FA5858" style="font-weight:bold" size="4px;">상품가격: ${productVO.productPoint}원</font></p>
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
					<form action="${pageContext.request.contextPath}/productBuy.do" id="productBuyForm" method="post">
					<sec:csrfInput/>
						<div style="width:45%; margin:80px 0;float:left;">
							<input type="hidden" name="productNo" value="${productVO.productNo}">
							구매수량<input type="number" value="1" style="width:58%" id="quantity" name="quantity">
							<input type="hidden" value="${productVO.productPoint}" name="productPoint">
						</div>
						<!-- 재고확인란 END -->
						<!--구매하기버튼 START -->
						<div style="width:53%; margin:80px 0.5%;float:left;">		
							<button form="productBuyForm" class="btn-primary" type="submit">구매하기</button>
							
						</div>
					<!-- 구매하기버튼 END -->
					</form>
				</div>
			</td>
		</tr>
  </table>
</div>