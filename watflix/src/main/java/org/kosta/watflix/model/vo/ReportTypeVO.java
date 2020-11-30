package org.kosta.watflix.model.vo;

public class ReportTypeVO {
	private int reportTypeNo;
	private String reprotTypeInfo;
	public ReportTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportTypeVO(int reportTypeNo, String reprotTypeInfo) {
		super();
		this.reportTypeNo = reportTypeNo;
		this.reprotTypeInfo = reprotTypeInfo;
	}
	public int getReportTypeNo() {
		return reportTypeNo;
	}
	public void setReportTypeNo(int reportTypeNo) {
		this.reportTypeNo = reportTypeNo;
	}
	public String getReprotTypeInfo() {
		return reprotTypeInfo;
	}
	public void setReprotTypeInfo(String reprotTypeInfo) {
		this.reprotTypeInfo = reprotTypeInfo;
	}
	@Override
	public String toString() {
		return "ReportTypeVO [reportTypeNo=" + reportTypeNo + ", reprotTypeInfo=" + reprotTypeInfo + "]";
	}
}
