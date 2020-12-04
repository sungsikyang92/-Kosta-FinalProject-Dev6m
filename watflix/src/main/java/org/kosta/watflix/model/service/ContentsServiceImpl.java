package org.kosta.watflix.model.service;


import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.mapper.ReviewMapper;
import org.kosta.watflix.model.vo.ContentsListVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.GenreVO;
import org.springframework.stereotype.Service;

@Service
public class ContentsServiceImpl implements ContentsService {
	
	@Resource
	ContentsMapper contentsMapper;
	@Resource
	ReviewMapper reviewMapper;
	
	//컨텐츠 총 개수
		@Override
		public int sGetTotalContentsCount() {
			return contentsMapper.mGetTotalContentsCount();
		}
	
	//모든 컨텐츠 리스트
	@Override
	public List<ContentsVO> sGetAllContentsList() {
		return contentsMapper.mGetAllContentsList();
	}
	
	//특정 타입의 컨텐츠 총 개수
	@Override
	public int sGetTotalContentsCountForType(String contentsType) {
		return contentsMapper.mGetTotalContentsCountForType(contentsType);
	}
	
	//특정 타입의 컨텐츠 리스트
	@Override
	public ContentsListVO sGetAllContentsListForType(PagingBean pagingBean) {
		return new ContentsListVO(contentsMapper.mGetAllContentsListForType(pagingBean), pagingBean);
	}

	//조회수 높은순
	@Override
	public List<ContentsVO> sContentsHighHits() {
		return contentsMapper.mContentsHighHits();
	}

	//평점 높은순
	@Override
	public List<ContentsVO> sContentsHighAvgStars() {
		return contentsMapper.mContentsHighAvgStars();
	}

	//장르 출력 리스트
	@Override
	public List<GenreVO> sGetAllGenreList() {
		return contentsMapper.mGetAllGenreList();
	}
	//컨텐츠 상세보기
	@Override
	public ContentsVO sFindContentsByNo(String contentsNo) {
		ContentsVO contentsVO = contentsMapper.mFindContentsByNo(contentsNo);
		contentsVO.setContentsReviewCount(reviewMapper.mGetContentsReviewCount(contentsNo));
		return contentsVO;
	}
}
