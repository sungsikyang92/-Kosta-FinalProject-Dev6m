<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script type="text/javascript">
	$(document).ready(function(){
		//상품카테고리 선택
		$("#selectedProductCategory").click(function(){
			window.open("${pageContext.request.contextPath}/productCategoryList.do", "popup","width=400,height=800,top=0,left=0");
		})
	})
	function checkForm(){
		if($("#selectedProductCategory").val()!=null)
			return true;
		else{
			alert("카테고리를 등록해주세요");
			return;
		}
	}
</script>
 <div class="container-lg margin-top margin-bottom boardClassMain">
  <h2>상품 수정하기</h2>           
	<form action="${pageContext.request.contextPath}/productUpdate.do" method="post" name="productForm" enctype="multipart/form-data" onsubmit="return checkForm()">
		<sec:csrfInput/>
	  	<table class="table table-bordered" style="border-radius: 1.5px;position:relative;width:70%;left:15%">
	  		<input type="hidden" name="productNo" value="${productVO.productNo}">
			<tr>
				<td class="boardTd">상품명</td>
				<td class="boardTitle"><input type="text" name="productName" required="required" value="${productVO.productName}"></td>
			</tr>
			<tr>
				<td>상품포인트</td>
				<td><input type="number" name="productPoint" value="100" required="required"  min="1" value="${productVO.productPoint}"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea required="required" name="productDetail" style="width:100%;height:80px;">${productVO.productDetail}	</textarea></td>
			</tr>
			<tr>
				<td>상품카테고리</td>${productVO.productCategoryVO.productCategoryNo}
				<td><input type="text" id="selectedProductCategory" readonly="readonly" placeholder="상품카테고리 선택하세요" name="productCategoryName" value="${productVO.productCategoryVO.productCategoryName}"></td>
				<input type="hidden" name="productCategoryNo" value="${productVO.productCategoryVO.productCategoryNo}">
			</tr>
			<tr>
				<td rowspan="2">상품사진</td>
				<td class="picTd"><img src="${pageContext.request.contextPath}/${productVO.productPic}"></td>
				<input type="hidden" name="productPic" value="${productVO.productPic}">
			</tr>
			<tr>
				<td><input type="File" name="productPicFile"></td>
			</tr>
			<tr>
				<td>상품브랜드</td>
				<td><input type="text" name="productBrand" required="required" value="${productVO.productBrand}"></td>
			</tr>
			<tr>
				<td>상품재고</td>
				<td><input type="number" name="productStock" value="100" required="required" value="${productVO.productStock}" min="1" max="999"></td>
			</tr>
			<tr>		
				<td colspan="2" class="btnArea">
					<button type="reset" class="btn-reset btn btn-default boardDetailBtn">초기화</button>
					<button type="submit" class="btn btn-default boardDetailBtn">수정</button>
				</td>
			</tr>
	  	</table>
	</form>
</div>