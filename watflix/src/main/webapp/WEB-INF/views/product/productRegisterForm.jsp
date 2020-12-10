<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function(){
		//상품카테고리 선택
		$("#selectedProductCategory").click(function(){
			window.open("${pageContext.request.contextPath}/productCategoryList.do", "popup","width=500,height=300,top=0,left=0");
		})
	})
</script>

<div class="container-lg margin-top margin-bottom" style="margin:0 auto;">
 <div class="tab-content" id="myTabContent" style="margin-top:130px;">
	 	<div>
		상품명<input type="text" name="productName"><br>
		상품포인트<input type="number" name="productPoint" min="1"><br>
		상품설명<input type="clob" name="productDetail"><br>
		상품카테고리<input type="text" id="selectedProductCategory" readonly="readonly" placeholder="상품카테고리 선택하세요">
		<input type="hidden" name="productCategoryNo">
		<br>
		상품사진<input type="text" name="productPic"><br>
		상품브랜드<input type="text" name="productBrand"><br>
		상품재고<input type="number" name="productPoint" min="1"><br>
		</div>
	 </div>
 </div>
