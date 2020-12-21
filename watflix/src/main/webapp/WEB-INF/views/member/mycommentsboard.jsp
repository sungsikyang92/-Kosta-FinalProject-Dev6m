<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	
	<script type="text/javascript">
$(document).ready(function(){
	$(".starPointImg").each(function(){
		var starPoint = $(this).html();
		$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
	})
})
function getMyCommentsByPaging(commentsPageNo){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/myCommentsList.do",
			dataType: "json",
			data: 'pageNo='+ commentsPageNo,
			success:function(commentsData){	
				listMyComments(commentsData);	
				commentsPostPaging(commentsData);
			}
		});
}
function getCommentsAfterDelete(contentsNo, commentsNo, commentsPageNo){
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/commentsDeleteAjax.do",
		dataType: "json",
		data:
			"contentsNo="+contentsNo+
			"&commentsNo="+commentsNo+
			"&pageNo="+commentsPageNo
		,
		beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
		success:function(commentsData){	
			listMyComments(commentsData);	
			commentsPostPaging(commentsData);
		}
	});
}
// 리스트 바디 메소드
function listMyComments(commentsListVO){
			var commentsTbody = "";
			for (var i = 0; i < commentsListVO.list.length; i++){
						commentsTbody += "<tr>";
							commentsTbody += "<td class='starPointImg' style='width: 15%''>"+commentsListVO.list[i].commentsStars+"</td>";
							commentsTbody += "<td style='width: 5%'>"+ commentsListVO.list[i].commentsStars + "</td>";
							commentsTbody += "<td>";
							commentsTbody += commentsListVO.list[i].comments + "<br>" + commentsListVO.list[i].memberVO.id +" "+ commentsListVO.list[i].commentsPostedTime;
							/* 삭제기능 보류
								commentsTbody += "<button type='button' name='deleteButton' style='width: 56px; float: right;' onclick='getCommentsAfterDelete("+ commentsListVO.list[i].contentsNo +","+ commentsListVO.list[i].commentsNo +","+ commentsListVO.pagingBean.nowPage+")'>삭제</button>";
							 */
							commentsTbody += "</td>";
						commentsTbody += "</tr>";	
					}
					$("#commentsTbody").html(commentsTbody);
				}
//페이징 바디 메소드
function commentsPostPaging(commentsListVO){				
					// table 페이징
					var commentsPaging ="";
					var startPageGroup = commentsListVO.pagingBean.startPageOfPageGroup;
					var endPageGroup = commentsListVO.pagingBean.endPageOfPageGroup;
					// 왼쪽 페이징 화살표
					if (commentsListVO.pagingBean.previousPageGroup){
						commentsPaging += "<li><a href='#' onclick='getMyCommentsByPaging("+ (startPageGroup -1) +");return false;'>&laquo;</a></li>";
					}
					// 페이징 번호
					for (var commentsPageNo = startPageGroup; commentsPageNo < endPageGroup + 1; commentsPageNo++){
						if(commentsListVO.pagingBean.nowPage != commentsPageNo){
							commentsPaging += "<li><a href='#' onclick='getMyCommentsByPaging("+ commentsPageNo +");return false;'>"+ commentsPageNo +"</a></li>";
						}else{
							commentsPaging += "<li><a href='#' onclick='return false'>"+ commentsPageNo +"</a></li>";
						}
					}
					// 오른쪽 화살표 페이징
					if(commentsListVO.pagingBean.nextPageGroup){
						commentsPaging += "<li><a href='#' onclick='getMyCommentsByPaging("+ (endPageGroup + 1) +");return false'>&raquo;</a></li>";
					}
					$("#commentsPaging").html(commentsPaging);
					// 코드가 중복됨 수정 필요함
					$(".starPointImg").each(function(){
						var starPoint = $(this).html();
						$(this).html("<img src='${pageContext.request.contextPath}/resources/media/icons/star"+starPoint+".png' style='height: 25px'>");
					})
				}
	</script>
	<div class="tableMargin">
	<div class="container-lg boardClassMain">
	  <h2>평점리스트</h2>           
	  <table class="table table-hover table-bordered" id="commentsTbody" style="border-radius: 1.5px;">
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<sec:authentication property="principal.id" var="userId"/>
	</sec:authorize>
	    <!-- <tbody id="commentsTbody"> -->
	    <c:forEach items="${requestScope.commentsListVO.list}" var="commentsList">
	      <tr>
			<td class="starPointImg" style="width: 15%">${commentsList.commentsStars}</td>
				<td style="width: 5%">${commentsList.commentsStars}</td>
				<td>
					${commentsList.comments}<br>
					${commentsList.memberVO.id }
					${commentsList.commentsPostedTime}
					<%-- 삭제기능 보류
					<button type='button' name='deleteButton' style='width: 56px; float: right;' onclick='getCommentsAfterDelete(${commentsList.contentsVO.contentsNo},${commentsList.commentsNo},${requestScope.commentsListVO.pagingBean.nowPage})'>삭제</button>
					 --%>
				</td>			
	      </tr>
	      </c:forEach>
	    <!-- </tbody> -->
	  </table>	  
	  	<div class="boardBottomDiv" style="width: 50%">
			<div class="pagingInfo" id="pagingLocation">
				<c:set var="pagingBean" value="${requestScope.commentsListVO.pagingBean}"/>
				<ul class="pagination" id = "commentsPaging">
					<c:if test="${pagingBean.previousPageGroup}">
						<li class="page-item"><a href="#" onclick="getMyCommentsByPaging(${pagingBean.startPageOfPageGroup-1}); return false">&laquo;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pagingBean.nowPage != i}">
								<li><a href="#" onclick="getMyCommentsByPaging(${i}); return false;">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="active"><a href="#" onclick="return false">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagingBean.nextPageGroup}">			<!-- 다음 페이지로 넘어갈 만큼 충분한 게시글이 있으면 '>>' 페이지 넘기기 버튼이 생성된다. -->
						<li><a href="#" onclick="getMyCommentsByPaging(${pagingBean.endPageOfPageGroup+1}); return false">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	</div>