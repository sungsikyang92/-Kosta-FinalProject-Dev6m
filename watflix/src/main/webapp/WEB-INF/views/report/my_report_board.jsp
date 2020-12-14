<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(임시)</title>
<!-- 테스트 중인 css 나중에 지울것 -->
  <style type="text/css">
	.table-hover{
		background: white;
		/* table 중앙 정렬 */
		margin:auto;
		width: 45%;
		text-align: center;
	}
	a{
		color: black;
	}
  </style>
</head>
<body>
	<br>
	<br>
	<br>
	<!-- jquery 사용에 필요함 -->
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script type="text/javascript">
		// 웹페이지 로딩 후 바로 실행 됨
		$(document).ready(function() {
			// 테이블에 집어넣을 문자열 데이터 변수
			var reportThead = "";
			var reportTbody = "";
			var reportTfoot = "";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myReportReviewBoard.do",
				success:function(data){	
					//table의 thead
					reportThead += "<th>";
						reportThead +="<a class=\"reportReview active\" href=\"#\" onclick=\"reportReviewPaging(1);return false\">";
							reportThead += "리뷰";
						reportThead += "</a>";
					reportThead += "</th>";
					reportThead += "<th>";
						reportThead +="<a class=\"reportComments\" href=\"#\" onclick=\"reportCommentsPaging(1);return false\">";
							reportThead += "평점";
						reportThead += "</a>";
					reportThead += "</th>";
					$("#reportThead").html(reportThead);
					
					// table의 tbody
					for (var i=0; i < data.list.length; i++){
						reportTbody += "<tr>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.reviewNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportTypeVO.reportTypeInfo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.memberVO.id;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportPostedTime;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += "<a href=\"${pageContext.request.contextPath}/reviewDetailNoHits.do?reviewNo="+ data.list[i].reviewVO.reviewNo +"\">";
									reportTbody += "게시물로 이동"; // 링크 추가 예정
								reportTbody += "</a>"
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
					
					// table의 tfoot( 페이징 )
					var startPageGroup = data.pagingBean.startPageOfPageGroup;
					var endPageGroup = data.pagingBean.endPageOfPageGroup;
					// 페이징 번호
					for (var reportPageNo = startPageGroup; reportPageNo < endPageGroup + 1; reportPageNo++){
						if(data.pagingBean.nowPage != reportPageNo){
							reportTfoot += "<li>";
								reportTfoot += "<a href=\"#\" onclick=\"reportReviewPaging("+ reportPageNo +");return false;\">";
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
					if(data.pagingBean.nextPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\" onclick=\"reportReviewPaging("+ (endPageGroup + 1) +");return false\">";
								reportTfoot += "&raquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					$("#reportTfoot").html(reportTfoot);
					
				}
			})
		})
		
		// 리뷰 페이징
		function reportReviewPaging(reportPageNo){
			alert($(this).val)
			var reportTbody = "";
			var reportTfoot = "";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myReportReviewBoard.do?pageNo="+reportPageNo,
				success:function(data){
					// table의 tbody
					for (var i=0; i < data.list.length; i++){
						reportTbody += "<tr>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.reviewNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportTypeVO.reportTypeInfo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reviewVO.memberVO.id;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportPostedTime;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += "<a href=\"${pageContext.request.contextPath}/reviewDetailNoHits.do?reviewNo="+ data.list[i].reviewVO.reviewNo +"\">";
									reportTbody += "게시물로 이동"; // 링크 추가 예정
								reportTbody += "</a>"
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
					
					// table의 tfoot( 페이징 )
					var startPageGroup = data.pagingBean.startPageOfPageGroup;
					var endPageGroup = data.pagingBean.endPageOfPageGroup;
					// 왼쪽 페이징 화살표
					if (data.pagingBean.previousPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\" onclick=\"reportReviewPaging("+ (startPageGroup -1) +");return false;\">";
								reportTfoot += "&laquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					// 페이징 번호
					for (var reportPageNo = startPageGroup; reportPageNo < endPageGroup + 1; reportPageNo++){
						if(data.pagingBean.nowPage != reportPageNo){
							reportTfoot += "<li>";
								reportTfoot += "<a href=\"#\" onclick=\"reportReviewPaging("+ reportPageNo +");return false;\">";
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
					if(data.pagingBean.nextPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\" onclick=\"reportReviewPaging("+ (endPageGroup + 1) +");return false\">";
								reportTfoot += "&raquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					$("#reportTfoot").html(reportTfoot);
				}
			})
		};
		
		// 평점 페이징
		function reportCommentsPaging(reportPageNo){
			var reportTbody = "";
			var reportTfoot = "";
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath}/myReportCommentsBoard.do?pageNo="+reportPageNo,
				success:function(data){
					// table의 tbody
					for (var i=0; i < data.list.length; i++){
						reportTbody += "<tr>";
							reportTbody += "<th>";
								reportTbody += data.list[i].commentsVO.commentsNo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].reportTypeVO.reportTypeInfo;
							reportTbody += "</th>";
							reportTbody += "<th>";
								reportTbody += data.list[i].commentsVO.memberVO.id;
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
					
					// table의 tfoot( 페이징 )
					var startPageGroup = data.pagingBean.startPageOfPageGroup;
					var endPageGroup = data.pagingBean.endPageOfPageGroup;
					// 왼쪽 페이징 화살표
					if (data.pagingBean.previousPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\" onclick=\"reportCommentsPaging("+ (startPageGroup -1) +");return false;\">";
								reportTfoot += "&laquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					// 페이징 번호
					for (var reportPageNo = startPageGroup; reportPageNo < endPageGroup + 1; reportPageNo++){
						if(data.pagingBean.nowPage != reportPageNo){
							reportTfoot += "<li>";
								reportTfoot += "<a href=\"#\" onclick=\"reportCommentsPaging("+ reportPageNo +");return false;\">";
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
					if(data.pagingBean.nextPageGroup){
						reportTfoot += "<li>";
							reportTfoot += "<a href=\"#\" onclick=\"reportCommentsPaging("+ (endPageGroup + 1) +");return false\">";
								reportTfoot += "&raquo;";
							reportTfoot += "</a>";
						reportTfoot += "</li>";
					}
					$("#reportTfoot").html(reportTfoot);
				}
			})
		};
	</script>
	<!-- ajax 페이징 게시판( My 신고리스트 ) -->
	<table class="table table-hover" id="myReportList" >
		<thead>
			<tr id = "reportThead">
			</tr>
			<tr>
				<th>No</th>
				<th>신고 유형</th>
				<th>게시물 작성자 ID</th>
				<th>신고 날짜</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody id="reportTbody">
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<div class="tableTopMargin">
						<ul id ="reportTfoot" class="pagination">
						</ul>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>