package org.kosta.watflix.model.service;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.NoticeMapper;
import org.kosta.watflix.model.vo.NoticeVO;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Resource
	NoticeMapper noticeMapper;

	//공지쓰기
	@Override
	public void sNoticeWrite(NoticeVO noticeVO) {
		noticeMapper.mNoticeWrite(noticeVO);
	}

}
