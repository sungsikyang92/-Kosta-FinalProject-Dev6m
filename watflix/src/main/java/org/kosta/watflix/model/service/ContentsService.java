package org.kosta.watflix.model.service;


import java.util.List;

import org.kosta.watflix.model.vo.ContentsListVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;

public interface ContentsService {

	List<ContentsVO> sGetAllContentsList();
	int sGetTotalContentsCount();
	int sGetTotalContentsCountForType(String contentsType);
	ContentsListVO sGetAllContentsListForType(PagingBean pagingBean);
	ContentsVO sFindContentsByNo(String contentsNo);
	List<ContentsVO> sContentsHighHits();
	List<ContentsVO> sContentsHighAvgStars();
	List<GenreVO> sGetAllGenreList();

}