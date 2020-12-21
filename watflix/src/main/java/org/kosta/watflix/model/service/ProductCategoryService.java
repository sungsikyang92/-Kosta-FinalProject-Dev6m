package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.ProductCategoryVO;

public interface ProductCategoryService {

	int sProductCategoryGetTotalCount();

	List<ProductCategoryVO> sGetProductCategoryList(PagingBean pagingBean);

	void sProductCategoryRegister(ProductCategoryVO productCategoryVO);

	ProductCategoryVO sProductCategoryNameCheck(String productCategoryName);
	
	
}
