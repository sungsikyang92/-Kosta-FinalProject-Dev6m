<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접근권한 오류</title>

</head>
<body>

<script type="text/javascript">
alert("접근권한이 없습니다.")
location.href="${pageContext.request.contextPath}/home.do"

</script>
</body>
</html>


