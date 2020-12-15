<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert("${requestScope.id}님 회원가입을 축하합니다.");
location.href="${pageContext.request.contextPath}/home.do";

</script>
</body>
</html>