package org.kosta.watflix.controller;

import java.util.Locale;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.CommentsService;
import org.kosta.watflix.model.service.ContentsService;
import org.kosta.watflix.model.vo.CommentsListVO;
import org.kosta.watflix.model.vo.CommentsVO;
import org.kosta.watflix.model.vo.ContentsVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
		// 전체게시물조회 메인화면과 각 게시판에서 페이징과 버튼을 사용하지 않기 위해 사용한다.
		model.addAttribute("forNotUsePagingAndBtn", false);
		return "admin/adminCommentsList.tiles";
	}	
	
	@RequestMapping("getCommentsListByContentsNo.do")
	public String getCommentsListByContentsNo(String contentsNo, String pageNo, Model model) {
		model.addAttribute("commentsListByContentsNo", commentsService.sCommentsGetListByContentsNo(pageNo, contentsNo));
		model.addAttribute("contentsNo", contentsNo);
		return "c_commentsList_reviewList.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("commentsWriteForm.do")
	public String commentsWriteForm(String contentsNo, Model model) {
		model.addAttribute("contentsVO", contentsService.sFindContentsByNo(contentsNo));
		return "comments/commentsWriteForm";
	}
	// 해당 컨텐츠에 user의 아이디로 작성한 comments 유무 확인
	@Secured("ROLE_MEMBER")
	@RequestMapping("checkWorteOrNot.do")
	@ResponseBody
	public int checkWorteOrNot(String contentsNo) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = memberVO.getId();
		// 유저가 작성한 comments가 존재할 경우 0 이상의 값을 받는다.
		return commentsService.sCheckWorteOrNot(userId, contentsNo);
	}
	
	@Secured("ROLE_MEMBER")
	@PostMapping("commentsWrite.do")
	public String commentsWrite(CommentsVO commentsVO, String contentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// 시큐리티세션에 저장되어있는 기존의 포인트를 memberVO에 가져와 리뷰작성포인트(10점)을 더하여 memberVO에 저장한다.
		memberVO.setPoint(memberVO.getPoint()+10);
		// 추가된 점수가 저장되어있는 memberVO를 신규 글 제목과 내용이 저장되어있는 commentsVO에 더한다.
		commentsVO.setMemberVO(memberVO);
		// 매게변수로 전달된 contentNo를 commentsVO에 더한다.
		ContentsVO contentsVO = new ContentsVO();
		contentsVO.setContentsNo(contentsNo);
		commentsVO.setContentsVO(contentsVO);
		// 위의 정보들을 가지고 있는 commentsVO를 service단으로 전달한다.
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
	/* 삭제버튼으로 삭제
	@PostMapping("commentsDelete.do")
	public String commentsDelete(String[] commentsDelete, String contentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		for(int i = 0; i < commentsDelete.length; i++) {
			commentsService.sCommentsDelete(Integer.parseInt(commentsDelete[i]));
		}
		// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
		int totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(contentsNo);
		// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
		float sumCommentsStars = commentsService.sSumCommentsStars(contentsNo);
		// 평균 별점을 계산한다.
		// totalCommentsCount와 sumCommentsStars가 모두 0일경우 NaN이 발생하므로 
		// 둘다 0일 경우에는 avgStars를 0으로 초기화한다.
		float avgStars;
		if(totalCommentsCount == 0 && sumCommentsStars == 0) {
			avgStars = 0;
		} else {
			avgStars = sumCommentsStars/totalCommentsCount;
		}
		// 평균 별점을 입력한다.
		contentsService.sUpdateAvgStar(avgStars, contentsNo);
		redirectAttributes.addAttribute("contentsNo", contentsNo);
		redirectAttributes.addAttribute("commentPageNo", pageNo);
		return "redirect:contentsDetail.do";		
	}
	*/
	// 삭제버튼으로 삭제(ajax방식 / my_comments_board.jsp)
	@PostMapping("commentsDeleteAjax.do")
	@ResponseBody
	public CommentsListVO commentsDeleteAjax(int commentsNo, String contentsNo, String pageNo) {
		commentsService.sCommentsDelete(commentsNo);
		// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
		int totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(contentsNo);
		// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
		float sumCommentsStars = commentsService.sSumCommentsStars(contentsNo);
		// 평균 별점을 계산한다.
		// totalCommentsCount와 sumCommentsStars가 모두 0일경우 NaN이 발생하므로 
		// 둘다 0일 경우에는 avgStars를 0으로 초기화한다.
		float avgStars;
		if(totalCommentsCount == 0 && sumCommentsStars == 0) {
			avgStars = 0;
		} else {
			avgStars = sumCommentsStars/totalCommentsCount;
		}
		// 평균 별점을 입력한다.
		contentsService.sUpdateAvgStar(avgStars, contentsNo);
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id = memberVO.getId();
		return commentsService.sMyCommentsGetList(id, pageNo);		
	}
	
	// 관리자 삭제버튼으로 삭제
	@PostMapping("adminCommentsDelete.do")
	public String adminCommentsDelete(String[] commentsDelete, String contentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		for(int i = 0; i < commentsDelete.length; i++) {
			commentsService.sCommentsDelete(Integer.parseInt(commentsDelete[i]));
		}
		// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
		int totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(contentsNo);
		// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
		float sumCommentsStars = commentsService.sSumCommentsStars(contentsNo);
		// 평균 별점을 계산한다.
		// totalCommentsCount와 sumCommentsStars가 모두 0일경우 NaN이 발생하므로 
		// 둘다 0일 경우에는 avgStars를 0으로 초기화한다.
		float avgStars;
		if(totalCommentsCount == 0 && sumCommentsStars == 0) {
			avgStars = 0;
		} else {
			avgStars = sumCommentsStars/totalCommentsCount;
		}
		// 평균 별점을 입력한다.
		contentsService.sUpdateAvgStar(avgStars, contentsNo);
		//redirectAttributes.addAttribute("contentsNo", contentsNo);
		//redirectAttributes.addAttribute("commentPageNo", pageNo);
		return "report/report_ok";
	}
	
	// 체크박스로 삭제
	@PostMapping("commentsDeleteByCheckboxAdmin.do")
	public String commentsDeleteByCheckboxAdmin(int[] deleteCheckbox, String[] deleteContentsNo, String pageNo, RedirectAttributes redirectAttributes) {
		for(int i = 0; i < deleteCheckbox.length; i++) {
			commentsService.sCommentsDelete(deleteCheckbox[i]);
			// 평균 별점을 입력하기 위해 contents의 총 comments 수를 조회한다.
			float totalCommentsCount = commentsService.sCommentsGetTotalPostCountByContentNo(deleteContentsNo[i]);
			// 평균 별점을 입력하기 위해 contents의 별점 총합을 조회한다.
			float sumCommentsStars = commentsService.sSumCommentsStars(deleteContentsNo[i]);
			float avgStars;
			if(totalCommentsCount == 0 && sumCommentsStars == 0) {
				avgStars = 0;
			} else {
				avgStars = sumCommentsStars/totalCommentsCount;
			}
			// 평균 별점을 입력한다.
			contentsService.sUpdateAvgStar(avgStars, deleteContentsNo[i]);
		}
		redirectAttributes.addAttribute("pageNo", pageNo);
		return "redirect:getCommentsList.do";
	}
	
	// 평점 정보 popup창 띄우기(관리자,회원)
	@RequestMapping("commentsByCommentsNo.do")
	public ModelAndView commentsByCommentsNo(int commentsNo) {
		return new ModelAndView("report/comentsByCommentsNo", "commentsVOContentsNo", commentsService.sGetCommentsByCommentsNo(commentsNo));
	}
	
	// 로그인 체크
	@RequestMapping("userLoginCheck.do")
	@ResponseBody
	public boolean userLoginCheck() {
		return (SecurityContextHolder.getContext().getAuthentication().getPrincipal() == null);
	}
}
