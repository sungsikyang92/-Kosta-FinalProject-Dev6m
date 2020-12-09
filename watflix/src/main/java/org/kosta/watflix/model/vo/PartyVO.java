package org.kosta.watflix.model.vo;

public class PartyVO {
	private String partyTitle;
	private String partyPostedTime;
	private String partyStatus;
	private int partyNo;
	private int partyHeadCount;
	private int partyApplyCount;
	MemberVO memberVO;
	MembershipVO membershipVO;
	String isApply;
	public PartyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PartyVO(String partyTitle, String partyPostedTime, String partyStatus, int partyNo, int partyHeadCount,
			int partyApplyCount, MemberVO memberVO, MembershipVO membershipVO, String isApply) {
		super();
		this.partyTitle = partyTitle;
		this.partyPostedTime = partyPostedTime;
		this.partyStatus = partyStatus;
		this.partyNo = partyNo;
		this.partyHeadCount = partyHeadCount;
		this.partyApplyCount = partyApplyCount;
		this.memberVO = memberVO;
		this.membershipVO = membershipVO;
		this.isApply = isApply;
	}
	public String getPartyTitle() {
		return partyTitle;
	}
	public void setPartyTitle(String partyTitle) {
		this.partyTitle = partyTitle;
	}
	public String getPartyPostedTime() {
		return partyPostedTime;
	}
	public void setPartyPostedTime(String partyPostedTime) {
		this.partyPostedTime = partyPostedTime;
	}
	public String getPartyStatus() {
		return partyStatus;
	}
	public void setPartyStatus(String partyStatus) {
		this.partyStatus = partyStatus;
	}
	public int getPartyNo() {
		return partyNo;
	}
	public void setPartyNo(int partyNo) {
		this.partyNo = partyNo;
	}
	public int getPartyHeadCount() {
		return partyHeadCount;
	}
	public void setPartyHeadCount(int partyHeadCount) {
		this.partyHeadCount = partyHeadCount;
	}
	public int getPartyApplyCount() {
		return partyApplyCount;
	}
	public void setPartyApplyCount(int partyApplyCount) {
		this.partyApplyCount = partyApplyCount;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public MembershipVO getMembershipVO() {
		return membershipVO;
	}
	public void setMembershipVO(MembershipVO membershipVO) {
		this.membershipVO = membershipVO;
	}
	public String getIsApply() {
		return isApply;
	}
	public void setIsApply(String isApply) {
		this.isApply = isApply;
	}
	@Override
	public String toString() {
		return "PartyVO [partyTitle=" + partyTitle + ", partyPostedTime=" + partyPostedTime + ", partyStatus="
				+ partyStatus + ", partyNo=" + partyNo + ", partyHeadCount=" + partyHeadCount + ", partyApplyCount="
				+ partyApplyCount + ", memberVO=" + memberVO + ", membershipVO=" + membershipVO + ", isApply=" + isApply
				+ "]";
	}
	
	
	
	
}
