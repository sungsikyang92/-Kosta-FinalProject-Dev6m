package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsLikeMapper;
import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.vo.ContentsLikeVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class ContentsLikeServiceImpl implements ContentsLikeService {
	@Resource
	ContentsMapper contentsMapper;
	@Resource
	ContentsLikeMapper contentsLikeMapper;
	//컨텐츠좋아요 여부
	@Override
	public int sContentsLikeExist(ContentsLikeVO contentsLikeVO) {
		int contentsLikeExist = contentsLikeMapper.mContentsLikeExist(contentsLikeVO);
		if(contentsLikeExist == 0) {
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
	@Override
	public int sGetCLikeExist(String contentsNo, String id) {
		ContentsLikeVO contentsLikeVO = new ContentsLikeVO();
		MemberVO memberVO = new MemberVO();
		ContentsVO contentsVO = new ContentsVO();
		memberVO.setId(id);
		contentsVO.setContentsNo(contentsNo);
		contentsLikeVO.setMemberVO(memberVO);
		contentsLikeVO.setContentsVO(contentsVO);
		return contentsLikeMapper.mContentsLikeExist(contentsLikeVO);
	}
	
	
}
