package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.ApplyVO;
import org.kosta.watflix.model.vo.PartyListVO;
import org.kosta.watflix.model.vo.PartyVO;

public interface PartyService {
	void sPartyWrite(PartyVO partyVO);
	int sPartyGetTotalCount();
	PartyVO sPartyGetDetail(int no); 
	void sPartyUpdate(PartyVO partyvo); 
	void sPartyDelete(int no);
	void sPartyApply(ApplyVO avo);
	PartyListVO sPartyGetAllList();
	PartyListVO sPartyGetAllList(String pageNo);
	
	
}
