<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 게시판</title>
<!-- 테스트 중인 css 나중에 지울것 -->
<style type="text/css">
.test {
  border-collapse: collapse;
}
</style>
</head>
<body>

	<table border="1" class="test">
		<thead>
			<tr>
				<th>No</th>
				<th>신고자ID</th>
				<th>신고 유형</th>
				<th>신고된 리뷰No</th>
				<th>리뷰 작성자ID</th>
				<th>신고 날짜</th>
				<th>비고</th>
			</tr>
		</thead>
		<!-- 신고 리스트(리뷰) -->
		<tbody>
			<c:forEach var="rvo" items="${requestScope.reportReviewList.list}">
				<tr>
					<td>${rvo.reportNo}</td>
					<td>${rvo.memberVO.id}</td>
					<td>${rvo.reportTypeVO.reportTypeNo}</td>
					<td>${rvo.reviewVO.reviewNo}</td>
					<td>${rvo.reviewVO.memberVO.id}</td>
					<td>${rvo.reportPostedTime}</td>
					<td>
						<!-- 신고글 삭제 -->
						<form action="deleteReport.do" method="post">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="reportNo" value="${rvo.reportNo}">
							<input type="submit" value="deleteReport">
						</form>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<pre>${rvo.reportContents }</pre>
					</td>
					<td>
						<!-- 신고된 평점 삭제 -->
						<!-- ReviewController 참고 후 수정 -->
						<form action="" method="post">
							<!-- CSRF 방지 토큰,  Cross-site request forgery(사이트간 요청 위조)를 방지  -->
							<sec:csrfInput/>
							<input type="hidden" name="" value="${rvo.reviewVO.reviewNo}">
							<input type="hidden" name="commentsNo" value="${rvo.commentsVO.commentsNo}">
							<input type="submit" value="deleteComments">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<!-- 페이징 -->
		<tfoot>
			<tr>
				<td colspan="7">
					<div>
						<!-- pagingBean을 pb변수로 지정 -->
						<c:set var="pb" value="${requestScope.reportReviewList.pagingBean }"></c:set>
						<ul>
							<!-- 조건이 맞으면 왼쪽 화살표 -->
							<c:if test="${pb.previousPageGroup}">
								<li>
									<a href="${pageContext.request.contextPath }/reportReviewBoardNext.do?pageNo=${pb.startPageOfPageGroup-1}">
										&laquo;
									</a>
								</li>
							</c:if>
							<!-- 페이지 넘버 표시 -->
							<c:forEach var="pageNumber"
								begin="${pb.startPageOfPageGroup}"
								end="${pb.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${pb.nowPage!=pageNumber }">
										<li>
											<a href="${pageContext.request.contextPath }/reportReviewBoardNext.do?pageNo=${pageNumber}">
												${pageNumber}
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="#">
												${pageNumber }
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								&nbsp;
							</c:forEach>
							<!-- 조건에 맞으면 오른쪽 화살표 -->
							<c:if test="${pb.nextPageGroup}">
								<li>
									<a href="${pageContext.request.contextPath }/reportReviewBoardNext.do?pageNo=${pb.endPageOfPageGroup+1}">
										&raquo;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<hr>
	<h5>마이 페이지 리스트 테스트 구간입니다.</h5>
	<!-- jquery 사용에 필요함 -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		// 웹페이지 로딩 후 바로 실행 됨
		$(document).ready(function() {
			// 테이블에 집어넣을 문자열 데이터 변수
			var reporThead ="";
			var reportTbody = "";
			var reportTfoot = "";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myReportReviewBoard.do",
				success:function(data){
					//alert("ajax 통신 테스트");
					//alert(data.pagingBean.nowPage);
					//alert(data.list[0].reportNo);
					//alert(data.list.length);
					//for(var i = 0; i < data.list.length; i++) {
						//alert(data.list[i].reportNo);
					//}
					
					// table의 thead
					reporThead += "<th>리뷰 No</th>";
					reporThead += "<th>신고 유형</th>";
					reporThead += "<th>게시물 작성자 ID</th>";
					reporThead += "<th>신고 날짜</th>";
					reporThead += "<th>비고</th>";
					$("#reporThead").html(reporThead);
					
					// table의 tbody
					for (var i=0; i < data.list.length; i++){
						reportTbody += "<tr>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.reviewNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportTypeVO.reportTypeNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.memberVO.id;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportPostedTime;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += "해당 개시물로 이동"; // 링크 추가 예정
							reportTbody += "</th>";
						reportTbody += "</tr>";
						reportTbody += "<tr>";
							reportTbody += "<td colspan=\"5\">";
								reportTbody += "<pre>";
									reportTbody += data.list[i].reportContents;
								reportTbody += "</pre>";
							reportTbody += "</td>";
						reportTbody += "</tr>";
					}
					$("#reportTbody").html(reportTbody);
					
					// <li>에 value, class 기입이 가능함. ajax를 위해 내용 기입 필요
					// table의 tfoot( 페이징 )
					// 왼쪽 페이징 화살표
					//alert(data.pagingBean.startPageOfPageGroup-1)
					if (data.pagingBean.previousPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\">";
								reportTfoot += "&laquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					// 페이징 번호
					//alert(data.pagingBean.startPageOfPageGroup);
					//alert(data.pagingBean.endPageOfPageGroup);
					for (var reportPageNo=data.pagingBean.startPageOfPageGroup; reportPageNo < data.pagingBean.endPageOfPageGroup + 1; reportPageNo++){
						if(data.pagingBean.nowPage != reportPageNo){
							reportTfoot += "<li>";
								// 페이지 버튼을 클릭하면 reportPaging() 메서드가 동작하도록 함
								reportTfoot += "<a href=\"#\" class=\"reportPage\" onclick=\"reportPaging("+ reportPageNo +");return false;\">";
									reportTfoot += reportPageNo;
								reportTfoot += "</a>";
							reportTfoot += "</li>";
						}else{
							reportTfoot += "<li>";
								reportTfoot += "<a href=\"#\" onclick=\"return false\">";
									reportTfoot += reportPageNo;
								reportTfoot += "</a>";
							reportTfoot += "</li>";
						}
					}
					// 오른쪽 화살표 페이징
					//alert(data.pagingBean.nextPageGroup);
					if(data.pagingBean.nextPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\">";
								reportTfoot += "&raquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					$("#reportTfoot").html(reportTfoot);
					
				}
			})
		})
		
		// 페이지 버튼을 클릭하면 페이징
		function reportPaging(reportPageNo){
			var reporThead ="";
			var reportTbody = "";
			var reportTfoot = "";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myReportReviewBoardNext.do?pageNo="+reportPageNo,
				success:function(data){
					reporThead += "<th>리뷰 No</th>";
					reporThead += "<th>신고 유형</th>";
					reporThead += "<th>게시물 작성자 ID</th>";
					reporThead += "<th>신고 날짜</th>";
					reporThead += "<th>비고</th>";
					$("#reporThead").html(reporThead);
					
					// table의 tbody
					for (var i=0; i < data.list.length; i++){
						reportTbody += "<tr>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.reviewNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportTypeVO.reportTypeNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.memberVO.id;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportPostedTime;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += "해당 개시물로 이동"; // 링크 추가 예정
							reportTbody += "</th>";
						reportTbody += "</tr>";
						reportTbody += "<tr>";
							reportTbody += "<td colspan=\"5\">";
								reportTbody += "<pre>";
									reportTbody += data.list[i].reportContents;
								reportTbody += "</pre>";
							reportTbody += "</td>";
						reportTbody += "</tr>";
					}
					$("#reportTbody").html(reportTbody);
					
					// <li>에 value, class 기입이 가능함. ajax를 위해 내용 기입 필요
					// table의 tfoot( 페이징 )
					// 왼쪽 페이징 화살표
					//alert(data.pagingBean.startPageOfPageGroup-1)
					if (data.pagingBean.previousPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\">";
								reportTfoot += "&laquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					// 페이징 번호
					//alert(data.pagingBean.startPageOfPageGroup);
					//alert(data.pagingBean.endPageOfPageGroup);
					for (var reportPageNo=data.pagingBean.startPageOfPageGroup; reportPageNo < data.pagingBean.endPageOfPageGroup + 1; reportPageNo++){
						if(data.pagingBean.nowPage != reportPageNo){
							reportTfoot += "<li>";
								reportTfoot += "<a href=\"#\" class=\"reportPage\" onclick=\"reportPaging("+ reportPageNo +");return false;\">";
									reportTfoot += reportPageNo;
								reportTfoot += "</a>";
							reportTfoot += "</li>";
						}else{
							reportTfoot += "<li>";
								reportTfoot += "<a href=\"#\" onclick=\"return false\">";
									reportTfoot += reportPageNo;
								reportTfoot += "</a>";
							reportTfoot += "</li>";
						}
					}
					// 오른쪽 화살표 페이징
					//alert(data.pagingBean.nextPageGroup);
					if(data.pagingBean.nextPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\">";
								reportTfoot += "&raquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					$("#reportTfoot").html(reportTfoot);
					
				}
			})
		};
		
		
	</script>
	<!-- ajax 페이징 게시판 -->
	<table border="1" class="test">
		<thead>
			<tr id="reporThead">
			</tr>
		</thead>
		<tbody id="reportTbody">
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<div>
						<ul id ="reportTfoot">
						</ul>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
    <hr>
    <h5>신고 테스트 구간입니다.</h5>
	<!-- 신고 폼 test -->
	<script type="text/javascript">
		function reportPopup(){
			// 게시판No, 작성자 id 혹은 name을 가져와야함
			var path = "${pageContext.request.contextPath}/reportReviewForm.do?";
			window.open(path, "reportReview","width=465, height=180, top=150, left=200");
		}
	</script>
	<!-- 신고 버튼 -->
	<input type="button" value="신고 한다" onclick="reportPopup()">
    <hr>
    	<table>
    		<tbody>
    			<c:forEach var="rvo" items="${requestScope.reportReviewList.list}" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${rvo.reportNo}</td>
						<td>
							
						</td>
						<td>${rvo.commentsVO.memberVO.id}</td>
						<td>${rvo.reportPostedTime}</td>
						<td><input type="hidden" id="delete${status.count }" name="" value=""></td>
						<td><button onclick="reportPopup()" ></button></td>
					</tr>
				</c:forEach>
    		</tbody>
    	</table>
</body>
</html>