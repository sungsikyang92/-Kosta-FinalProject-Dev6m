package org.kosta.watflix.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ProductService;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.kosta.watflix.model.vo.ProductListVO;
import org.kosta.watflix.model.vo.ProductOrderVO;
import org.kosta.watflix.model.vo.ProductVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProductController {
	
	@Resource
	ProductService productService;
	
	private String uploadPath;
	
	//상품등록폼으로 이동
	@RequestMapping("productRegisterForm.do")
	public String productRegisterForm() {
		return "admin/productRegisterForm.tiles";
	}
	
	//상품등록하기(redirect는 결과페이지에서 진행함)
	@PostMapping("productRegister.do")
	public String productRegister(ProductVO productVO,ProductCategoryVO pcvo,Model model, MultipartHttpServletRequest request) {
		//상품사진 처리 Start
		//서버 실행주소
		uploadPath=request.getSession().getServletContext().getRealPath("/resources/product/"+productVO.getProductName()+"/");
		String productPic = saveImg(productVO,uploadPath);
		//상품사진 처리 End
		
		//등록
		productVO.setProductPic(productPic);
		productVO.setProductCategoryVO(pcvo);
		productService.sProductRegister(productVO);
		model.addAttribute("productName",productVO.getProductName());
		return "admin/productRegister_result";
	}
	
	//상품상세보기
	@RequestMapping("productDetail.do")
	public String productDetail(ProductVO productVO, Model model){		
		model.addAttribute("productVO",productService.sProductDetail(productVO.getProductNo()));
		System.out.println("상품정보: "+productService.sProductDetail(productVO.getProductNo()));
		return "admin/productDetail.tiles";
	}
	//상품상세보기(포인트마켓)
	@RequestMapping("productDetailForUser.do")
	public String productDetailForUser(ProductVO productVO, Model model){		
		model.addAttribute("productVO",productService.sProductDetail(productVO.getProductNo()));
		System.out.println("상품정보: "+productService.sProductDetail(productVO.getProductNo()));
		return "product/productDetailForUser.tiles";
	}
	
	//관리자 상품 리스트
	@RequestMapping("productList.do")
	public String productList(Model model,String pageNo) {
		PagingBean pagingBean = null;
		int totalProductCount = productService.sProductGetTotalCount();
		
		if(pageNo==null) {
			pagingBean = new PagingBean(totalProductCount, 12, 4);
		}
		else {
			pagingBean = new PagingBean(totalProductCount, 12,4,Integer.parseInt(pageNo));
		}
		List<ProductVO> pvolist = productService.sGetProductList(pagingBean);
		model.addAttribute("productListVO",new ProductListVO(pvolist, pagingBean));
		return "admin/productList.tiles";
	}
	
	//상품 리스트
	@RequestMapping("productMarket.do")
	public String productMarket(Model model,String pageNo) {
		PagingBean pagingBean = null;
		//정상판매인 상품의 수
		int totalProductCount = productService.sProductStatusNormalGetTotalCount();
		
		if(pageNo==null) {
			pagingBean = new PagingBean(totalProductCount, 12, 4);
		}
		else {
			pagingBean = new PagingBean(totalProductCount, 12,4,Integer.parseInt(pageNo));
		}
		List<ProductVO> pvolist = productService.sGetProductStatusNormalList(pagingBean);
		model.addAttribute("productListVO",new ProductListVO(pvolist, pagingBean));
		return "product/productMarket.tiles";
	}
	
	
	//상품 수정폼으로 이동
	@RequestMapping("productUpdateForm.do")
	public ModelAndView productUpdateForm(Model model,ProductVO productVO) {
		return new ModelAndView("admin/productUpdateForm.tiles","productVO",productService.sProductDetail(productVO.getProductNo()));
	}
	
	//상품 수정하기(redirect는 결과페이지에서 진행함)
	@PostMapping("productUpdate.do")
	public String productUpdate(ProductVO productVO,ProductCategoryVO productCategoryVO, Model model,MultipartHttpServletRequest request) {
		//기존에 이미지 저장된 디렉토리
		String beforeProductPic = productVO.getProductPic();
		if(!productVO.getProductPicFile().isEmpty()) {
			//이미지 저장 Start
			uploadPath=request.getSession().getServletContext().getRealPath("/resources/product/"+productVO.getProductName()+"/");
			//이미지 저장된 디렉토리 반환
			String productPic = saveImg(productVO,uploadPath);
			//이미지 저장 End
			productVO.setProductPic(productPic);
			System.out.println("상품의 새로운 이미지가 저장됨");
		}
		productVO.setProductCategoryVO(productCategoryVO);
		//실제DB에 상품정보 update
		productService.sProductUpdate(productVO);
		
		//기존에 저장한 이미지 사진과 현재 업데이트한 이미지 사진의 이름비교해서 다르면 기존에 저장한 이미지 삭제함
		if(!beforeProductPic.equals(productVO.getProductPic())) {
			uploadPath=request.getSession().getServletContext().getRealPath("");
			//상품 사진이 저장된 서버폴더,로컬폴더 삭제
			deleteImg(productVO,uploadPath);
		}
		model.addAttribute("productName",productVO.getProductName());
		return "admin/productUpdate_result";
	}
	
	//상품삭제하기
	@PostMapping("productDelete.do")
	public String productDelete(RedirectAttributes ra,ProductVO productVO) {
		productService.sProductDelete(productVO.getProductNo());
		ra.addAttribute("productName",productVO.getProductName());
		System.out.println(productService.sProductDetail(productVO.getProductNo()));
		return  "admin/productDelete_result";
	}
	
	//상품 구매하기
	@Secured("ROLE_MEMBER")
	@PostMapping("productBuy.do")
	public String productBuy(RedirectAttributes ra, ProductVO productVO,ProductOrderVO productOrderVO) {
		//세션정보값 확인
		MemberVO memberVO = (MemberVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//사용자가 가지고 있는 포인트랑 구매할려고 하는 금액이랑 비교하기
		int lackPoint = memberVO.getPoint()-productOrderVO.getQuantity()*productVO.getProductPoint();
		if(lackPoint>=0){
			//구매내역테이블에 저장할 데이터 set Start
			productOrderVO.setMemberVO(memberVO);
			productOrderVO.setProductVO(productVO);
			//구매내역테이블에 저장할 데이터 set END
			//멤버 포인트 변경
			memberVO.setPoint(lackPoint);
			System.out.println(lackPoint);
			System.out.println(memberVO.getPoint());
			//재고수량 변경
			productVO.setProductStock(productService.sGetProductStock(productVO.getProductNo()));
			System.out.println("현재 재고수: "+ productVO.getProductStock());
			int count =productVO.getProductStock()-productOrderVO.getQuantity();
			productVO.setProductStock(count);
			productService.sProductBuy(productVO,memberVO,productOrderVO);
			return "product/productBuy_ok";
		}
		else {
			ra.addAttribute("lackPoint",lackPoint);
			return "product/productBuy_fail";
		}
	}
	
	
	//이미지 파일 저장
	public String saveImg(ProductVO productVO,String uploadPath) {
		String productPic="";
		//디렉토리 생성
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
		//Form에서 입력받은 파일을 변수에 넣어줌
		MultipartFile file=productVO.getProductPicFile();
		
		
		if(file!=null&&file.isEmpty()==false){
			File uploadFile=new File(uploadPath+file.getOriginalFilename());
			try {
				file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
				//리로드시 파일삭제되지 않도록 워크스페이스에도 복붙한다 
				String localPath="C:\\kosta203\\FinalProject\\-Kosta-FinalProject-Dev6m\\watflix\\src\\main\\webapp\\resources\\product\\"+productVO.getProductName()+"\\";
				File localPathDir=new File(localPath);
				if(localPathDir.exists()==false)
					localPathDir.mkdirs();
				FileCopyUtils.copy(file.getBytes(), new File(localPath+File.separator+file.getOriginalFilename()));
				productPic = "resources\\product\\"+productVO.getProductName()+"\\"+file.getOriginalFilename();
			} catch (IllegalStateException | IOException e) {				
				e.printStackTrace();
			}
		}
		else {
			//만약 사진을 올리지 않거나 파일이 이상할경우 기본사진을 제공함
			productPic = "resources\\product\\default.jpg";
		}
		return productPic;
	}
	
	//이미지 파일삭제
	public void deleteImg(ProductVO productVO,String uploadPath) {
		//디렉토리 확인
		String localPath="C:\\kosta203\\FinalProject\\-Kosta-FinalProject-Dev6m\\watflix\\src\\main\\webapp\\";
		File serverFile=new File(uploadPath+productVO.getProductPic());
		File localFile=new File(localPath+productVO.getProductPic());
		
		if(serverFile.exists()||localFile.exists()) {
	    		if(serverFile.delete()||localFile.delete()){
	    			System.out.println("서버에서 파일삭제 "+serverFile.exists()+" 로컬에서 파일삭제 "+localFile.exists());
	    		}else{
	    			System.out.println("파일삭제 실패");
	    		}
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
	}
}
