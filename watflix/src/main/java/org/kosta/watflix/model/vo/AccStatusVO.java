package org.kosta.watflix.model.vo;

public class AccStatusVO {
	private int accStatusNo;
	private String accStatusInfo;
	
	public AccStatusVO() {
		super();
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((accStatusInfo == null) ? 0 : accStatusInfo.hashCode());
		result = prime * result + accStatusNo;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AccStatusVO other = (AccStatusVO) obj;
		if (accStatusInfo == null) {
			if (other.accStatusInfo != null)
				return false;
		} else if (!accStatusInfo.equals(other.accStatusInfo))
			return false;
		if (accStatusNo != other.accStatusNo)
			return false;
		return true;
	}
	
}
