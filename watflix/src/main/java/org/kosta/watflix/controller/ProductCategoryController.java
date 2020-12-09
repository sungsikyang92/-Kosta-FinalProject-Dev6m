package org.kosta.watflix.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.vo.ProductCategoryListVO;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductCategoryController {

	@Resource
	ProductCategoryService productCategoryService;
	
	//카테고리 전체 출력
	@Secured("ROLE_ADMIN")
	@RequestMapping("productCategoryList.do")
	public String productCategoryList(Model model,String pageNo) {
		PagingBean pagingBean = null;
		int totalProductCategory = productCategoryService.sProductCategoryGetTotalCount();
		if(pageNo==null) {
			pagingBean = new PagingBean(totalProductCategory);
		}
		else {
			pagingBean = new PagingBean(totalProductCategory, Integer.parseInt(pageNo));
		}
		//카테고리 리스트 가져오기
		List<ProductCategoryVO> pvolist = productCategoryService.sGetProductCategoryList(pagingBean);
		model.addAttribute("productCategoryListVO",new ProductCategoryListVO(pvolist, pagingBean));
		return "product/productCategoryList";
	}
}
