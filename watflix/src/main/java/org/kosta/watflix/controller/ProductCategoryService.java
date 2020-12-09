package org.kosta.watflix.controller;

import java.util.List;

import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ProductCategoryVO;

public interface ProductCategoryService {

	int sProductCategoryGetTotalCount();

	List<ProductCategoryVO> sGetProductCategoryList(PagingBean pagingBean);
	
	
}
