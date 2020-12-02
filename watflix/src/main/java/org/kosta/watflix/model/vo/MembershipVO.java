package org.kosta.watflix.model.vo;

public class MembershipVO {
	private String membershipName;
	private int membershipNo;
	private int concurrentUsers;
	
	public MembershipVO(String membershipName, int membershipNo, int concurrentUsers) {
		super();
		this.membershipName = membershipName;
		this.membershipNo = membershipNo;
		this.concurrentUsers = concurrentUsers;
	}
	public MembershipVO() {
		super();
	}
	public String getMembershipName() {
		return membershipName;
	}
	public void setMembershipName(String membershipName) {
		this.membershipName = membershipName;
	}
	public int getMembershipNo() {
		return membershipNo;
	}
	public void setMembershipNo(int membershipNo) {
		this.membershipNo = membershipNo;
	}
	public int getConcurrentUsers() {
		return concurrentUsers;
	}
	public void setConcurrentUsers(int concurrentUsers) {
		this.concurrentUsers = concurrentUsers;
	}
	@Override
	public String toString() {
		return "MembershipVO [membershipName=" + membershipName + ", membershipNo=" + membershipNo
				+ ", concurrentUsers=" + concurrentUsers + "]";
	}
	
	
	
	
}
