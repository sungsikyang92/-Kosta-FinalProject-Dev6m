<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${findCustomerListByAddress}" var="list">
아이디:${list.id}<br>
이름:${list.name}<br>
주소:${list.address}<br>
<hr>
</c:forEach>

</body>
</html>