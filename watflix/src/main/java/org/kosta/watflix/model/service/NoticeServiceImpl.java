package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.NoticeMapper;
import org.kosta.watflix.model.vo.NoticeListVO;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.stereotype.Service;
@Service
public class NoticeServiceImpl implements NoticeService {
	

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
