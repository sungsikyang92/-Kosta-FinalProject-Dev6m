package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsLikeMapper;
import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.vo.ContentsLikeVO;
import org.springframework.stereotype.Service;

@Service
public class ContentsLikeServiceImpl implements ContentsLikeService {
	@Resource
	ContentsMapper contentsMapper;
	@Resource
	ContentsLikeMapper contentsLikeMapper;
	//컨텐츠좋아요 여부
	@Override
	public String sContentsLikeExist(ContentsLikeVO contentsLikeVO) {
		String contentsLikeExist = contentsLikeMapper.mContentsLikeExist(contentsLikeVO);
		if(contentsLikeExist == "0") {
			contentsLikeMapper.mContentsLikeAdd(contentsLikeVO);
			contentsMapper.mContentsLikeUpdate(contentsLikeVO.getContentsVO().getContentsNo());
		}else {
			contentsLikeMapper.mContentsLikeRemove(contentsLikeVO);
			contentsMapper.mContentsLikeRemove(contentsLikeVO.getContentsVO().getContentsNo());
		}
		return contentsLikeExist;
	}
	//컨텐츠좋아요 개수
	@Override
	public int sGetContentsLikeCount() {
		return contentsLikeMapper.mGetContentsLikeCount();
	}
	
	
}
