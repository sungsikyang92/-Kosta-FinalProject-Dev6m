package org.kosta.watflix.model.vo;

public class QnAAnswerVO {
	private int qnaAnswerNo;
	private String qnaAnswerContents;
	private String qnaAnswerPostedTime;
	private MemberVO memberVO;
	private QnAVO qnaVO;
	public QnAAnswerVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnAAnswerVO(int qnaAnswerNo, String qnaAnswerContents, String qnaAnswerPostedTime, MemberVO memberVO,
			QnAVO qnaVO) {
		super();
		this.qnaAnswerNo = qnaAnswerNo;
		this.qnaAnswerContents = qnaAnswerContents;
		this.qnaAnswerPostedTime = qnaAnswerPostedTime;
		this.memberVO = memberVO;
		this.qnaVO = qnaVO;
	}
	public int getQnaAnswerNo() {
		return qnaAnswerNo;
	}
	public void setQnaAnswerNo(int qnaAnswerNo) {
		this.qnaAnswerNo = qnaAnswerNo;
	}
	public String getQnaAnswerContents() {
		return qnaAnswerContents;
	}
	public void setQnaAnswerContents(String qnaAnswerContents) {
		this.qnaAnswerContents = qnaAnswerContents;
	}
	public String getQnaAnswerPostedTime() {
		return qnaAnswerPostedTime;
	}
	public void setQnaAnswerPostedTime(String qnaAnswerPostedTime) {
		this.qnaAnswerPostedTime = qnaAnswerPostedTime;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public QnAVO getQnaVO() {
		return qnaVO;
	}
	public void setQnaVO(QnAVO qnaVO) {
		this.qnaVO = qnaVO;
	}
	@Override
	public String toString() {
		return "QnAAnswerVO [qnaAnswerNo=" + qnaAnswerNo + ", qnaAnswerContents=" + qnaAnswerContents
				+ ", qnaAnswerPostedTime=" + qnaAnswerPostedTime + ", memberVO=" + memberVO + ", qnaVO=" + qnaVO + "]";
	}

	
}