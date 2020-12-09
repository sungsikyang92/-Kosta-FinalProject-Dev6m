package org.kosta.watflix.model.service;

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
	//상품카테고리 등록하기
	@Override
	public void sProductCategoryRegister(ProductCategoryVO productCategoryVO) {
		productCategoryMapper.mProductCategoryRegister(productCategoryVO);
	}

}
