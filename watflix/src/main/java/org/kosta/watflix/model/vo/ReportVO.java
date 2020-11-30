package org.kosta.watflix.model.vo;

public class ReportVO {
	private int reportNo;
	private MemberVO memberVO;
	private ReviewVO reviewVO;
	private CommentsVO commentsVO;
	private ReportTypeVO reportTypeVO;
	private String reportContents;
	private String reprotPostedTime;
	public ReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportVO(int reportNo, MemberVO memberVO, ReviewVO reviewVO, CommentsVO commentsVO,
			ReportTypeVO reportTypeVO, String reportContents, String reprotPostedTime) {
		super();
		this.reportNo = reportNo;
		this.memberVO = memberVO;
		this.reviewVO = reviewVO;
		this.commentsVO = commentsVO;
		this.reportTypeVO = reportTypeVO;
		this.reportContents = reportContents;
		this.reprotPostedTime = reprotPostedTime;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public ReviewVO getReviewVO() {
		return reviewVO;
	}
	public void setReviewVO(ReviewVO reviewVO) {
		this.reviewVO = reviewVO;
	}
	public CommentsVO getCommentsVO() {
		return commentsVO;
	}
	public void setCommentsVO(CommentsVO commentsVO) {
		this.commentsVO = commentsVO;
	}
	public ReportTypeVO getReportTypeVO() {
		return reportTypeVO;
	}
	public void setReportTypeVO(ReportTypeVO reportTypeVO) {
		this.reportTypeVO = reportTypeVO;
	}
	public String getReportContents() {
		return reportContents;
	}
	public void setReportContents(String reportContents) {
		this.reportContents = reportContents;
	}
	public String getReprotPostedTime() {
		return reprotPostedTime;
	}
	public void setReprotPostedTime(String reprotPostedTime) {
		this.reprotPostedTime = reprotPostedTime;
	}
	@Override
	public String toString() {
		return "ReportVO [reportNo=" + reportNo + ", memberVO=" + memberVO + ", reviewVO=" + reviewVO + ", commentsVO="
				+ commentsVO + ", reportTypeVO=" + reportTypeVO + ", reportContents=" + reportContents
				+ ", reprotPostedTime=" + reprotPostedTime + "]";
	}
}
