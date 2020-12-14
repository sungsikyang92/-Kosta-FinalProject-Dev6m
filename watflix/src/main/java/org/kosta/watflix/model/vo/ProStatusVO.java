package org.kosta.watflix.model.vo;

public class ProStatusVO {
	private int proStatusNo;
	private String proStatusInfo;
	public ProStatusVO() {
		super();
	}
	public ProStatusVO(int proStatusNo, String proStatusInfo) {
		super();
		this.proStatusNo = proStatusNo;
		this.proStatusInfo = proStatusInfo;
	}
	public int getProStatusNo() {
		return proStatusNo;
	}
	public void setProStatusNo(int proStatusNo) {
		this.proStatusNo = proStatusNo;
	}
	public String getProStatusInfo() {
		return proStatusInfo;
	}
	public void setProStatusInfo(String proStatusInfo) {
		this.proStatusInfo = proStatusInfo;
	}
	@Override
	public String toString() {
		return "ProStatusVO [proStatusNo=" + proStatusNo + ", proStatusInfo=" + proStatusInfo + "]";
	}
	
	
}
