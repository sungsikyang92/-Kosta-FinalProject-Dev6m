package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.PointHistoryVO;

public interface PointHistoryService {

	int sProductHistoryGetTotalCount(String id);

	List<PointHistoryVO> sMemberPointHistoryCheck(String id, PagingBean pagingBean);
	
}
