<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".partyUpdate").submit(function() {
			var tr = $(this).parent().parent().children();
		    var applyPeople = tr.eq(4).text();
		    var subapplyPeople = applyPeople.substring(0,1);
			//alert(subapplyPeople);
			if(subapplyPeople == 0){
				return confirm("수정하시겠습니까?");
			}else{
				alert("수정할수 없습니다.");
				return false;
			}
		})
		$(".partyDelete").submit(function() {
			return confirm("삭제하시겠습니까?");
		})

		$(".partyApply").click(function(e) {
			if(confirm("지원하시겠습니까?")){
			var apply = $(this);
			var partyApply = $(this);
			var tr = partyApply.parent().parent();
			var td = tr.children();
			var statusValue = tr.children(".status");
			var partyNo = td.eq(0).text();
			apply.off(e);
			apply.val('지원완료');
			alert(apply.val());
			/* var partyTitle = td.eq(1).text();
			var membershipName = td.eq(2).text();
			var partyHeadCount = td.eq(3).text();
			var memberVO_id = td.eq(5).text();
			var partyPostedTime = td.eq(6).text(); */
			 $.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/partyApply.do",
					dataType : "json",
					data :{partyNo:partyNo},					
					beforeSend : function(xhr){   
						/*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
			         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			         },					
					success : function(result) {
						//statusValue.html("모집완료");
				 }
				});//ajax   
			}
		})// 지원 버튼
		$(".partyApply2").click(function() {
			alert("이미지원하였습니다.");
		})
		
		$(".partyApply3").click(function() {
			alert("모집마감 되었습니다.");
		})
	})
</script>
<div class="tableMargin" id="commentsList">
<div class="container-lg boardClassMain">
<!-- 뒷백경 동영상-->
<!-- <div style="position: fixed; z-index: -99; width: 100%; height: 100%">
<iframe frameborder="0" height="100%" width="100%" 
src="https://www.youtube.com/embed/Ck-h9YGKyOc?mute=1&loop=1&autoplay=1&rel=0&controls=0&showinfo=0" allow="autoplay; encrypted-media" allowfullscreen>
</iframe>
 -->
    <table class="table table-hover table-bordered" style="border-radius: 1.5px;">
			<tr>
				<th style="width: 5%; padding-right: 3px; padding-left: 3px;">번호</th>
				<th>제목</th>
				<th>이용권종류</th>
				<th style="width: 8%; padding-right: 3px; padding-left: 3px;">모집 인원</th>
				<th>모집 상태</th>
				<th>작성자</th>
				<th>등록일</th>
				<th colspan='2'></th>
			</tr>
			<tbody>
				<c:forEach var="plvo" items="${requestScope.PLVO.partyList}">
					<tr>
						<td>${plvo.partyNo}</td>
						<td>${plvo.partyTitle}</td>
						<td>${plvo.membershipVO.membershipName}</td>
						<td>${plvo.partyHeadCount}</td>
						<td class="status">${plvo.partyApplyCount}명 ${plvo.partyStatus}</td>
						<td>${plvo.memberVO.id}</td>
						<td>${plvo.partyPostedTime}</td>
						<!--로그인한 경우 Start  -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication var="mvo" property="principal" />
						<c:choose>
							<c:when test="${mvo.id eq plvo.memberVO.id}">
								<td>
									<form action="goPartyUpdate.do" class=partyUpdate method="get"
										class="partyUpdate">
										<sec:csrfInput />
										<!-- csrf 토큰  -->
										<input type="hidden" name="partyNo" value="${plvo.partyNo}">
										<button class="checkBtn btn-outline-warning">수정</button>
									</form>
								</td>
								<td>
									<form action="partyDelete.do" class=partyDelete method="post">
										<sec:csrfInput />
										<!-- csrf 토큰 -->
										<input type="hidden" name="partyNo" value="${plvo.partyNo}">
										<button class="checkBtn btn-outline-warning">삭제</button>
									</form>
								</td>
							</c:when>
							<c:otherwise>
								<c:choose>
								<c:when test="${(plvo.partyHeadCount > plvo.partyApplyCount)}">
									<c:if test="${(plvo.isApply eq 'N')}">
									<td><input type="button"
										class="checkBtn btn-outline-primary partyApply" value="지원하기" /></td>
									</c:if>
									<c:if test="${(plvo.isApply eq 'Y')}">
									<td><input type="button"
										class="checkBtn btn-outline-primary partyApply2" value="지원완료" /></td>
									</c:if>									
								</c:when>		
								
								<c:otherwise>
								<td><input type="button"
										class="checkBtn btn-outline-success partyApply3" value="모집완료" /></td>
								</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<td><input type="button"
							class="checkBtn btn-outline-primary partyApply" value="지원하기"
							onclick="location.href='${pageContext.request.contextPath}/loginForm.do'" />
						</td>
					</sec:authorize>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<sec:authorize access="isAuthenticated()"> 
		<button type="button" class="writepartyBtn btn-outline-primary" style="width: 200px; float:right;"
			onclick="location.href='${pageContext.request.contextPath}/partyWriteForm.do'">파티모집하러가기</button>
		</sec:authorize>	
		<!--로그인한 경우 end  -->
			
		<%-- 페이징빈 처리 영역 --%>
		<div class="boardBottomDiv" style="width: 50%;">
		<div class="pagingInfo">
			<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
			<c:set var="pb" value="${requestScope.PLVO.pagingBean}"></c:set>
			<ul class="pagination">
				<c:if test="${pb.previousPageGroup}">
					<li class="page-item"><a class="btn btn-outline-primary"
						href="${pageContext.request.contextPath}/partyList.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li class="page-item"><a
								href="${pageContext.request.contextPath}/partyList.do?pageNo=${i}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pb.nextPageGroup}">
					<li class="page-item"><a class="btn btn-outline-primary"
						href="${pageContext.request.contextPath}/partyList.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		</div>
</div>
</div>	
