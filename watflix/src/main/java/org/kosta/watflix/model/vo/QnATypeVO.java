package org.kosta.watflix.model.vo;

public class QnATypeVO {
	private int qnaTypeNo;
	private String qType;
	public QnATypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnATypeVO(int qnaTypeNo, String qType) {
		super();
		this.qnaTypeNo = qnaTypeNo;
		this.qType = qType;
	}
	public int getQnaTypeNo() {
		return qnaTypeNo;
	}
	public void setQnaTypeNo(int qnaTypeNo) {
		this.qnaTypeNo = qnaTypeNo;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	@Override
	public String toString() {
		return "QnATypeVO [qnaTypeNo=" + qnaTypeNo + ", qType=" + qType + "]";
	}
}
