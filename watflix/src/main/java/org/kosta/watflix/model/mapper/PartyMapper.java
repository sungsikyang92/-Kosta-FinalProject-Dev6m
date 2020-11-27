package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.PartyVO;
@Mapper
public interface PartyMapper {

	void write(PartyVO pvo);


}




