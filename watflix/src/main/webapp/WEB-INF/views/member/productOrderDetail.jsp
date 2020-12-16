<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
$(document).ready(function(){
})//ready종료
</script>
<div class="container boardClassMain">
<h2 align="left">주문상세내역</h2> 
<h6>주문번호: ${productOrderDetail.orderNo}</h6>
<h6>주문일자: ${productOrderDetail.purchasedTime}</h6> 
  <div class="middleBox">       
  <table class="table table-hover table-bordered" style="border-radius: 1.5px;text-align:center;">
    <thead>
      <tr>
		<th>상품정보</th>
		<th>상품가격</th>
		<th>수량</th>
		<th>사용포인트</th>
		<th>주문상태</th>
      </tr>
    </thead>
    <tbody>
		<tr>
			<td style="width:30%;">
				<a href="${pageContext.request.contextPath}/productDetailForUser.do?productNo=${productOrderDetail.productVO.productNo}">
				<div class="row">
					<div class="col-sm-7">
					<img src="${productOrderDetail.productVO.productPic}" style="object-fit:fill;width:100%;">
					</div>
					<div class="col-sm-5">
						<p>${productOrderDetail.productVO.productName}</p>
						<p>${productOrderDetail.productVO.productBrand}</p>
					</div>
				</div>
				</a>
			</td>
			<td>${productOrderDetail.productVO.productPoint}</td>
			<td>${productOrderDetail.quantity}</td>
			<td>${productOrderDetail.productVO.productPoint*productOrderDetail.quantity}</td>
			<td>주문완료</td>			
		</tr>	
	</tbody>
  </table>
	</div>
</div>