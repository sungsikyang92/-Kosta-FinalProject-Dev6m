<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<script src="//code.jquery.com/jquery.min.js"></script> 
<head>
<meta charset="UTF-8">
<title>파티모집 글쓰는곳</title>
</head>
<script type="text/javascript">
$(document).ready(function () {
	$('#membershipType').change(function () {
		var selectType=$(this).val();
		//alert($(this).val());
		if(selectType==="0"){
			$('#partyHeadCount').append('<option value="1">1명</option>');
		}else if(selectType==="1"){
			$('#partyHeadCount').append('<option value="1">1명</option>');
			$('#partyHeadCount').append('<option value="2">2명</option>');
		}else if(selectType==="2"){
			$('#partyHeadCount').append('<option value="1">1명</option>');
			$('#partyHeadCount').append('<option value="2">2명</option>');
			$('#partyHeadCount').append('<option value="3">3명</option>');
			$('#partyHeadCount').append('<option value="4">4명</option>');
		}
		selectType.clear();
	})
})

</script>
<body>
파티 글 쓰는곳
<form action="${pageContext.request.contextPath}/partywrite.do" method="post">
<sec:csrfInput/><!-- csrf 토큰 -->
이용권 종류를 선택해주세요:
<select name="membershipVO.membershipName" id="membershipType">
<option value="">이용권 종류를 선택해주세요</option>
<option value="0">basic</option>
<option value="1">standard</option>
<option value="2">premium</option>
</select>

<select id="partyHeadCount" name="partyHeadCount">
<option>모집할 인원을 선택해주세요</option>
</select>

</form>
</body>
</html>