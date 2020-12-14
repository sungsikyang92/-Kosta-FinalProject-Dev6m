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
alert("${lackPoint} 포인트가 부족하여 구매하지 못했습니다.")
location.href="${pageContext.request.contextPath}/productMarket.do";
</script>
</body>
</html>