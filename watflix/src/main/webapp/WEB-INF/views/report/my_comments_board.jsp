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
function getMyCommentsByPaging(commnetsPageNo){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/myCommentsList.do",
			dataType: "json",
			data: 'pageNo='+commentsPageNo
			success:function(commentsData){	
				listByReportType(commentsData);	
				reportPostPaging(rcommentsData);
			}
		});
}
function getCommentsAfterDelete(contentsNo, commentsNo, commentsPageNo){
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath}/commentsDelete.do",
		dataType: "json",
		data:{
			"contentsNo" : contentsNo
			"commentsNo" : commentsNo
			"commentsPageNo" : commentsPageNo
		},
		beforeSend : function (){
			
		},
		success:function(commentsData){	
			listByReportType(commentsData);	
			reportPostPaging(commentsData);
		}
	});
}
function listByReportType(commentsListVO){
			// 테이블에 집어넣을 문자열 데이터 변수
			var commentsTbody = "";
			//table의 tbody
			for (var i = 0; i < commentsListVO.list.length; i++){
						commentsTbody += "<tr>";
							commentsTbody += "<td class='starPointImg' style='width: 15%''>"+commentsListVO.list[i].commentsStars+"</td>";
							commentsTbody += "<td style='width: 5%'>"+ commentsListVO.list[i].commentsStars + "</td>";
							commentsTbody += "<td>";
							commentsTbody += data.list[i].comments + "<br>" + commentsListVO.list[i].memberVO.id +" "+ commentsListVO.list[i].commentsPostedTime;
							/* 권한 부여하고자 하였으나 실패함 */
							commentsTbody += "<form action='commentsDelete.do' method='post' onsubmit='return commentsDeleteConfirm()' style='display: inline-flex;'>";
							commentsTbody += '<sec:csrfInput/>';
							commentsTbody += "<input type='hidden' name='contentsNo' value='"+ commentsListVO.list[i].contentsNo +"'>";	
							commentsTbody += "<input type='hidden' name='commentsDelete' value='"+ commentsListVO.list[i].commentsNo +"'>";	
							commentsTbody += "<input type='hidden' name='pageNo' value='"+ commentsListVO.pagingBean.nowPage+"'>";	
							commentsTbody += "<input type='submit' value='삭제'>";	
							commentsTbody += "</form>";	
							commentsTbody += "</td>";
						commentsTbody += "</tr>";	
					}
					$("#commentsTbody").html(commentsTbody);
				}
			})
}
function reportPostPaging(commentsListVO){				
					// table 페이징
					var commentsPaging ="";
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
	</script>
	<div class="tableMargin" id="commentsList">
	<div class="container-lg boardClassMain" style="margin-top: 100px">
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
					<!-- 삭제버튼 (작성자와 관리자에게만 노출된다.) -->
					<c:set var="writerId" value="${commentsList.memberVO.id }"/>
					<c:if test="${writerId == userId}">
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
	    <!-- </tbody> -->
	  </table>
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