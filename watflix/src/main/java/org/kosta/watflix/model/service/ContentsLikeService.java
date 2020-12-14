package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ContentsLikeVO;

public interface ContentsLikeService {
	//컨텐츠좋아요 여부
	int sContentsLikeExist(ContentsLikeVO contentsLikeVO);
	//컨텐츠좋아요 개수
	int sGetContentsLikeCount();
	//컨텐츠좋아요 유무체크용
	int sGetCLikeExist(String contentsNo, String id);
}
