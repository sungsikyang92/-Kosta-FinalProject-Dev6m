package org.kosta.watflix.model.vo;

public class FaqVO {
	private int faqNo;
	private MemberVO memberVO;
	private String faqTitle;
	private String faqContents;
	private String faqPostedTime;
	private int faqHits;
	public FaqVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaqVO(int faqNo, MemberVO memberVO, String faqTitle, String faqContents, String faqPostedTime,
			int faqHits) {
		super();
		this.faqNo = faqNo;
		this.memberVO = memberVO;
		this.faqTitle = faqTitle;
		this.faqContents = faqContents;
		this.faqPostedTime = faqPostedTime;
		this.faqHits = faqHits;
	}
	
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContents() {
		return faqContents;
	}
	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}
	public String getFaqPostedTime() {
		return faqPostedTime;
	}
	public void setFaqPostedTime(String faqPostedTime) {
		this.faqPostedTime = faqPostedTime;
	}
	public int getFaqHits() {
		return faqHits;
	}
	public void setFaqHits(int faqHits) {
		this.faqHits = faqHits;
	}
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", memberVO=" + memberVO + ", faqTitle=" + faqTitle + ", faqContents="
				+ faqContents + ", faqPostedTime=" + faqPostedTime + ", faqHits=" + faqHits + "]";
	}
	
}