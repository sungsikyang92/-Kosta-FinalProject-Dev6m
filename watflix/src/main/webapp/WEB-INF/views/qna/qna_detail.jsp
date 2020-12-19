<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/resources/css/style.css">
   <div class="container-lg">
<div id="qnaForm">
<script type="text/javascript">
	function answerPaging(qnaNo, pageNo){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/qnaAnswerList.do",
			dataType: "json",
			data: 'qnaNo='+qnaNo+
				  'pageNo='+pageNo,				 
			success:function(result){
				qnaAnswerList(result);
			}
		})
	}
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
			answerBody += "<table><tr>";
			answerBody += "<td>"+i+1+"</td>";
			answerBody += "<td>"+qnaAnswerListVO.qnaAnswerList[i].memberVO.id+"</td>";
			answerBody += "<td>"+qnaAnswerListVO.qnaAnswerList[i].qnaAnswerContents+"</td>";
			answerBody += "<td>"+qnaAnswerListVO.qnaAnswerList[i].qnaAnswerPostedTime+"</td>";
			answerBody += "<td><button type='button' onclick='return false;'>삭제</button></td>";			
			answerBody += "<td><button type='button' onclick='return false;'>수정</button></td>";			
			answerBody +="</tr></table>";
		}
		$("#adminAnswer").html(answerBody);		
	}

	function qnaListBtn() {
		location.href="${pageContext.request.contextPath}/qnaList.do";
	}
</script>
<hr>
<hr>
<hr>
<table class="table table-hover">
   <thead>
      <tr>
         <th class="qnaNo">NO</th>
         <th class="qnaTypeNo">문의</th>
         <th class="qnaTitle"></th>
         <th class="qnaWriter"></th>
         <th class="qnaPostedTime"></th>
         <th class="qnaDetail"></th>
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
         <td colspan="4"><div style="margin:0 auto;" ><pre style="white-space:pre-wrap;" ><br><br>${requestScope.qvo.qnaContents}</pre></div></td>
         </tr>
   </tbody>

</table>
<!-- 관리자 답변내용  -->
<table id="adminAnswer">
	<c:forEach items="${requestScope.answerListVO.qnaAnswerList}" var="qnaAnswerList" varStatus="index">
	<tr>
		<td>${index.count}</td>
		<td>${qnaAnswerList.memberVO.id}</td>
		<td>${qnaAnswerList.qnaAnswerContents}</td>
		<td>${qnaAnswerList.qnaAnswerPostedTime}</td>
		<td><button type='button' onclick='return false;'>수정</button></td>
		<td><button type='button' onclick='return false;'>삭제</button></td>	
	</tr>
	</c:forEach>
</table>
<!-- 답변페이징 -->
<div class="boardBottomDiv" style="width: 50%">
		<div class="pagingInfo" id="pagingLocation">
			<c:set var="pagingBean" value="${requestScope.answerListVO.pagingBean}"/>
			<ul class="pagination">
				<c:if test="${pagingBean.previousPageGroup}">
					<li><a href="#" onclick="answerPaging(${pagingBean.startPageOfPageGroup-1},${requestScope.qvo.qnaNo})">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${pagingBean.startPageOfPageGroup}" end="${pagingBean.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pagingBean.nowPage!=i}">
							<li><a href="#" onclick="answerPaging(${i},${requestScope.qvo.qnaNo})">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>
					&nbsp;
				</c:forEach>
					<c:if test="${pagingBean.nextPageGroup}">
						<li><a href="#" onclick="answerPaging(${pagingBean.endPageOfPageGroup+1},${requestScope.qvo.qnaNo})">&raquo;</a></li>
					</c:if>
			</ul>
		</div>
		</div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<!-- 관리자만 답변입력 가능 -->
<%-- <form action="${pageContext.request.contextPath }/qnaAnswerWrite.do" method="post" >
<sec:csrfInput/> --%>
관리자 답변 <textarea cols="100" rows="3" name="answerContents" id="answerContents" placeholder="답변내용을 입력하세요"></textarea>
<%-- <input type="hidden" name="qnaNo" value="${requestScope.qvo.qnaNo}">
<input type="submit" class="btn" value="답변작성">
</form> --%>
<button  class="btn-listFaQ btnFaQ boardDetailBtnFaQ" type="button" onclick="writeAndGetAnswer()">답변작성</button>
<button class="btn-listFaQ btnFaQ boardDetailBtnFaQ" form="qnaDelete" type="submit" id="qna-delete-btn" >삭제</button>
</sec:authorize>
<button class="btn-listFaQ btnFaQ boardDetailBtnFaQ" id="qnaListBtn" onclick="qnaListBtn()">내 문의 목록 보기</button>
<br><br>
</div>
<!-- qna 삭제? -->
<%-- <form action="qnaDelete.do" id="qnaDelete" method="post">
<sec:csrfInput/>
<input type="hidden" name="qnaNo" value="${requestScope.qvo.qnaNo}">
</form> --%>
</div>
</html>
