<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 4.4.1 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- Main CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".starPointImg").each(function(){
				var starPoint = $(this).html();
				$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
			})
		})
		// 삭제 confirm 메서드
		function commentsDeleteConfirm(){
			return confirm('삭제하시겠습니까?');
		}
	</script>
	
<!-- commentsList DIV Start -->
<div class="container-lg boardClassMain" style="margin-top: 10px;top: 5pt;margin-bottom: 20px;">
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
			<td class="starPointImg">${commentsVOContentsNo.commentsStars}</td>
			<td>${commentsVOContentsNo.commentsStars}</td>
			<td>
				${commentsVOContentsNo.comments}<br>
				${commentsVOContentsNo.memberVO.id }
				${commentsVOContentsNo.commentsPostedTime}
				<!-- 삭제버튼 (작성자와 관리자에게만 노출된다.) -->
				<c:set var="writerId" value="${commentsVOContentsNo.memberVO.id }"/>
				<c:if test="${writerId == userId || isAdmin == 'true'}">
	 			<form action="${pageContext.request.contextPath}/adminCommentsDelete.do" method="post" onsubmit="return commentsDeleteConfirm()" style="display: inline-flex;">
					<sec:csrfInput/>
					<input type="hidden" name="contentsNo" value="${requestScope.contentsNo}">
					<input type="hidden" name="commentsDelete" value="${commentsVOContentsNo.commentsNo}">
					<%-- <input type="hidden" name="pageNo" value="${requestScope.commentsVOContentsNo.pagingBean.nowPage}"> --%>
					<input type="submit" value="삭제">
				</form>
				</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>