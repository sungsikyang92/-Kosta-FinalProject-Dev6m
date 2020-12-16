package org.kosta.watflix.model.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.ProductOrderVO;

@Mapper
public interface ProductOrderMapper {

	void mProductOrderAdd(ProductOrderVO productOrderVO);

}
