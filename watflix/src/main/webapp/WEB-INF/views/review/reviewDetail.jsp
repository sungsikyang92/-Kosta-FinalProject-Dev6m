<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#reviewDelete").submit(function(){
			return confirm("정말 삭제하시겠습니까?");
		});//reviewDelete
		$("#reviewUpdateForm").submit(function(){
			return confirm("수정 페이지로 이동 하시겠습니까?");
		});
		//리뷰 좋아요
		$("#ReviewLike").click(function(){
			var reviewNo = "${requestScope.rdvo.reviewNo}";
			var id = "${requestScope.rdvo.memberVO.id}";
			$.ajax({
				url: "reviewLikeExist.do",
				type: "POST",
				beforeSend : function(xhr){   /데이터를 전송하기 전에 헤더에 csrf값을 설정한다/
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                },
				dataType: "text",
				data: 'reviewNo=' +reviewNo + '&id=' +id,
				success: function(data){
					//alert(data);
					if(data == "0"){
						$('#ReviewLike').attr('src','/watflix/resources/media/icons/RedHeart.png');
						$('#LikesCount').text(Number($('#LikesCount').text())+1);
					}else{
						$('#ReviewLike').attr('src','/watflix/resources/media/icons/HeartLine.png');
						$('#LikesCount').text(Number($('#LikesCount').text())-1);
					}
				}
			});//ajax
		});//click func
	});//document.ready
	// 평점 신고
	function reportPopup(reviewNo, reviewWriterId){
		// 신고에 필요한 데이터를 신고 form에 보낸다.
		var path = "${pageContext.request.contextPath}/reportForm.do?reviewNo="+reviewNo+"&&"+"reviewWriterId="+reviewWriterId;
		window.open(path, "reportReview","width=465, height=180, top=150, left=200");
	}
</script>
<div class="tableMargin">
<div class="container-lg boardClassMain">
  <h2>리뷰상세보기</h2>           
  <table class="table table-bordered" style="border-radius: 1.5px;">
	<c:set var="reviewDetail" value="${requestScope.rdvo}"></c:set>
		<tr>
			<th class="rvdTitle">${reviewDetail.reviewTitle}</th>
			<th class="rvdThNo2">조회${reviewDetail.reviewHits}</th>
			<th class="rvdLikes">
				<a href="#">
				<c:choose>
					<c:when test="${reviewDetail.reviewLikeStatus == 1}">
						<img id="ReviewLike" class="ReviewLike" src="/watflix/resources/media/icons/RedHeart.png" width=30px height=30px>
					</c:when>
					<c:otherwise>
						<img id="ReviewLike" class="ReviewLike" src="/watflix/resources/media/icons/HeartLine.png" width=30px height=30px>
					</c:otherwise>
				</c:choose>
				
				</a>
				<br>
				Likes <span id="LikesCount">${reviewDetail.reviewLikes}</span></th>
			<th class="rvdReport"><a href="#" onclick="reportPopup(${reviewDetail.reviewNo},'${reviewDetail.memberVO.id}');return false;"><img width="12px" src='${pageContext.request.contextPath}/resources/media/icons/report.png'></a></th>
		</tr>
		<tr>
			<th class="reviewPostedTime" colspan="6">${reviewDetail.reviewPostedTime}</th>
		</tr>
		<tr class="boardDetailTr">
			<td colspan="4" class="reviewContents"><pre style="white-space:pre-wrap;">${reviewDetail.reviewContents}</pre></td>
		</tr>
	<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.id" var="userId"/>
		<tr>			<!-- 임시로 align="center"줘서 중앙배열 시켜놓음 CSS로 해야함 -->
			<td colspan="4" class="btnArea">
			<c:choose>
				<c:when test= "${requestScope.rdvo.memberVO.id == userId}">
					<button type="button" class="btn btn-default boardDetailBtn" onclick="location.href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${reviewDetail.contentsVO.contentsNo}'">목록</button>
					<button form="reviewUpdateForm" class="btn btn-default boardDetailBtn" type="submit">수정</button>
					<form action="reviewUpdateForm.do" id="reviewUpdateForm" method="post">
					<sec:csrfInput/>
					<input type="hidden" name="reviewNo" value="${reviewDetail.reviewNo}">
					</form>
				</c:when>	
				<c:otherwise>
					<button type="button" class="btn btn-default boardDetailBtn" onclick="location.href='${pageContext.request.contextPath}/contentsDetail.do?contentsNo=${reviewDetail.contentsVO.contentsNo}'">목록</button>
				</c:otherwise>
		</c:choose>
			</td>
		</tr>
	</sec:authorize>
  </table>
</div>
</div>
