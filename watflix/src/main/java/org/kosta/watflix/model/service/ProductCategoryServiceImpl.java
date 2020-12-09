package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.controller.ProductCategoryService;
import org.kosta.watflix.model.mapper.ProductCategoryMapper;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.springframework.stereotype.Service;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Resource
	ProductCategoryMapper productCategoryMapper;
	
	//카테고리 총 개수 출력
	@Override
	public int sProductCategoryGetTotalCount() {
		return productCategoryMapper.mProductCategoryGetTotalCount();
	}

	//카테고리 페이징처리
	@Override
	public List<ProductCategoryVO> sGetProductCategoryList(PagingBean pagingBean) {
		return productCategoryMapper.mGetProductCategoryList(pagingBean);
	}

}
