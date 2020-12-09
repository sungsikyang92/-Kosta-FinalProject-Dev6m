package org.kosta.watflix.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.watflix.model.vo.ProductVO;

@Mapper
public interface ProductMapper {

	void mProductRegister(ProductVO productVO);

}




