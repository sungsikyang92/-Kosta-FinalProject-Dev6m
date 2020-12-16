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

alert("${requestScope.id}님 회원정보 수정완료하였습니다.");
location.href="${pageContext.request.contextPath}/home.do";

</script>
</body>
</html>