package org.kosta.watflix.model.mapper;

import java.util.List;
import java.util.Map;

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

	void mProductDelete(int productNo);

	void mProductStockDown(ProductVO productVO);

	int mGetProductStock(int productNo);

	int mProductStatusNormalGetTotalCount();

	List<ProductVO> mGetProductStatusNormalList(PagingBean pagingBean);


}




