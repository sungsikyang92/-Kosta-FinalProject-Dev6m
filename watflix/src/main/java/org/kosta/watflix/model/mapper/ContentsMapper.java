package org.kosta.watflix.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
@Mapper
public interface ContentsMapper {

	void mGenreRegister(GenreVO gvo);
	void mContentsRegister(ContentsVO cvo);
	GenreVO mFindGenreByCode(String genreCode);
	ContentsVO mFindContentsByNo(String contentsNo);
	int mGetTotalContentsCount();
	int mGetTotalContentsCountForType(String contentsType);
	List<ContentsVO> mGetAllContentsList();
	List<ContentsVO> mGetContentsAllForTypeAndGenre(Map<String,String> map);
	List<ContentsVO> mGetContentsAllForType(Map<String,String> map);
	List<ContentsVO> mContentsHighHits();
	List<ContentsVO> mContentsHighAvgStars();
	List<GenreVO> mGetAllGenreList();
	List<GenreVO> mGetGenreSelectForType(String contentsType);
	List<ContentsVO> mGetContentsSelectForType(String contentsType);
	//각 content에 contents_avg_stars 넣기
	void mUpdateAvgStars(@Param("avgStars")float avgStars, @Param("contentsNo")String contentsNo);
	
}




