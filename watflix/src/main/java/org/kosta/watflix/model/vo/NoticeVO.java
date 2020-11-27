package org.kosta.watflix.model.vo;

public class NoticeVO {
	private String noticeNo;
	private MemberVO memberVO;
	private String noticeTitle;
	private String noticeContents;
	private String noticePostedTime;
	private String noticeHits;
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(MemberVO memberVO, String noticeTitle, String noticeContents) {
		super();
		this.memberVO = memberVO;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setId(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticePostedTime() {
		return noticePostedTime;
	}
	public void setNoticePostedTime(String noticePostedTime) {
		this.noticePostedTime = noticePostedTime;
	}
	public String getNoticeHits() {
		return noticeHits;
	}
	public void setNoticeHits(String noticeHits) {
		this.noticeHits = noticeHits;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", memberVO=" + memberVO + ", noticeTitle=" + noticeTitle + ", noticeContents="
				+ noticeContents + ", noticePostedTime=" + noticePostedTime + ", noticeHits=" + noticeHits + "]";
	}
}
