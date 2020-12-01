package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.FaqService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	@Resource
	FaqService faqService;
	
	// @RequestMapping
}
