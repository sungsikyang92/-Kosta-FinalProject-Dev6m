package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.ProductCategoryMapper;
import org.kosta.watflix.model.vo.MemberVO;
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

	//카테고리 등록
	@Override
	public void sProductCategoryRegister(ProductCategoryVO productCategoryVO) {
		productCategoryMapper.mProductCategoryRegister(productCategoryVO);
	}

	//카테고리이름이 있는지 확인
	@Override
	public ProductCategoryVO sProductCategoryNameCheck(String productCategoryName) {
		return productCategoryMapper.mProductCategoryNameCheck(productCategoryName);
	}
	

}
