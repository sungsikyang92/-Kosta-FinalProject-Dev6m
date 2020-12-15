<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
	<!-- Bootstrap 4.4.1 -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/adminBootstrap.css">
	<!-- Flickity 2.2.1 -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/flickity.css">
	<!-- JQuery UI -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
	<!-- Main CSS -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resources/css/adminStyle.css">
	<!-- jqeury -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		var category = window.opener.document.productForm;
		$("tr").click(function(){
			if(confirm($(this).children(".categoryName").text()+"를 선택하시겠습니까?")){
				category.productCategoryNo.value=$(this).children(".categoryNo").text();
				category.productCategoryName.value=$(this).children(".categoryName").text();
				self.close();
			}
			else{
				return;
			}
		})//tr클릭
		//상품카테고리 등록
		$("#productCategoryRegisterBtn").click(function(){
			window.open("${pageContext.request.contextPath}/productCategoryRegisterForm.do", "popup","width=400,height=800,top=0,left=0");
		})
	})
	</script>
</head>
<body>
<div class="container boardClassMain">
  <h2>상품카테고리 리스트</h2>           
  <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
    <thead>
      <tr>
		<th style="width:40%;">카테고리 코드</th>
		<th>카테고리 이름</th>
      </tr>
    </thead>
    <tbody>
    	<!-- 상품카테고리 리스트 출력 START -->
		<c:forEach var="pclvo" items="${requestScope.productCategoryListVO.productCategoryList}">
			<tr>
				<td class="categoryNo">${pclvo.productCategoryNo}</td>
				<td class="categoryName">${pclvo.productCategoryName}</td>					
			</tr>	
		</c:forEach>
		<!-- 상품카테고리 리스트 출력 END -->
	</tbody>
  </table>
<div class="boardBottomDiv">
	<div class="pagingInfo" id="pagingLocation">
		<c:set var="pclp" value="${requestScope.productCategoryListVO.pagingBean}"/>
		<ul class="pagination">
			<c:if test="${pclp.previousPageGroup}">		
			<li><a href="${pageContext.request.contextPath}/productCategoryList.do?pageNo=${pclp.startPageOfPageGroup-1}">&laquo;</a></li>	<!-- $laquo는 페이징에 나타나는'<<'왼쪽페이지 버튼이다. -->
			</c:if>
			<c:forEach var="i" begin="${pclp.startPageOfPageGroup}" end="${pclp.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pclp.nowPage != i}">
						<li><a href="${pageContext.request.contextPath}/productCategoryList.do?pageNo=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pclp.nextPageGroup}">			
				<li><a href="${pageContext.request.contextPath}/productCategoryList.do?pageNo=${pclp.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<div class="writeBtn">
		<div style="width:60%;">
			<button type="button" class="btn-default boardBtnSubmit" id="productCategoryRegisterBtn" >카테고리 신규등록</button>
		</div>
	</div>
	</div>
</div>


</body>
</html>