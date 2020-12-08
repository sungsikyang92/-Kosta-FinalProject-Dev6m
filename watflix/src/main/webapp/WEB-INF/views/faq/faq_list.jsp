<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
 <div class="tableTopMargin">   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<title>faqList</title>
</head>
<body>
FAQ Page
<form >
<div class="container-lg">
<hr>
<hr>
	<h2>FAQ</h2>
<table class="table table-hover">
	<thead>
		<tr>
			<th class="faqNo">NO</th>
			<th class="faqHits">조회수</th>
			<th class="faqTitle"></th>
			<th class="faqWriter"></th>
			<th class="faqPostedTime"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="fvo" items="${requestScope.lvo.faqList}">
			<tr>
				<td>${fvo.faqNo}</td>
				<td>${fvo.faqHits}</td>
				<td><a href="${pageContext.request.contextPath}/faqDetail.do?faqNo=${fvo.faqNo}">${fvo.faqTitle}</a></td>
				<td>${fvo.memberVO.id}</td>
				<td>${fvo.faqPostedTime}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div class="faqWriteBtn">
<a href="${pageContext.request.contextPath}/faqWriteForm.do"><input type="button" value="FAQ 작성" ></a>
</div>
</form>

<div class="pagingInfo">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
	<!-- 
			step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->  
	<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="DispatcherServlet?command=list&pageNo=...">				   
	 -->	
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<div class="pageNoBtn">
	<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${i}">${i}</a></li> 
	</div>
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/faqList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div> 	
	<!-- 
			step3 1) 다음 페이지 그룹이 있으면 화살표 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->   
    
</body>
</html>
</div>



