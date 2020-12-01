package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminNoticeContorller {

	@Resource
	NoticeService noticeService;
	
	@RequestMapping("getNoticeListForAdmin.do")
	public String getNoticeListForAdmin(String pageNo, Model model) {
		if(pageNo == null) {
			model.addAttribute("noticeList", noticeService.sNoticeGetList());			
		} else {
			model.addAttribute("noticeList", noticeService.sNoticeGetList(pageNo));
		}
		return "admin/noticeListAdmin";
	}
}
