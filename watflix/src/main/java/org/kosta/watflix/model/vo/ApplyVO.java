package org.kosta.watflix.model.vo;

public class ApplyVO {
	private MemberVO memberVO;
	private PartyVO partyVO;
	private String applyResult;
	private String applyTime;
	public ApplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplyVO(MemberVO memberVO, PartyVO partyVO, String applyResult, String applyTime) {
		super();
		this.memberVO = memberVO;
		this.partyVO = partyVO;
		this.applyResult = applyResult;
		this.applyTime = applyTime;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public PartyVO getPartyVO() {
		return partyVO;
	}
	public void setPartyVO(PartyVO partyVO) {
		this.partyVO = partyVO;
	}
	public String getApplyResult() {
		return applyResult;
	}
	public void setApplyResult(String applyResult) {
		this.applyResult = applyResult;
	}
	public String getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}
	@Override
	public String toString() {
		return "ApplyVO [memberVO=" + memberVO + ", partyVO=" + partyVO + ", applyResult=" + applyResult
				+ ", applyTime=" + applyTime + "]";
	}
	
	
}
