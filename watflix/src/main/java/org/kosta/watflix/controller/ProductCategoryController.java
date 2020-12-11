package org.kosta.watflix.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ProductCategoryService;
import org.kosta.watflix.model.vo.ProductCategoryListVO;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		List<ProductCategoryVO> pcvolist = productCategoryService.sGetProductCategoryList(pagingBean);
		model.addAttribute("productCategoryListVO",new ProductCategoryListVO(pcvolist, pagingBean));
		return "product/productCategoryList";
	}
	
	//카테고리 등록 폼으로 이동
	@RequestMapping("productCategoryRegisterForm.do")
	public String productCategoryRegisterForm(){
		return "product/productCategoryRegisterForm";
	}
	
	//카테고리 등록하기
	@RequestMapping("productCategoryRegister.do")
	public String productCategoryRegister(ProductCategoryVO productCategoryVO,RedirectAttributes ra) {
		productCategoryService.sProductCategoryRegister(productCategoryVO);
		ra.addAttribute("productCategoryName",productCategoryVO.getProductCategoryName());
		return "redirect:productCategoryRegister_result.do";
	}
	//카테고리 등록완료
	@RequestMapping("productCategoryRegister_result.do")
	public String productCategoryRegister_result(ProductCategoryVO productCategoryVO,Model model) {
		model.addAttribute("productCategoryName",productCategoryVO.getProductCategoryName());
		return "product/productCategoryRegister_result";
	}
}
