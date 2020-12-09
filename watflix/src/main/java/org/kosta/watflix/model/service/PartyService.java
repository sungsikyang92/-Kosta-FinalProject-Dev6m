package org.kosta.watflix.model.service;

import java.util.HashMap;
import java.util.List;

import org.kosta.watflix.model.vo.ApplyVO;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyListVO;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.security.core.context.SecurityContextHolder;

public interface PartyService {
	void sPartyWrite(PartyVO partyVO);
	int sPartyGetTotalCount();
	PartyVO sPartyGetDetail(int no); 
	void sPartyUpdate(PartyVO partyvo); 
	void sPartyDelete(int partyno);
	void sPartyApply(ApplyVO avo);
	PartyListVO sPartyGetAllList();
	//PartyListVO sPartyGetAllList(String id);
	PartyListVO sPartyGetAllList(String pageNo);
	//PartyListVO sPartyGetAllList(String pageNo, String id);
	PartyListVO sPartyGetAllList(HashMap<String, Object> map);
	MembershipVO sPartyGetMembershipDetail(int partyno);
	List<MembershipVO> sPartyMembershipInfo();
	int sPartyIsApply(HashMap<String, Object> map);
	
}
