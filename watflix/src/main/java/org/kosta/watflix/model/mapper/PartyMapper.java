package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ApplyVO;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyVO;
@Mapper
public interface PartyMapper {

	void mPartyWrite(PartyVO pvo);

	int mPartyGetTotalCount();

	PartyVO mPartyGetDetail(int no);
	//PartyVO mPartyGetDetail(PartyVO partyvo);
	
	void mPartyUpdate(PartyVO partyvo);

	void mPartyDelete(int no);

	void mPartyApply(ApplyVO avo);

	void mPartyApplyCountPlus(int partyNo);

	void mPartyEnd(PartyVO pvo);
	
	List<PartyVO> mPartyGetAllList (PagingBean pagingBean);

	MembershipVO mPartyGetMembershipDetail(int no);
	
	List<MembershipVO> mPartyMembershipInfo();
}




