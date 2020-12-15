package org.kosta.watflix.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ContentsMapper;
import org.kosta.watflix.model.mapper.ReviewMapper;
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
	
	//장르&타입의 컨텐츠 리스트
	@Override
	public List<ContentsVO> sGetContentsAllForTypeAndGenre(Map<String,String> map) {
		return contentsMapper.mGetContentsAllForTypeAndGenre(map);
	}
	//특정 타입의 컨텐츠 리스트
	@Override
	public List<ContentsVO> sGetContentsAllForType(Map<String,String> map) {
		return contentsMapper.mGetContentsAllForType(map);
	}

	//조회수 높은순
	@Override
	public List<ContentsVO> sContentsHighHits() {
		return contentsMapper.mContentsHighHits();
	}
	
	//조회수 높은순 with Login
	@Override
	public List<ContentsVO> sContentsHighHitsLogin(String id) {
//		HashMap<String, Object>map = new HashMap<String, Object>();
//		map.put("id", id);
//		map.put("contentsNo", contentsNo);
//		return contentsMapper.mContentsHighHitsLogin(map);
		return contentsMapper.mContentsHighHitsLogin(id);
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
	
	//컨텐츠 타입별 select문
	@Override
	public List<ContentsVO> sGetContentsSelectForType(String contentsType) {
		return contentsMapper.mGetContentsSelectForType(contentsType);
	}
	
	// 컨텐츠 타입별 장르
	@Override
	public List<GenreVO> sGetGenreSelectForType(String contentsType) {
		return contentsMapper.mGetGenreSelectForType(contentsType);
	}

	//컨텐츠추천수증가
	@Override
	public void sContentsLikesUpdate(String contentsNo) {
		contentsMapper.mContentsLikeUpdate(contentsNo);
	}

	//컨텐츠추천수감소
	@Override
	public void sContentsLikeRevmoew(String contentsNo) {
		contentsMapper.mContentsLikeRemove(contentsNo);
	}
	
	//각 content에 contents_avg_stars 넣기
	@Override
	public void sUpdateAvgStar(double avgStars, String contentsNo) {
		contentsMapper.mUpdateAvgStars(avgStars, contentsNo);
	}

	//검색된 컨텐츠 장르 출력
	@Override
	public List<GenreVO> sGenreSelectForTitle(String contentsTitle) {
		return contentsMapper.mGenreSelectForTitle(contentsTitle);
	}

	//컨텐츠 검색
	@Override
	public List<ContentsVO> sGetContentsSelectForTitle(String contentsTitle) {
		return contentsMapper.mGetContentsSelectForTitle(contentsTitle);
	}
	
}
