package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.PartyMapper;
import org.kosta.watflix.model.service.PartyService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyListVO;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PartyController {
	@Resource
	private PartyMapper partyMapper;
	@Resource PartyService partyService;
	@RequestMapping("partyWriteForm.do")
	public String partyWriteForm() {
		return "party/party-Form.tiles";
	}
	
	@PostMapping("partywrite.do")
	public String partywrite(PartyVO partyVO) {
		//로그인 세션 적용후 작성자 아이디 적용필요함
		MemberVO mvo = new MemberVO();
		mvo.setId("java");		
		partyVO.setMemberVO(mvo);
		partyService.sPartyWrite(partyVO);
		System.out.println(partyVO);
		return "redirect:partyList.do";
	}
	
	
	@RequestMapping("partyList.do")
	public String partyList(Model model, String pageNo) {
		PartyListVO partyListVO=partyService.sPartyGetAllList(pageNo);
		model.addAttribute("PLVO",partyListVO);
		return "party/party-List.tiles";
	}
	
	@RequestMapping("select1.do")
	@ResponseBody
	public Object test(int no) {
		MembershipVO msvo = partyService.sPartyGetMembershipDetail(no);
		System.out.println(msvo);
		return msvo;
	}
	
	@PostMapping("partyDelete.do")
	public String partyDelete(PartyVO partyVO) {
		System.out.println(partyVO);
		partyService.sPartyGetDetail(partyVO.getPartyNo());
		partyService.sPartyDelete(partyVO.getPartyNo());
		return "redirect:partyList.do";
	}
	
	
	
}
