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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#commentsWriteButton").click(function(){
			window.opener.name = "parentPage";
			document.commentsWriteForm.target = "parentPage";
			document.commentsWriteForm.action = "${pageContext.request.contextPath}/commentsWrite.do";
			document.commentsWriteForm.submit();
			self.close();
		})
		$("#commentsCencleButton").click(function(){
			self.close();
		})
		//var hoverEvent = true;
		var	starPoint;
		var displayPoint;
		$('#starPoint img').hover(function(){
			if(starPoint == null){
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
			
			var starLR = ($(this)[0].id).substr(4,1);
			if(starLR == "L"){
				displayPoint = (($(this)[0].id).substr(5,1)*2)-1;
			} else {
				displayPoint = ($(this)[0].id).substr(5,1)*2;
			}
			$("#displayPoint").html(displayPoint);
			}
		});
		$('#starPoint img').click(function(){
			if(starPoint != null){
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
			var starLR = ($(this)[0].id).substr(4,1);
			if(starLR == "L"){
				starPoint = (($(this)[0].id).substr(5,1)*2)-1;
			} else {
				starPoint = ($(this)[0].id).substr(5,1)*2;
			}
			displayPoint = starPoint;
			$("#displayPoint").html(displayPoint);
			$("#commentsStars").val(starPoint);
		});
		// 글 내용 작성을 30자로 제한하고 글자 수를 나타낸다.
		$("#commentsContents").on('keydown', function(){
			$("#countContentsWord").html("("+$(this).val().length+" / 30)");
			// 글자수가 30이 넘으면 30자 이하로 잘라내고 alert을 호출한다.
			if($(this).val().length > 30){
				$(this).val($(this).val().substring(0,30));
				$("#countContentsWord").html("(30 / 30)");
				alert("내용은 공백을 포함하여 30자 이하로 작성하세요.");
			}
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
<body style="font: ">
	<form name="commentsWriteForm" method="post" style="margin-top: 25px">
	<sec:csrfInput/>
	<table style="margin-left: auto; margin-right: auto; text-align: center;">
		<tr>
			<td><h3>${requestScope.contentsVO.contentsTitle}</h3></td>
		</tr>
		<tr>
			<td colspan="2">
				<div style="text-align: center; margin-top: 15px;">
				<span id="starPoint">
				<c:forEach var="i" begin="1" end="5">
					<img id="starL${i}" class="starLeft" src="${pageContext.request.contextPath}/resources/media/icons/star-gray-left.png">
					<img id="starR${i}" class="starRight" src="${pageContext.request.contextPath}/resources/media/icons/star-gray-right.png">
				</c:forEach>
				</span>
				<input type="hidden" id="commentsStars" name="commentsStars" value="" required="required">
				<span id="displayPoint">0</span>	
				</div>					
			</td>
		</tr>
		<tr>
			<td>
				<textarea cols="60" rows="10" id="commentsContents"
				name="comments" placeholder="한줄평을 남겨주세요" required="required" style="margin-top: 30px; width: 100%"></textarea>
				<div id="countContentsWord"style="float: right;">(0/30)</div>
			</td>
		</tr>
		<tr>
			<td>
				<div style="text-align: center;">
				<input type="button" id="commentsCencleButton" value="취소">
				<input type="hidden" name="contentsNo" value="${requestScope.contentsVO.contentsNo}">
				<input type="button" id="commentsWriteButton" value="작성">
				</div>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>