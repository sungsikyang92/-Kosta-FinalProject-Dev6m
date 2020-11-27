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

}
