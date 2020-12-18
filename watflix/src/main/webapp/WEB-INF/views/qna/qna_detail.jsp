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
	function writeAndGetAnswer(){
		alert($("#answerContents").val());
		var answerContents = $("#answerContents").val();
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/qnaAnswerWrite.do",
			dataType: "json",
			data: 'qnaAnswerContents='+answerContents+'&qnaNo='+${requestScope.qvo.qnaNo},
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
			success:function(answerData){
				alert(answerData.qnaAnswerList[0].qnaAnswerNo);
			}
		})
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
<div id="adminAnswer">
</div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<!-- 관리자만 답변입력 가능 -->
<%-- <form action="${pageContext.request.contextPath }/qnaAnswerWrite.do" method="post" >
<sec:csrfInput/> --%>
관리자 답변 <textarea cols="100" rows="3" name="answerContents" id="answerContents" placeholder="답변내용을 입력하세요"></textarea>
<%-- <input type="hidden" name="qnaNo" value="${requestScope.qvo.qnaNo}">
<input type="submit" class="btn" value="답변작성">
</form> --%>
<button type="button" onclick="writeAndGetAnswer()">답변작성</button>
<button class="btn" form="qnaDelete" type="submit" id="qna-delete-btn" >삭제</button>
</sec:authorize>
<button class="btn" id="qnaListBtn" onclick="qnaListBtn()">내 문의 목록 보기</button>
<br><br>
</div>
<!-- qna 삭제? -->
<%-- <form action="qnaDelete.do" id="qnaDelete" method="post">
<sec:csrfInput/>
<input type="hidden" name="qnaNo" value="${requestScope.qvo.qnaNo}">
</form> --%>
</div>
</html>
