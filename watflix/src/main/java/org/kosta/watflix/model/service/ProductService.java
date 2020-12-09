package org.kosta.watflix.model.service;

import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.kosta.watflix.model.vo.ProductVO;

public interface ProductService {
	
	void sProductRegister(ProductVO productVO);
	void sProductCategoryRegister(ProductCategoryVO productCategoryVO);
	
}
