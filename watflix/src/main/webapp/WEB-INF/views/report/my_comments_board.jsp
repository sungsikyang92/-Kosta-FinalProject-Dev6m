<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	
$(document).ready(function(){
	$(".starPointImg").each(function(){
		var starPoint = $(this).html();
		$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
	})
})
<!-- ajax 페이징 -->
	function commentsPaging(commentsPageNo){
			// 테이블에 집어넣을 문자열 데이터 변수
			var commentsTbody = "";
			var commentsPaging ="";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myCommentsList.do?pageNo="+commentsPageNo,
				success:function(data){
					//commentsTbody += "<tr><td><input type='checkbox' id='checkAll'></td></tr>"
					//table의 tbody
					for (var i = 0; i < data.list.length; i++){
						commentsTbody += "<tr>";
							commentsTbody += "<td class='starPointImg'>"+data.list[i].commentsStars+"</td>";
							commentsTbody += "<td>"+ data.list[i].commentsStars + "</td>";
							commentsTbody += "<td>"+ data.list[i].comments + "<br>" + data.list[i].memberVO.id + data.list[i].commentsPostedTime +"</td>";
					}
					$("#commentsTbody").html(commentsTbody);
					
					// table 페이징
					var startPageGroup = data.pagingBean.startPageOfPageGroup;
					var endPageGroup = data.pagingBean.endPageOfPageGroup;
					// 왼쪽 페이징 화살표
					if (data.pagingBean.previousPageGroup){
						commentsPaging += "<li><a href='#' onclick='commentsPaging("+ (startPageGroup -1) +");return false;'>&laquo;</a></li>";
					}
					// 페이징 번호
					for (var commentsPageNo = startPageGroup; commentsPageNo < endPageGroup + 1; commentsPageNo++){
						if(data.pagingBean.nowPage != commentsPageNo){
							commentsPaging += "<li><a href='#' onclick='commentsPaging("+ commentsPageNo +");return false;'>"+ commentsPageNo +"</a></li>";
						}else{
							commentsPaging += "<li><a href='#' onclick='return false'>"+ commentsPageNo +"</a></li>";
						}
					}
					// 오른쪽 화살표 페이징
					if(data.pagingBean.nextPageGroup){
						commentsPaging += "<li><a href='#' onclick='commentsPaging("+ (endPageGroup + 1) +");return false'>&raquo;</a></li>";
					}
					$("#commentsPaging").html(commentsPaging);
					// 코드가 중복됨 수정 필요함
					$(".starPointImg").each(function(){
						var starPoint = $(this).html();
						$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
					})
				}
			})
		}
	</script>
	<div class="tableMargin" id="commentsList">
	<div class="container-lg boardClassMain" style="margin-top: 100px">
	  <h2>평점리스트</h2>           
	  <form action="${pageContext.request.contextPath}/commentsDeleteByCheckboxMember.do"
		id="deleteNoticeByCheckboxForm" method="post">
	<sec:csrfInput/>
	  <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
	    <tbody id="commentsTbody">
	    <c:forEach items="${requestScope.commentsListVO.list}" var="commentsList">
	      <tr>
			<td class="starPointImg">${commentsList.commentsStars}</td>
				<td>${commentsList.commentsStars}</td>
				<td>
					${commentsList.comments}<br>
					${commentsList.memberVO.id }
					${commentsList.commentsPostedTime}				
				</td>				
	      </tr>
	      </c:forEach>
	    </tbody>
	  </table>
	  <input type="hidden" name="pageNo" value="${requestScope.commentsList.pagingBean.nowPage}">
	  </form>
	  <button type="submit" form="deleteNoticeByCheckboxForm" style="width: 80px; float:right;">삭제</button>
		<div class="boardBottomDiv" style="width: 50%">
			<div class="pagingInfo" id="pagingLocation">
				<c:set var="pagingBean" value="${requestScope.commentsListVO.pagingBean}"/>
				<ul class="pagination" id = "commentsPaging">
					<c:if test="${pagingBean.previousPageGroup}">
						<li class="page-item"><a href="#" onclick="commentsPaging(${pagingBean.startPageOfPageGroup-1}); return false">&laquo;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pagingBean.nowPage != i}">
								<li><a href="#" onclick="commentsPaging(${i}); return false">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#" onclick="return false">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagingBean.nextPageGroup}">			<!-- 다음 페이지로 넘어갈 만큼 충분한 게시글이 있으면 '>>' 페이지 넘기기 버튼이 생성된다. -->
						<li><a href="#" onclick="commentsPaging(${pagingBean.endPageOfPageGroup+1}); return false">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	</div>