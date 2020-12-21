 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script type="text/javascript">
	function answerPaging(qnaNo, pageNo){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/qnaAnswerList.do",
			dataType: "json",
			data: 'qnaNo='+qnaNo+
				  '&pageNo='+pageNo,				 
			success:function(result){
				qnaAnswerList(result);
			}
		})
	}
	$(document).ready(function() {
		$("#qnaDelete").submit(function() {
			return confirm("정말 삭제하시겠습니까?");
		});  //qnaDelete
	});
	
	function writeAndGetAnswer(){
		alert("답변을 작성하시겠습니까?");
		var answerContents = $("#answerContents").val();
		var qnaNo = ${requestScope.qvo.qnaNo};
		
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/qnaAnswerWrite.do",
			dataType: "json",
			data: 'qnaAnswerContents='+answerContents+
				  '&qnaNo='+qnaNo,				 
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success:function(answerData){
				qnaAnswerList(answerData);
				$("#answerContents").val("");
			}
		})
	}
	function qnaAnswerList(qnaAnswerListVO){
		var answerBody = "";
		for (var i=0; i < qnaAnswerListVO.qnaAnswerList.length; i++){
			answerBody += "<tr>";
			answerBody += "<td>"+(i+1)+"</td>";
			answerBody += "<td>"+qnaAnswerListVO.qnaAnswerList[i].memberVO.id+"</td>";
			answerBody += "<td>"+qnaAnswerListVO.qnaAnswerList[i].qnaAnswerContents+"</td>";
			answerBody += "<td>"+qnaAnswerListVO.qnaAnswerList[i].qnaAnswerPostedTime+"</td>";			
			answerBody += "<td><input type='hidden'class='qnaAnswerNoVal' value='"+qnaAnswerListVO.qnaAnswerList[i].qnaAnswerNo+"'>삭제</td>";			
			answerBody +="</tr>";
		}
		$("#adminAnswer").html(answerBody);		
	}
	/* answerBody += "<td><button class='qnaAnswerBtn' type='button' onclick='return false'>삭제</button></td>";		 */

	function qnaListBtn() {
		location.href="${pageContext.request.contextPath}/qnaList.do";
	}
	
	function deleteConfirm(){
	
	}
</script>
<div class="tableMargin">
	<div class="container-lg boardClassMainQnA">
		<div id="qnaForm">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="qnaNo">NO</th>
						<th class="qnaTypeNo">문의</th>
						<th class="qnaTitle">제목</th>
						<th class="qnaWriter">작성자</th>
						<th class="qnaPostedTime">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${requestScope.qvo.qnaNo}</td>
						<td>${requestScope.qvo.qnaTypeVO.qType}</td>
						<td>${requestScope.qvo.qnaTitle}</td>
						<td>${requestScope.qvo.memberVO.id}</td>
						<td>${requestScope.qvo.qnaPostedTime}</td>
					</tr>
					<tr>
						<td colspan="4"><div style="margin: 0 auto;">
								<pre style="white-space: pre-wrap;">
									<br><br>${requestScope.qvo.qnaContents}</pre>
							</div></td>
					</tr>
				</tbody>

			</table>
			<!-- 관리자 답변내용  -->
			<table class="table table-hover" id="adminAnswer">
				<c:forEach items="${requestScope.answerListVO.qnaAnswerList}"
					var="qnaAnswerList" varStatus="index">
					<tr>
						<td>${index.count}</td>
						<td>${qnaAnswerList.memberVO.id}</td>
						<td>${qnaAnswerList.qnaAnswerContents}</td>
						<td>${qnaAnswerList.qnaAnswerPostedTime}</td>
						<td><button class="qnaAnswerBtn" type='button'
								onclick='return false;'>수정</button></td>
						<td><button class="qnaAnswerBtn" type='button'
								onclick='return false;'>삭제</button></td>
					</tr>
				</c:forEach>
			</table>
			<table class="table table-hover">
				<tr>
					<td>
						<!-- 답변페이징 -->
						<div class="boardBottomDiv" style="width: 50%">
							<div class="pagingInfo" id="pagingLocation">
								<c:set var="pagingBean"
									value="${requestScope.answerListVO.pagingBean}" />
								<ul class="pagination">
									<c:if test="${pagingBean.previousPageGroup}">
										<li><a href="#"
											onclick="answerPaging(${pagingBean.startPageOfPageGroup-1},${requestScope.qvo.qnaNo})">&laquo;</a></li>
									</c:if>
									<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}"
										end="${pagingBean.endPageOfPageGroup}">
										<c:choose>
											<c:when test="${pagingBean.nowPage!=i}">
												<div class="pageNoBtn">
													<li><a href="#"
														onclick="answerPaging(${i},${requestScope.qvo.qnaNo})">${i}</a></li>
												</div>
											</c:when>
											<c:otherwise>
												<li class="active"><a href="#">${i}</a></li>
											</c:otherwise>
										</c:choose>
										&nbsp;
									</c:forEach>
									<c:if test="${pagingBean.nextPageGroup}">
										<li><a href="#"
											onclick="answerPaging(${pagingBean.endPageOfPageGroup+1},${requestScope.qvo.qnaNo})">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</td>
				</tr>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<tr>
						<td class="btnArea">관리자 답변 <textarea cols="100" rows="3"	name="answerContents" id="answerContents"	placeholder="답변내용을 입력하세요"></textarea>
							<button class="btn-list btn btn-default boardDetailBtn" type="button" onclick="writeAndGetAnswer()" style=color:black;>답변작성</button>
						</td>
					</tr>
					<tr>
						<td>
							<button class="btn-list btn btn-default boardDetailBtn" form="qnaDelete" type="submit" id="qna-delete-btn" style=color:black;>삭제</button>
						</td>
					</tr>
				</sec:authorize>
				<tr>
					<td>
						<button class="btn-list btn btn-default boardDetailBtn" id="qnaListBtn"	onclick="qnaListBtn()" style=color:black;>목록</button>
					</td>
				</tr>
			</table>
			<!-- qna 삭제 -->
			<form action="qnaDelete.do" id="qnaDelete" method="post">
				<sec:csrfInput/>
				<input type="hidden" name="qnaNo" value="${requestScope.qvo.qnaNo}">
				<input type="hidden" name="pageNo" value="${requestScope.pageNo}">
			</form>
		</div>
	</div>
</div>