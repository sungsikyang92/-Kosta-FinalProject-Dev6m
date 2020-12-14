package org.kosta.watflix.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.MemberMapper;
import org.kosta.watflix.model.mapper.ProductCategoryMapper;
import org.kosta.watflix.model.mapper.ProductMapper;
import org.kosta.watflix.model.mapper.ProductOrderMapper;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.kosta.watflix.model.vo.ProductVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService {

	@Resource
	ProductMapper productMapper;
	
	@Resource
	MemberMapper memberMapper;
	
	@Resource
	ProductOrderMapper productOrderMapper;
	
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

	//상품 삭제하기
	@Override
	public void sProductDelete(int productNo) {
		productMapper.mProductDelete(productNo);
	}

	//상품구매하기
	@Transactional
	@Override
	public void sProductBuy(ProductVO productVO, MemberVO memberVO,ProductOrderVO productOrderVO) {
		System.out.println("주문내역추가전"+productOrderVO);
		productOrderMapper.mProductOrderAdd(productOrderVO);
		System.out.println("주문내역추가완료"+productOrderVO);
		memberMapper.mMemberPointUpdate(memberVO);
		System.out.println("회원포인트갱신완료"+memberVO);
		productMapper.mProductStockDown(productVO);
		System.out.println("상품재고갱신완료"+productVO);
	}

	//상품재고수 조회
	@Override
	public int sGetProductStock(int productNo) {
		return productMapper.mGetProductStock(productNo);
	}

}
