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
	//각 content에 contents_avg_stars 넣기
	void sUpdateAvgStar(float avgStars, String contentsNo);
}