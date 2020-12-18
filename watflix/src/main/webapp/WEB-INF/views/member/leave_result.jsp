<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jqeury -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	alert("${requestScope.id}님 회원 탈퇴 완료하였습니다.");
	$("#logoutForm").submit();
})


</script>
 <form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post" style="display: none">
<sec:csrfInput />
</form>
</body>
</html>