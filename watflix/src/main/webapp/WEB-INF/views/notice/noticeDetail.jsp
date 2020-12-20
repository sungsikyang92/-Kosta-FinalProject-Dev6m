<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready(function(){
		// 공지글 목록으로 돌아가는 메소드
		$("#backToNoticeList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/getNoticeList.do?pageNo=${requestScope.pageNo}";
			}
		})
	})
</script>
<div class="tableMargin">
<div class="container-lg boardClassMain">
	<table class="table table-bordered" style="border-radius: 1.5px;">
		<tr>

			<td>제목</td>
			<td colspan="7">${requestScope.noticeDetail.noticeTitle}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="7">${requestScope.noticeDetail.noticeContents}</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>${requestScope.noticeDetail.noticeNo}</td>
			<td>작성자</td>
			<td>${requestScope.noticeDetail.memberVO.id}</td>
			<td>작성일자</td>
			<td>${requestScope.noticeDetail.noticePostedTime}</td>
			<td>조회수</td>
			<td>${requestScope.noticeDetail.noticeHits}</td>
		</tr>
		<tr>
			<td colspan="8" class="btnArea">
				<button type="button" class="btn-list btn btn-default boardDetailBtn" id="backToNoticeList">목록</button>
			</td>
		</tr>		
	</table>
</div>
</div>