<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	// 웹페이지 로딩 후 바로 실행 됨
	$(document).ready(function() {
		getReportList("1", true);
	});
	function getReportList(reportPageNo, reportType){
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/myReportBoard.do",
			dataType: "json",
			data: 'reportPageNo='+reportPageNo+'&reportType='+reportType,
			success:function(reportData){	
				listByReportType(reportData);	
				reportPostPaging(reportData, reportType);
			}
		});
	}
	function listByReportType(reportListVO){
		var reportTbody = "";
		for (var i=0; i < reportListVO.list.length; i++){
			reportTbody += "<tr>";
				reportTbody += "<th>"+reportListVO.list[i].reportTypeVO.reportTypeInfo+"</th>";
				// comments, review 글을 분리한다.
				if(reportListVO.list[i].reviewVO != null){
					reportTbody += "<th>"+reportListVO.list[i].reviewVO.reviewNo+"</th>";
					reportTbody += "<th>"+reportListVO.list[i].reviewVO.memberVO.id+"</th>";
				} else {
					reportTbody += "<th>"+reportListVO.list[i].commentsVO.commentsNo+"</th>";
					reportTbody += "<th>"+reportListVO.list[i].commentsVO.memberVO.id+"</th>";
				}
				reportTbody += "<th>"+reportListVO.list[i].reportPostedTime+"</th>";
				if(reportListVO.list[i].reviewVO != null){
					reportTbody += "<th><a href=\"${pageContext.request.contextPath}/reviewDetailNoHits.do?reviewNo="+ reportListVO.list[i].reviewVO.reviewNo +"\">게시물로 이동</a></th>";
				} else {
					reportTbody += "<th><a href=\"${pageContext.request.contextPath}/reviewDetailNoHits.do?commentsNo="+ reportListVO.list[i].commentsVO.commentsNo +"\">게시물로 이동</a></th>";
				}
			reportTbody += "</tr>";
			reportTbody += "<tr>";
				reportTbody += "<td colspan=\"5\"><pre>"+reportListVO.list[i].reportContents+"</pre></td>";
			reportTbody += "</tr>";
		}
		$("#reportTbody").html(reportTbody);
	}
	
	function reportPostPaging(reportListVO, reportType) {
		// table의 tfoot( 페이징 )
		var reportPaging = "";
		var startPageGroup = reportListVO.pagingBean.startPageOfPageGroup;
		var endPageGroup = reportListVO.pagingBean.endPageOfPageGroup;
		// 왼쪽 페이징 화살표
		if (reportListVO.pagingBean.previousPageGroup){
			reportPaging += "<li><a href='#' onclick='getReportList("+ (startPageGroup -1) +","+ reportType +"); return false;'>&laquo;</a></li>";
		}
		// 페이징 번호
		for (var reportPageNo = startPageGroup; reportPageNo <= endPageGroup; reportPageNo++){
			if(reportListVO.pagingBean.nowPage != reportPageNo){
				reportPaging += "<li><a href='#' onclick='getReportList("+ reportPageNo +","+ reportType +"); return false;'>"+ reportPageNo + "</a></li>";
			}else{
				reportPaging += "<li><a href='#' onclick='return false'>"+ reportPageNo + "</a></li>";				
			}
		}
		// 오른쪽 화살표 페이징
		if(reportListVO.pagingBean.nextPageGroup){
			reportPaging += "<li><a href='#' onclick='getReportList("+ (endPageGroup + 1) +","+ reportType +"); return false;'>&raquo;</a></li>";
		}
		$("#reportPaging").html(reportPaging);
	}
</script>
<div class="tableMargin" id="commentsList">
	<div class="container-lg boardClassMain" style="margin-top: 100px">
	<h4 style="display: inline-flex;">나의 신고글</h4>
	<a href="#" onclick="getReportList('1', true); return false;">평점</a>
	<a href="#" onclick="getReportList('1', false); return false;">리뷰</a>
	<!-- ajax 페이징 게시판( My 신고리스트 ) -->
	<table class="table table-hover" id="myReportList" >
		<thead>
			<tr>
				<th>신고 유형</th>
				<th>게시물 번호</th>
				<th>게시물 작성자 ID</th>
				<th>신고 날짜</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="reportTbody">
		</tbody>
		</table>
		<div class="boardBottomDiv" style="width: 1000px;">
		<div class="pagingInfo" id="pagingLocation">
			<ul id ="reportPaging" class="pagination"></ul>
		</div>
		</div>		
</div>
</div>
