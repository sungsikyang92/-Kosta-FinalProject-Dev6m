package org.kosta.watflix.model.service;

import java.util.List;

import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.kosta.watflix.model.vo.ProductVO;

public interface ProductService {
	
	void sProductRegister(ProductVO productVO);

	ProductVO sProductDetail(int productNo);

	int sProductGetTotalCount();

	List<ProductVO> sGetProductList(PagingBean pagingBean);

	void sProductUpdate(ProductVO productVO);

	void sProductDelete(int productNo);

	void sProductBuy(ProductVO productVO, MemberVO memberVO,ProductOrderVO productOrderVO);

	int sGetProductStock(int productNo);
	
}
