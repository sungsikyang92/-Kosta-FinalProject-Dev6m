package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.PartyMapper;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartyController {
	@Resource
	private PartyMapper partyMapper;
	@RequestMapping("partyWriteForm.do")
	public String partyWriteForm() {
		return "party/party-Form.tiles";
	}
	
	@PostMapping("partywrite.do")
	public String partywrite(PartyVO partyVO) {
		
		
		return "redirect:home.do";
	}
}
