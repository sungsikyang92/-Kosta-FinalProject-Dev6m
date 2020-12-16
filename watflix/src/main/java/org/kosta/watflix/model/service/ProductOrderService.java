package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.ProductOrderVO;

public interface ProductOrderService {
	int sProductOrderCount(String id);
	List<ProductOrderVO> sProductOrderList(PagingBean pagingBean,String id);
	ProductOrderVO sProductOrderDetail(String id, int orderNo);
}
