package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.NoticeListVO;
import org.kosta.watflix.model.vo.NoticeVO;

public interface NoticeService {
	
	int sNoticeGetTotalPostCount();

	NoticeListVO sNoticeGetList();
	
	NoticeListVO sNoticeGetList(String pageNo);

	NoticeVO sNoticeGetDetailNoHits(int noticeNo);
	
	void sNoticeUpdateHits(int noticeNo);
	
	void sNoticeUpdate(NoticeVO noticeVO);
	
	void sNoticeWrite(NoticeVO noticeVO);

	void sNoticeDelete(int noticeNo);

}
