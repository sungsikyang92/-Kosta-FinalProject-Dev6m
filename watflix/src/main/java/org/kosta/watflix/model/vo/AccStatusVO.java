package org.kosta.watflix.model.vo;

public class AccStatusVO {
	private int accStatusNo;
	private String accStatusInfo;
	public AccStatusVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AccStatusVO(int accStatusNo, String accStatusInfo) {
		super();
		this.accStatusNo = accStatusNo;
		this.accStatusInfo = accStatusInfo;
	}
	public int getAccStatusNo() {
		return accStatusNo;
	}
	public void setAccStatusNo(int accStatusNo) {
		this.accStatusNo = accStatusNo;
	}
	public String getAccStatusInfo() {
		return accStatusInfo;
	}
	public void setAccStatusInfo(String accStatusInfo) {
		this.accStatusInfo = accStatusInfo;
	}
	@Override
	public String toString() {
		return "AccStatusVO [accStatusNo=" + accStatusNo + ", accStatusInfo=" + accStatusInfo + "]";
	}
}


