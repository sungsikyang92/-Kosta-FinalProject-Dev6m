package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ProductCategoryMapper;
import org.kosta.watflix.model.mapper.ProductMapper;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.kosta.watflix.model.vo.ProductVO;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {

	@Resource
	ProductMapper productMapper;
	
	@Resource
	ProductCategoryMapper productCategoryMapper;
	
	//상품 등록하기
	@Override
	public void sProductRegister(ProductVO productVO) {
		productMapper.mProductRegister(productVO);
	}

	//상품 상세보기
	@Override
	public ProductVO sProductDetail(int productNo) {
		return productMapper.mProductDetail(productNo);
	}
	
	//상품 총개수 
	@Override
	public int sProductGetTotalCount() {
		return productMapper.mProductGetTotalCount();
	}

	//상품 리스트 출력
	@Override
	public List<ProductVO> sGetProductList(PagingBean pagingBean) {
		return productMapper.mGetProductList(pagingBean);
	}

	//상품 수정하기
	@Override
	public void sProductUpdate(ProductVO productVO) {
		productMapper.mProductUpdate(productVO);
	}

}
