package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommentsController {
	
	@Resource
	CommentsService commentsService;
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("getCommentsList.do")
	public String getCommentsList(String pageNo, Model model) {
		model.addAttribute("commentsList", commentsService.sCommentsGetList(pageNo));
		return "comments/commentsList.tiles";
	}
	
	@RequestMapping("getCommentsListByContentsNo.do")
	public String getCommentsListByContentsNo(int contentsNo, String pageNo, Model model) {
		model.addAttribute("commentsListByContentsNo", commentsService.sCommentsGetListByContentsNo(pageNo, contentsNo));
		model.addAttribute("contentsNo", contentsNo);
		return "comments/commentsListByContentsNo.tiles";
	}
	
	@RequestMapping("commentsWriteForm.do")
	public String commentsWriteForm(int contentsNo, Model model) {
		model.addAttribute("contentsNo", contentsNo);
		return "comments/commentsWriteForm";
	}
	
	
	@PostMapping("commentsWrite.do")
	public String commentsWrite(CommentsVO commentsVO, String contentsNo, RedirectAttributes redirectAttributes) {
		System.out.println("commentsWrite.do 작동");
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		commentsVO.setMemberVO(memberVO);
		ContentsVO contentsVO = new ContentsVO();
		contentsVO.setContentsNo(contentsNo);
		commentsVO.setContentsVO(contentsVO);
		commentsService.sCommentsWrite(commentsVO);
		redirectAttributes.addAttribute("contentsNo", contentsNo);
		return "redirect:getCommentsListByContentsNo.do";
	}
	
}
