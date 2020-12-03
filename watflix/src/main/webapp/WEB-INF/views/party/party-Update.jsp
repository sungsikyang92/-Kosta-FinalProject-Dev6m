<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function () {
	$('#membershipType').change(function () {
		var selectType=$(this).val();
		//alert(selectType);
		 $.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/select1.do",
			dataType : "json",
			data : "no="+ selectType,
			success : function(result) {
				$("#partyHeadCount").html("");
				$('#partyHeadCount').append('<option value="">모집할 인원을 선택해주세요</option>');	
				//alert(result.membershipName);
				//alert(result.concurrentUsers);}
			var concurrentUsers = result.concurrentUsers;
			for(var i = 1 ; i<=concurrentUsers ; i++){
				$('#partyHeadCount').append("<option value="+i+">"+i+"명</option>");	
			}
		 }
		});//ajax 
	})//첫번째 select 박스
	$('#partyHeadCount').change(function () {
		//alert($('#partyHeadCount').val());
		
	})// 두번째 select 박스
})

</script>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>


<form action="${pageContext.request.contextPath}/partyUpdate.do" method="post">
<sec:csrfInput/><!-- csrf 토큰 -->
<c:set var="pvo" value="${requestScope.pvo}"></c:set>
${pvo.partyNo}
<select name="membershipType" id="membershipType" required>
<option>이용권을 선택해주세요</option>
<c:forEach begin="1" end="3" var="status">
<c:choose>
	<c:when test="${pvo.membershipVO.membershipNo == status }">
		<option value="${pvo.membershipVO.membershipName}"selected>${pvo.membershipVO.membershipName}</option>
	</c:when>
	<c:otherwise>
		<option value="${pvo.membershipVO.membershipName}">${pvo.membershipVO.membershipName}</option>
	</c:otherwise>
</c:choose>
</c:forEach>
</select>
<select name="partyHeadCount" id="partyHeadCount" required>
<option>모집할 인원을 선택해주세요</option>
<c:forEach begin="1" end="${pvo.membershipVO.concurrentUsers}" var="status">
	<c:choose>
		<c:when test="${status==pvo.partyHeadCount}">
			<option value="${status}" selected>${status}명</option>
		</c:when>
		<c:otherwise>
		<option value="${status}">${status}명</option>
		</c:otherwise>
	</c:choose>
	
</c:forEach>
</select>


<br>
제목:<input type="text" name=partyTitle required="required" value="${pvo.partyTitle}">
<input type="submit" value="등록">
</form>
</body>
</html>