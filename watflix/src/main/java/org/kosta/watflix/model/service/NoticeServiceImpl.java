package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.NoticeMapper;
import org.kosta.watflix.model.vo.NoticeListVO;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Resource
	NoticeMapper noticeMapper;
	
	// 공지글 전체 수 조회
	@Override
	public int sNoticeGetTotalPostCount() {
		return noticeMapper.mNoticeGetTotalPostCount();
	}
	// 현재 페이지 번호가 없을때 공지글 목록 불러오기
	@Override
	public NoticeListVO sNoticeGetList() {
		return sNoticeGetList("1");
	}
	// 현재 페이지 번호가 있을때 공지글 목록 불러오기
	@Override
	public NoticeListVO sNoticeGetList(String pageNo) {
		int totalPostCount = noticeMapper.mNoticeGetTotalPostCount();
		PagingBean pagingBean = null;
		if(pageNo==null) {
			pagingBean = new PagingBean(totalPostCount);
		} else {
			pagingBean = new PagingBean(totalPostCount, Integer.parseInt(pageNo));
		}
		NoticeListVO noticeListVO = new NoticeListVO(noticeMapper.mNoticeGetList(pagingBean), pagingBean);
		return noticeListVO;
	}
	
	// 공지 디테일	
	@Override
	public NoticeVO sNoticeGetDetailNoHits(int noticeNo) {
		NoticeVO noticeVO = noticeMapper.mNoticeGetDetailNoHits(noticeNo);
		return noticeVO;
	}	
	
	// 공지 조회수 증가
	@Override
	public void sNoticeUpdateHits(int noticeNo) {
		noticeMapper.mNoticeUpdateHits(noticeNo);
		
	}
	
	// 공지 수정
	@Override
	public void sNoticeUpdate(NoticeVO noticeVO) {
		noticeMapper.mNoticeUpdate(noticeVO);		
	}
	
	//공지쓰기
	@Override
	public void sNoticeWrite(NoticeVO noticeVO) {
		noticeMapper.mNoticeWrite(noticeVO);
	}
	
	//공지삭제
	@Override
	public void sNoticeDelete(int noticeNo) {
		noticeMapper.mNoticeDelete(noticeNo);
	}
}
