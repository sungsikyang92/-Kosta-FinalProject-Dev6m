<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#commentsWriteButton").click(function(){
			alert('1');
			window.opener.name = "parentPage";
			document.commentsWriteForm.target = "parentPage";
			document.commentsWriteForm.action = "${pageContext.request.contextPath}/commentsWrite.do";
			document.commentsWriteForm.submit();
			self.close();
		})
		
		var hoverEvent = true;
		$('#starPoint img').hover(function(){
			if(hoverEvent){
			$('.starLeft').attr('src', '${pageContext.request.contextPath}/resources/media/icons/star-gray-left.png');
			$('.starRight').attr('src', '${pageContext.request.contextPath}/resources/media/icons/star-gray-right.png');
			
			var starLR = ($(this)[0].id).substr(0,5);
			if(starLR == "starR"){
				$(this).prevAll('.starLeft').attr('src', '${pageContext.request.contextPath}/resources/media/icons/star-left.png');
				$(this).prevAll('.starRight').add(this).attr('src', '${pageContext.request.contextPath}/resources/media/icons/star-right.png');
			} else {
				$(this).prevAll('.starLeft').add(this).attr('src', '${pageContext.request.contextPath}/resources/media/icons/star-left.png');
				$(this).prevAll('.starRight').attr('src', '${pageContext.request.contextPath}/resources/media/icons/star-right.png');
			}
			}
		});
		$('#starPoint img').click(function(){
			hoverEvent = !hoverEvent;
		})
	})
</script>
<title>commentsWriteForm</title>
<style type="text/css">
	#starPoint .starRight{
		margin-left: -5px;
	}
</style>
</head>
<body>
	<form name="commentsWriteForm" method="post">
	<sec:csrfInput/>
	<table>
		<tr>			
			<td>별점</td>
			<td><input type="number" id="commentsStars"	name="commentsStars"
			min="1" max="10" required="required"></td>
		</tr>
		<tr>
			<td colspan="2">
				<p id="starPoint">
				<c:forEach var="i" begin="1" end="5">
					<img id="starL${i}" class="starLeft" src="${pageContext.request.contextPath}/resources/media/icons/star-gray-left.png">
					<img id="starR${i}" class="starRight" src="${pageContext.request.contextPath}/resources/media/icons/star-gray-right.png">
				</c:forEach>
				</p>
					
					
			</td>
		</tr>
		<tr>
			<td>한줄평</td><td><textarea cols="40" rows="15" id="commentsContents"
			name="comments" placeholder="한줄평을 입력해주세요!" required="required"></textarea></td>
		</tr>
		<tr>
			<td>
				<input type="hidden" name="contentsNo" value="${requestScope.contentsNo}">
				<input type="button" id="commentsWriteButton" value="작성">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>