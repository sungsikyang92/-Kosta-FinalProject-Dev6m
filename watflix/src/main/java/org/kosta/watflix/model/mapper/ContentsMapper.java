package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.Authority;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.kosta.watflix.model.vo.MemberVO;
@Mapper
public interface ContentsMapper {

	void mGenreRegister(GenreVO gvo);

	void mContentsRegister(ContentsVO cvo);

	GenreVO mFindGenreByCode(String genreCode);
	
	ContentsVO mFindContentsByNo(String contentsNo);

}




