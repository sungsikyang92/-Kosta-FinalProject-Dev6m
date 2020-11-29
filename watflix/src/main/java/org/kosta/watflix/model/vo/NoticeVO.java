package org.kosta.watflix.model.vo;

public class NoticeVO {
	private int noticeNo;
	private MemberVO memberVO;
	private String noticeTitle;
	private String noticeContents;
	private String noticePostedTime;
	private int noticeHits;
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(int noticeNo, MemberVO memberVO, String noticeTitle, String noticeContents,
			String noticePostedTime, int noticeHits) {
		super();
		this.noticeNo = noticeNo;
		this.memberVO = memberVO;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticePostedTime = noticePostedTime;
		this.noticeHits = noticeHits;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
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
	public int getNoticeHits() {
		return noticeHits;
	}
	public void setNoticeHits(int noticeHits) {
		this.noticeHits = noticeHits;
	}
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", memberVO=" + memberVO + ", noticeTitle=" + noticeTitle
				+ ", noticeContents=" + noticeContents + ", noticePostedTime=" + noticePostedTime + ", noticeHits="
				+ noticeHits + "]";
	}
	
}
