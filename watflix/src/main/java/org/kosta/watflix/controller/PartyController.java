package org.kosta.watflix.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.PartyMapper;
import org.kosta.watflix.model.service.PartyService;
import org.kosta.watflix.model.vo.ApplyVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyListVO;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
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
	
	//파티회원 모집 글쓰기폼으로 이동
	@Secured("ROLE_MEMBER")
	@RequestMapping("partyWriteForm.do")
	public String partyWriteForm() {
		return "party/party-Form.tiles";
	}
	
	//파티 회원 모집 글쓰기
	@Secured("ROLE_MEMBER")
	@PostMapping("partywrite.do")
	public String partywrite(PartyVO partyVO) {
		//로그인 세션 멤버 정보
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		partyVO.setMemberVO(mvo);
		
		/*
		 * MemberVO mvo = new MemberVO(); mvo.setId("java"); partyVO.setMemberVO(mvo);
		 */
		partyService.sPartyWrite(partyVO);
		return "redirect:partyList.do";
	}
	
	//파티 리스트 
	@RequestMapping("partyList.do")
	public String partyList(Model model, String pageNo) {
		PartyListVO partyListVO = new PartyListVO();
		partyListVO=partyService.sPartyGetAllList(pageNo);
		
		model.addAttribute("PLVO",partyListVO);
		return "party/party-List.tiles";
	}
	
	//글쓰기 폼에서 select box 선택시  두번째 select box 에 데이터 값 넘겨주는 기능
	@RequestMapping("select1.do")
	@ResponseBody
	public Object select1(int no) {
		MembershipVO msvo = partyService.sPartyGetMembershipDetail(no);
		return msvo;
	}
	
	//파티게시글 삭제
	@Secured("ROLE_MEMBER")
	@PostMapping("partyDelete.do")
	public String partyDelete(PartyVO partyVO) {
		System.out.println(partyVO);
		partyService.sPartyGetDetail(partyVO.getPartyNo());
		partyService.sPartyDelete(partyVO.getPartyNo());
		return "redirect:partyList.do";
	}
	
	//파티 게시글 업데이트 폼으로 가기
	@Secured("ROLE_MEMBER")
	@RequestMapping("goPartyUpdate.do")
	public String goPartyUpdate(Model model,PartyVO partyVO) {
		PartyVO pvo=partyService.sPartyGetDetail(partyVO.getPartyNo());
		model.addAttribute("pvo",pvo);
		List<MembershipVO> lmsvo = partyService.sPartyMembershipInfo();
		model.addAttribute("lmsvo",lmsvo);
		return "party/party-Update.tiles";
	}
	
	//파티 게시글 업데이트
	@Secured("ROLE_MEMBER")
	@PostMapping("partyUpdate.do")
	public String partyUpdate(PartyVO partyVO) {
		partyService.sPartyUpdate(partyVO);
		return "redirect:partyList.do";
	}
	
	@PostMapping("partyApply.do")
	@ResponseBody
	public Object test(String partyNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ApplyVO apvo = new ApplyVO();
		PartyVO pvo = new PartyVO();
		pvo.setPartyNo(Integer.parseInt(partyNo));
		apvo.setMemberVO(mvo);
		apvo.setPartyVO(pvo);
		partyService.sPartyApply(apvo);
		pvo = partyService.sPartyGetDetail(Integer.parseInt(partyNo));
		return pvo;
	}
	
}
