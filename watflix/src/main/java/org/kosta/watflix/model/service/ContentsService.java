package org.kosta.watflix.model.service;


import org.kosta.watflix.model.vo.ContentsListVO;

public interface ContentsService {

	ContentsListVO sGetAllContentsList(PagingBean pagingBean);
	int sGetTotalContentsCount();
	int sGetTotalContentsCountForType(String contentsType);
	ContentsListVO sGetAllContentsListForType(PagingBean pagingBean);

}