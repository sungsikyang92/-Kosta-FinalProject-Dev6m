package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ContentsLikeVO;

public interface ContentsLikeService {
	//컨텐츠좋아요 여부
	String sContentsLikeExist(ContentsLikeVO contentsLikeVO);
	//컨텐츠좋아요 개수
	int sGetContentsLikeCount();
}
