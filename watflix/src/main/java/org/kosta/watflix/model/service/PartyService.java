package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.PartyVO;

public interface PartyService {
	void write(PartyVO partyVO);
	int getTotalPartyCount();
	PartyVO getPartyDetail(int no); 
	void updateParty(PartyVO partyvo); 
	void deleteParty(int no);
}
