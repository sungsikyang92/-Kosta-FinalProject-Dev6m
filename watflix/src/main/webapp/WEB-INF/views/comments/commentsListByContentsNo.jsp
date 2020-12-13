<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<script type="text/javascript">
		$(document).ready(function(){
			// 유저의 아이디로 작성한 comments의 여부를 확인한다.
			// comments가 있을 경우 alert을 호출한다.
			// comments가 없을 경우 writeForm을 팝업으로 호출한다.
			$("#openCommentsWriteFormButton").click(function(){
				var contentsNo = "${requestScope.contentsNo}";
				$.ajax({
					url: "checkWorteOrNot.do",
					type: "GET",
					dataType: "text",
					data: 'contentsNo='+contentsNo,
					success: function(result){
						// 유저의 아이디로 작성한 comments가 없을 경우 0을 반환하므로 writeForm을 팝업으로 호출한다.
						if(result == "0"){
							var popupWidth = 500; // 팝업창 가로크기
							var popupHeight = 600; // 팝업창 세로크기
							
							// window.screen.width로 현재 윈도우창의 가로크기를 가져온다.
							// widdow.screen.height로 현재 윈도우창의 세로크기를 가져온다.
							//아래 공식을 적용하여 팝업창을 현재 화면의 중간에 띄운다.
							var popupX = (window.screen.width / 2) - (popupWidth / 2);
							var popupY = (window.screen.height / 2) - (popupHeight / 2);
											
							window.open("${pageContext.request.contextPath}/commentsWriteForm.do?contentsNo=${requestScope.contentsNo}", "평점입력",
									"width="+popupWidth+",height="+popupHeight+",left="+popupX+",top="+popupY);
						} else { // 유저의 아이디로 작성한 comments가 있을 경우 0이외의 숫자를 반환한다. alert으로 새 comments를 작성할 수 없다고 안내한다.
							alert("이미 작성하신 평점이 존재합니다. 한 컨텐츠에 하나의 평점만 작성하실 수 있습니다.");
						}
					}
				})				
			});
			$(".starPointImg").each(function(){
				var starPoint = $(this).html();
				$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
			})
		});	
				
		// 삭제 confirm 메서드
		function commentsDeleteConfirm(){
			return confirm('삭제하시겠습니까?');
		}		
		// 리뷰 신고
		function reportPopup(commentsNo, commentsWriterId){
			// 신고에 필요한 데이터 전송
			var path = "${pageContext.request.contextPath}/reportCommentsForm.do?commentsNo="+commentsNo+"&&"+"commentsWriterId="+commentsWriterId;
			window.open(path, "reportComments","width=465, height=180, top=150, left=200");
			
		}
	</script>
<!-- commentsList DIV Start -->
<div class="tableMargin" id="commentsList">
<div class="container-lg boardClassMain" style="margin-top: 100px">
	<h4 style="display: inline-flex;">평점</h4>
	
	<!-- 유저가  ROLE_ADMIN이상의 권한을 가질 경우 isAdmin변수에는 true값이 초기화된다. --> 
	<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin"/>
	<!-- 유저가 ROLE_MEMBER이상의 권한을 가질 경우 userId변수에는 유저의 아이디가 초기화된다. -->
	<!-- sec:authentication을 sec:authorize로 감싸주지 않을경우 로그인 하지 않은상태에서 id 값을 초기화 할 수 없으므로 오류가 발생한다. -->
	<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.id" var="userId"/>
	</sec:authorize>
	<c:choose>
	<c:when test="${requestScope.commentsListByContentsNo.list != null}">
		<div>현재 해당 contents에는 평점이 존재하지 않습니다.</div>
	</c:when>
	<c:otherwise>
	<table class="table table-hover table-bordered" style="border-radius: 1.5px;">
		<c:forEach items="${requestScope.commentsListByContentsNo.list}" var="commentsListByContentsNo">
		<tr>
			<td class="starPointImg">${commentsListByContentsNo.commentsStars}</td>
			<td>${commentsListByContentsNo.commentsStars}</td>
			<td>
				${commentsListByContentsNo.comments}<br>
				${commentsListByContentsNo.memberVO.id }
				${commentsListByContentsNo.commentsPostedTime}
				<!-- 신고에 필요한 데이터를 script에 전달 -->
				<a href="#" onclick="reportPopup(${commentsListByContentsNo.commentsNo},'${commentsListByContentsNo.memberVO.id }');return false;">신고</a>
				<!-- 삭제버튼 (작성자와 관리자에게만 노출된다.) -->
				<c:set var="writerId" value="${commentsListByContentsNo.memberVO.id }"/>
				<c:if test="${writerId == userId || isAdmin == 'true'}">
	 			<form action="${pageContext.request.contextPath}/commentsDelete.do" method="post" onsubmit="return commentsDeleteConfirm()" style="display: inline-flex;">
					<sec:csrfInput/>
					<input type="hidden" name="contentsNo" value="${requestScope.contentsNo}">
					<input type="hidden" name="commentsDelete" value="${commentsListByContentsNo.commentsNo}">
					<input type="hidden" name="pageNo" value="${requestScope.commentsListByContentsNo.pagingBean.nowPage}">
					<input type="submit" value="삭제">
				</form>
				</c:if>
			</td>
		
		</tr>
		</c:forEach>
	</table>
	</c:otherwise>
	</c:choose>
	<sec:authorize access="hasRole('ROLE_MEMBER')" >
		<button type="button" id="openCommentsWriteFormButton" style="width: 80px; float:right;">평점쓰기</button>
	</sec:authorize>
<div class="boardBottomDiv" style="width: 1000px;"> 
	<div class="pagingInfo" id="pagingLocation">
		<c:set var="pagingBean" value="${requestScope.commentsListByContentsNo.pagingBean}"/>
		<ul class="pagination">
			<c:if test="${pagingBean.previousPageGroup}">
				<li class="page-item"><a href="${pageContext.request.contextPath}/contentsDetail.do?commentsPageNo=${pagingBean.startPageOfPageGroup-1}&contentsNo=${requestScope.contentsNo}">&laquo;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pagingBean.nowPage!=i}">
						<li class="page-item"><a href="${pageContext.request.contextPath}/contentsDetail.do?commentsPageNo=${i}&contentsNo=${requestScope.contentsNo}">${i}</a></li>
					</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingBean.nextPageGroup}">
				<li class="page-item"><a href="${pageContext.request.contextPath}/contentsDetail.do?commentsPageNo=${pagingBean.endPageOfPageGroup+1}&contentsNo=${requestScope.contentsNo}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</div>
</div>	<!-- commentsList DIV End -->
</div>
