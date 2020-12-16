package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.PointHistoryMapper;
import org.kosta.watflix.model.vo.PointHistoryVO;
import org.springframework.stereotype.Service;

@Service
public class PointHistoryServiceImpl implements PointHistoryService{
	
	@Resource
	PointHistoryMapper pointHistoryMapper;

	//사용내역 총개수
	@Override
	public int sProductHistoryGetTotalCount(String id) {
		return pointHistoryMapper.mProductHistoryGetTotalCount(id);
	}

	//포인트 사용내역 리스트
	@Override
	public List<PointHistoryVO> sMemberPointHistoryCheck(String id, PagingBean pagingBean) {
		return pointHistoryMapper.mMemberPointHistoryCheck(id,pagingBean);
	}
	
}
