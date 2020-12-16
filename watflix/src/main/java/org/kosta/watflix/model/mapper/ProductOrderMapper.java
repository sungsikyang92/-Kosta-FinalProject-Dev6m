package org.kosta.watflix.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ProductOrderVO;

@Mapper
public interface ProductOrderMapper {

	void mProductOrderAdd(ProductOrderVO productOrderVO);

	List<ProductOrderVO> mProductOrderList(@Param("pagingBean")PagingBean pagingBean, @Param("id")String id);

	int mProductOrderCount(String id);

	ProductOrderVO mProductOrderDetail(@Param("id")String id, @Param("orderNo")int orderNo);
}