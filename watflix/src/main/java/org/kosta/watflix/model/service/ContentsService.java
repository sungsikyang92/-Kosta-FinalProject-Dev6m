package org.kosta.watflix.model.service;


import java.util.List;
import java.util.Map;

import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;

public interface ContentsService {

	List<ContentsVO> sGetAllContentsList();
	int sGetTotalContentsCount();
	int sGetTotalContentsCountForType(String contentsType);
	List<ContentsVO> sGetContentsAllForTypeAndGenre(Map<String,String> map);
	List<ContentsVO> sGetContentsAllForType(Map<String,String> map);
	ContentsVO sFindContentsByNo(String contentsNo);
	List<ContentsVO> sContentsHighHits();
	List<ContentsVO> sContentsHighAvgStars();
	List<GenreVO> sGetAllGenreList();
	List<GenreVO> sGetGenreSelectForType(String contentsType);
	List<ContentsVO> sGetContentsSelectForType(String contentsType);
	//컨텐츠추천수증가
	void sContentsLikesUpdate(String contentsNo);
	//컨텐츠추천수감소
	void sContentsLikeRevmoew(String contentsNo);
	//컨텐츠추천여부검사를위한 서비스
	//각 content에 contents_avg_stars 넣기
	void sUpdateAvgStar(double avgStars, String contentsNo);
	//컨텐츠 검색
	List<GenreVO> sGenreSelectForTitle(String contentsTitle);
	List<ContentsVO> sGetContentsSelectForTitle(String contentsTitle);
}