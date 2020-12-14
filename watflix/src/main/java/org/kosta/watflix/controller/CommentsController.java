package org.kosta.watflix.controller;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommentsController {
	
	@Resource
	CommentsService commentsService;
	@Resource
	ContentsService contentsService;
	
	@Secured("ROLE_ADMIN")
	@RequestMapping("getCommentsList.do")
	public String getCommentsList(String pageNo, Model model) {
		model.addAttribute("commentsList", commentsService.sCommentsGetList(pageNo));
		return "comments/commentsList";
	}	
	
	@RequestMapping("getCommentsListByContentsNo.do")
	public String getCommentsListByContentsNo(String contentsNo, String pageNo, Model model) {
		model.addAttribute("commentsListByContentsNo", commentsService.sCommentsGetListByContentsNo(pageNo, contentsNo));
		model.addAttribute("contentsNo", contentsNo);
		return "c_commentsList_reviewList.tiles";
	}
	
	@RequestMapping("commentsWriteForm.do")
	public String commentsWriteForm(String contentsNo, Model model) {
		model.addAttribute("contentsVO", contentsService.sFindContentsByNo(contentsNo));
		return "comments/commentsWriteForm";
	}
	// 해당 컨텐츠에 user의 아이디로 작성한 comments 유무 확인
	@RequestMapping("checkWorteOrNot.do")
	@ResponseBody
	public int checkWorteOrNot(String contentsNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = memberVO.getId();
		// 유저가 작성한 comments가 존재할 경우 0 이상의 값을 받는다.
		return commentsService.sCheckWorteOrNot(userId, contentsNo);
	}
	
	@PostMapping("commentsWrite.do")
	public String commentsWrite(CommentsVO commentsVO, String contentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		commentsVO.setMemberVO(memberVO);
		ContentsVO contentsVO = new ContentsVO();
		contentsVO.setContentsNo(contentsNo);
		commentsVO.setContentsVO(contentsVO);
		commentsService.sCommentsWrite(commentsVO);
		// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
		float totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(contentsNo);
		// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
		float sumCommentsStars = commentsService.sSumCommentsStars(contentsNo);
		// 평균 별점을 입력한다.
		contentsService.sUpdateAvgStar(sumCommentsStars/totalCommentsCount, contentsNo);
		redirectAttributes.addAttribute("contentsNo", contentsNo);
		redirectAttributes.addAttribute("commentsNo", commentsVO.getCommentsNo());
		return "redirect:contentsDetail.do";
			
	}
	// 삭제버튼으로 삭제
	@PostMapping("commentsDelete.do")
	public String commentsDelete(String[] commentsDelete, String contentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		for(int i = 0; i < commentsDelete.length; i++) {
			commentsService.sCommentsDelete(Integer.parseInt(commentsDelete[i]));
		}
		// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
		float totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(contentsNo);
		// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
		float sumCommentsStars = commentsService.sSumCommentsStars(contentsNo);
		// 평균 별점을 입력한다.
		contentsService.sUpdateAvgStar(sumCommentsStars/totalCommentsCount, contentsNo);
		redirectAttributes.addAttribute("contentsNo", contentsNo);
		redirectAttributes.addAttribute("commentPageNo", pageNo);
		return "redirect:contentsDetail.do";
	}
	// 체크박스로 삭제
	@PostMapping("commentsDeleteByCheckbox.do")
	public String commentsDelete(int[] deleteCheckbox, String[] deleteContentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		for(int i = 0; i < deleteCheckbox.length; i++) {
			commentsService.sCommentsDelete(deleteCheckbox[i]);
			// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
			float totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(deleteContentsNo[i]);
			// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
			float sumCommentsStars = commentsService.sSumCommentsStars(deleteContentsNo[i]);
			// 평균 별점을 입력한다.
			contentsService.sUpdateAvgStar(sumCommentsStars/totalCommentsCount, deleteContentsNo[i]);
		}
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:allPostForAdmin.do";
	}
}
