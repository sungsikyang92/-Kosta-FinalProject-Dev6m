package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.NoticeMapper;
import org.kosta.watflix.model.vo.NoticeListVO;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService {
	@Resource
	private NoticeMapper noticeMapper;
	
	@Override
	public NoticeListVO sNoticeGetList() {
		return sNoticeGetList("1");
	}

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

	@Override
	public NoticeVO sNoticeGetDetail(int noticeNo) {
		NoticeVO noticeVO = noticeMapper.mNoticeGetDetail(noticeNo);
		return noticeVO;
	}

	@Override
	public void sNoticeUpdate(NoticeVO noticeVO) {
		noticeMapper.mNoticeUpdate(noticeVO);		
	}

}
