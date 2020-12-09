
package org.kosta.watflix.model.vo;

public class QnAVO {
	private int qnaNo;
	private MemberVO memberVO;
	private String qnaTitle;
	private String qnaContents;
	private String qnaPostedTime;
	public QnAVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAVO(int qnaNo, MemberVO memberVO, String qnaTitle, String qnaContents, String qnaPostedTime) {
		super();
		this.qnaNo = qnaNo;
		this.memberVO = memberVO;
		this.qnaTitle = qnaTitle;
		this.qnaContents = qnaContents;
		this.qnaPostedTime = qnaPostedTime;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public String getQnaPostedTime() {
		return qnaPostedTime;
	}
	public void setQnaPostedTime(String qnaPostedTime) {
		this.qnaPostedTime = qnaPostedTime;
	}
	@Override
	public String toString() {
		return "QnAVO [qnaNo=" + qnaNo + ", memberVO=" + memberVO + ", qnaTitle=" + qnaTitle + ", qnaContents="
				+ qnaContents + ", qnaPostedTime=" + qnaPostedTime + "]";
	}
}



