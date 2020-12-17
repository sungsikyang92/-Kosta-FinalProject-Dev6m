package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ProductOrderMapper;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.springframework.stereotype.Service;
@Service
public class ProductOrderServiceImpl implements ProductOrderService {
	
	@Resource
	ProductOrderMapper productOrderMapper;
	
	//주문내역 리스트 출력
	@Override
	public List<ProductOrderVO> sProductOrderList(PagingBean pagingBean, String id) {
		return productOrderMapper.mProductOrderList(pagingBean,id);
	}
	
	//주문내역 건수
	@Override
	public int sProductOrderCount(String id) {
		return productOrderMapper.mProductOrderCount(id);
	}
	
	//주문상세내역
	@Override
	public ProductOrderVO sProductOrderDetail(String id, int orderNo) {
		return productOrderMapper.mProductOrderDetail(id,orderNo);
	}

}
