package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ProductVO;

@Mapper
public interface ProductMapper {

	void mProductRegister(ProductVO productVO);

	ProductVO mProductDetail(int productNo);

	int mProductGetTotalCount();

	List<ProductVO> mGetProductList(PagingBean pagingBean);

	void mProductUpdate(ProductVO productVO);


}




