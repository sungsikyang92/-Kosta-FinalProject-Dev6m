package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.ProductService;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@Resource
	ProductService productService;
	
	@RequestMapping("productRegisterForm.do")
	public String productRegisterForm() {
		return "product/productRegisterForm.tiles";
	}
}
