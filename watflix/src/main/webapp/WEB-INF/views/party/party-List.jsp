<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$(".partyUpdate").submit(function(){
    		return confirm("수정하시겠습니까?"); 
    	})
		$(".partyDelete").submit(function() {
			return confirm("삭제하시겠습니까?");
		})
	})
</script>
<style type="text/css">
#partyList{
background-color: #99ccff;
height: 75%;
width: 75%;
}

</style>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br>
<div id="partyList"">

<table border="1">
<tr>
<th>번호</th><th>제목</th>  <th>이용권종류</th> <th>모집 인원</th> <th>모집 상태</th> <th>작성자</th> <th>등록일</th>
</tr>

<tbody>
<c:forEach var="plvo" items="${requestScope.PLVO.partyList}">
<tr>
<td>${plvo.partyNo} </td> 
<td>${plvo.partyTitle} </td> 
<td>${plvo.membershipVO.membershipName}</td>
<td>${plvo.partyHeadCount}</td>
<td>${plvo.partyStatus}</td>
<td>${plvo.memberVO.id}</td>
<td>${plvo.partyPostedTime}</td>
<%--   로그인 아이디랑 작성자 아이디 체크하는 영역 

${plvo.memberVO.id  } --%>


<td>
	<form action="goPartyUpdate.do" class=partyUpdate method="get" class="partyUpdate">
	<!--<sec:csrfInput/> csrf 토큰 -->
		<input type="hidden" name="partyNo" value="${plvo.partyNo}" >
		<button class="checkBtn btn-outline-primary">수정</button>	
	</form>
</td>


<td>
 	<form action="partyDelete.do" class=partyDelete method="post">
 	<sec:csrfInput/><!-- csrf 토큰 -->
		<input type="hidden" name="partyNo" value="${plvo.partyNo}">			
	<button class="checkBtn btn-outline-primary">삭제</button>
	</form>
</td>





<td><button type="submit" class="checkBtn btn-outline-primary" id="partyApply">지원하기</button></td>

</tr>
</c:forEach>
</tbody>

</table>
<br><br>

<button type="button"class="writepartyBtn btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/partyWriteForm.do'" >파티모집하러가기</button>


<br><br>
<div class="pagingInfo">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.PLVO.pagingBean}"></c:set>
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
	<li><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/partyList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/partyList.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">
	<li><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/partyList.do?pageNo=${pb.endPageOfPageGroup+1}" >&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div> 	
</div>
</body>
</html>