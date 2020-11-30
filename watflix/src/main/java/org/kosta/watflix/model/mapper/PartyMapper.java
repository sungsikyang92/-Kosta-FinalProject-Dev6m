package org.kosta.watflix.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.PartyVO;
@Mapper
public interface PartyMapper {

	void write(PartyVO pvo);

	int getTotalPartyCount();

	PartyVO getPartyDetail(int no);

	void updateParty(PartyVO partyvo);

	void deleteParty(int no); 


}




