package org.kosta.watflix.model.vo;

public class ReportTypeVO {
	private int reportTypeNo;
	private String reportTypeInfo;
	public ReportTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportTypeVO(int reportTypeNo, String reportTypeInfo) {
		super();
		this.reportTypeNo = reportTypeNo;
		this.reportTypeInfo = reportTypeInfo;
	}
	public int getReportTypeNo() {
		return reportTypeNo;
	}
	public void setReportTypeNo(int reportTypeNo) {
		this.reportTypeNo = reportTypeNo;
	}
	public String getreportTypeInfo() {
		return reportTypeInfo;
	}
	public void setreportTypeInfo(String reportTypeInfo) {
		this.reportTypeInfo = reportTypeInfo;
	}
	@Override
	public String toString() {
		return "ReportTypeVO [reportTypeNo=" + reportTypeNo + ", reportTypeInfo=" + reportTypeInfo + "]";
	}
}

