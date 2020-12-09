package org.kosta.watflix.controller;

import java.util.HashMap;
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
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
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
	
	//파티 리스트 가져오기
	@RequestMapping("partyList.do")
	public String partyList(Model model, String pageNo) {
		MemberVO mvo = new MemberVO();
		//로그인 여부 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			// 로그인 상태 System.out.println("로그인");
			mvo=(MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		}else {
			mvo.setId("guest");//비로그인상태
		}
		PartyListVO partyListVO = new PartyListVO();		
		partyListVO=partyService.sPartyGetAllList(pageNo);		
		int size = partyListVO.getPartyList().size();
		for(int i=0 ; i<size ; i++) {
			PartyVO pvo = partyListVO.getPartyList().get(i);
			int no = pvo.getPartyNo();
			HashMap<String, Object> map = new HashMap<String, Object>(); 
			 map.put("no", no); map.put("id", mvo.getId()); 
			 int result =  partyService.sPartyIsApply(map);
			 if(result == 0) {
				 pvo.setIsApply("N");
			 }else {
				 pvo.setIsApply("Y");
			 }
			 partyListVO.getPartyList().set(i, pvo);
		}
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
	
	//파티게시글 지원하기 버튼 눌렀을때
	@PostMapping("partyApply.do")
	@ResponseBody
	public Object test(String partyNo) {
		MemberVO mvo = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ApplyVO apvo = new ApplyVO();
		PartyVO pvo = new PartyVO();
		pvo.setPartyNo(Integer.parseInt(partyNo)); //지원한 게시글에 대한 정보를 받아와
		apvo.setMemberVO(mvo); // 지원자의 정보를 apply table 에 넣기 위해 set 
		apvo.setPartyVO(pvo); // 게시글 정보를 apply table 에 넣기위해 set
		partyService.sPartyApply(apvo); // apply table 지원 
		pvo = partyService.sPartyGetDetail(Integer.parseInt(partyNo));	// 게시글의 상태변화를 check 하기위해 다시 정보를 받아와 리턴
		
		//지원여부 check
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("no", Integer.parseInt(partyNo));
		map.put("id", mvo.getId());
		int result =partyService.sPartyIsApply(map);
		//System.out.println(mvo.getId());
		//System.out.println(pvo.getPartyNo());
		if(result==0) {
			pvo.setIsApply("N");
		}else {
			pvo.setIsApply("Y");
		}
		return pvo;
	}
	
}
