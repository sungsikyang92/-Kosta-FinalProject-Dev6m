package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.PartyMapper;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.stereotype.Service;
@Service
public class PartyServiceImpl implements PartyService{
	@Resource 
	private PartyMapper partyMapper;
	@Override
	public void write(PartyVO partyVO) {
		partyMapper.write(partyVO);
	}
	@Override
	public int getTotalPartyCount() {
		return partyMapper.getTotalPartyCount(); 
	}
	@Override
	public PartyVO getPartyDetail(int no) {
		PartyVO pvo = new PartyVO();
		pvo=partyMapper.getPartyDetail(no);
		return pvo;
	}
	@Override
	public void updateParty(PartyVO partyvo) {
		partyMapper.updateParty(partyvo);
	}
	@Override
	public void deleteParty(int no) {
		partyMapper.deleteParty(no);
	}

}
