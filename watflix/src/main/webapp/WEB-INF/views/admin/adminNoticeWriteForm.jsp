<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<script type="text/javascript">
	$(document).ready(function(){
		// 글 제목 작성을 30자로 제한하고 글자 수를 나타낸다.
		$("#noticeTitle").on('keydown', function(){
			$("#countTitleWord").html("("+$(this).val().length+" / 30)");
			// 글자수가 30이 넘으면 30자 이하로 잘라내고 alert을 호출한다.
			if($(this).val().length > 30){
				$(this).val($(this).val().substring(0,30));
				$("#countTitleWord").html("(30 / 30)");
				alert("제목은 공백을 포함하여 30자 이하로 작성하세요.");
			}
		})
		// 글 내용 작성을 1000자로 제한하고 글자 수를 나타낸다.
		$("#noticeContents").on('keydown', function(){
			$("#countContentsWord").html("("+$(this).val().length+" / 1000)");
			// 글자수가 1000이 넘으면 1000자 이하로 잘라내고 alert을 호출한다.
			if($(this).val().length > 1000){
				$(this).val($(this).val().substring(0,1000));
				$("#countContentsWord").html("(1000 / 1000)");
				alert("내용은 공백을 포함하여 1000자 이하로 작성하세요.");
			}
		})
		// 글 등록을 확인하는 confirm을 호출한다.
		$("#noticeWriteForm").submit(function(){
			return confirm("글을 등록하시겠습니까?");
		})
		// 공지글 목록으로 돌아가는 메소드
		$("#backToNoticeList").click(function(){
			if(confirm("리스트로 이동하시겠습니까?")){
				return location.href="${pageContext.request.contextPath}/getNoticeListAdmin.do?pageNo=${requestScope.pageNo}";
			} else {
				return;
			}
		})
	})
</script>
<div class="tableMargin">
	<div class="container-lg boardClassMainFaQ">
		<form action="${pageContext.request.contextPath}/noticeWrite.do" method="post" id="noticeWriteForm">
			<sec:csrfInput/>
			<table class="table table-bordered" style="border-radius: 1.5px;">
				<tr>
					<td class="boardTd">제목</td>
					<td>
						<input style="width : 754px" type="text" name="noticeTitle" id="noticeTitle" class="boardTitle" placeholder="공지사항의 제목을 입력해주세요!" required="required">
						<!-- 현재 제목 글자수를 나타낸다. -->
						<div id="countTitleWord"style="float: right;">(0/30)</div>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea style="width : 754px; height : 302px;" name="noticeContents" id="noticeContents" class="boardTextarea" placeholder="공지사항의 내용을 입력해주세요!" required="required"></textarea>
						<div id="countContentsWord"style="float: right;">(0/1000)</div>
					</td>					
				</tr>				
				<tr>
					<td colspan="2" class="btnArea">
						<button style="color: black" type="button" class="btn-list btn btn-default boardDetailBtn" id="backToNoticeList">목록</button>
						<button style="color: black" type="submit" class="btn-list btn btn-default boardDetailBtn">확인</button>
						<button style="color: black" type="reset" class="btn-list btn btn-default boardDetailBtn">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</sec:authorize>