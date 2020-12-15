<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">				
		// 삭제 confirm 메서드
		function commentsDeleteConfirm(){
			return confirm('삭제하시겠습니까?');
		}
	</script>
	
<!-- commentsList DIV Start -->
<div class="tableMargin" id="commentsList">
<div class="container-lg boardClassMain">
	<h4 style="display: inline-flex;">평점</h4>
	
	<!-- 유저가  ROLE_ADMIN이상의 권한을 가질 경우 isAdmin변수에는 true값이 초기화된다. --> 
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
	<!-- 유저가 ROLE_MEMBER이상의 권한을 가질 경우 userId변수에는 유저의 아이디가 초기화된다. -->
	<!-- sec:authentication을 sec:authorize로 감싸주지 않을경우 로그인 하지 않은상태에서 id 값을 초기화 할 수 없으므로 오류가 발생한다. -->
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<sec:authentication property="principal.id" var="userId"/>
	</sec:authorize>
	
	<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
		<tr>
			<td class="starPointImg">${commentsListByContentsNo.commentsStars}</td>
			<td>${commentsListByContentsNo.commentsStars}</td>
			<td>
				${commentsListByContentsNo.comments}<br>
				${commentsListByContentsNo.memberVO.id }
				${commentsListByContentsNo.commentsPostedTime}
				<!-- 삭제버튼 (작성자와 관리자에게만 노출된다.) -->
				<c:set var="writerId" value="${commentsListByContentsNo.memberVO.id }"/>
				<c:if test="${writerId == userId || isAdmin == 'true'}">
	 			<form action="${pageContext.request.contextPath}/commentsDelete.do" method="post" onsubmit="return commentsDeleteConfirm()" style="display: inline-flex;">
					<sec:csrfInput/>
					<input type="hidden" name="contentsNo" value="${requestScope.contentsNo}">
					<input type="hidden" name="commentsDelete" value="${commentsListByContentsNo.commentsNo}">
					<%-- <input type="hidden" name="pageNo" value="${requestScope.commentsListByContentsNo.pagingBean.nowPage}"> --%>
					<input type="submit" value="삭제">
				</form>
				</c:if>
			</td>
		</tr>
	</table>
</div>
</div>
</body>
</html>