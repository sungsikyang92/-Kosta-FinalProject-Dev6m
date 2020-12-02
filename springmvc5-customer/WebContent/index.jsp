<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="findCustomerById.do">
아이디 <input type="text" name="id" required="required">
<input type="submit" value="검색">
</form>
<hr>
<form action="findCustomerListByAddress.do">
주소 <input type="text" name="address" required="required">
<input type="submit" value="검색">
<%-- 
      주소에 해당하는 고객이 한명이상 존재하면
      views/findbyaddress_ok.jsp 에서 JSTL로 아이디,이름의 리스트를 제공
      주소에 해당하는 고객이 없으면
      views/findbyaddress_fail.jsp에서 일산에 사는 회원이 없습니다. alert 후 index로 이동
 --%>

</form>
 <hr>
 <form method="post" action="registerCustomer.do">
 아이디 <input type="text" name="id" required="required">
 이름 <input type="text" name="name" required="required">
 주소 <input type="text" name="address" required="required">
	<input type="submit" value="등록하기">
 </form>
 
</body>
</html>