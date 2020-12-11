package org.kosta.watflix.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.service.PagingBean;
import org.kosta.watflix.model.service.ProductService;
import org.kosta.watflix.model.vo.ProductCategoryVO;
import org.kosta.watflix.model.vo.ProductListVO;
import org.kosta.watflix.model.vo.ProductVO;
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
		return "product/productRegisterForm.tiles";
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
		return "product/productRegister_result";
	}
	
	//상품상세보기
	@RequestMapping("productDetail.do")
	public String productDetail(ProductVO productVO, Model model){		
		System.out.println(productVO.getProductNo());
		model.addAttribute("productVO",productService.sProductDetail(productVO.getProductNo()));
		System.out.println(productService.sProductDetail(productVO.getProductNo()));
		return "product/productDetail.tiles";
	}
	
	//상품 리스트
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
		return "product/productList.tiles";
	}
	
	//상품 수정폼으로 이동
	@RequestMapping("productUpdateForm.do")
	public ModelAndView productUpdateForm(Model model,ProductVO productVO) {
		return new ModelAndView("product/productUpdateForm.tiles","productVO",productService.sProductDetail(productVO.getProductNo()));
	}
	
	//상품 수정하기(redirect는 결과페이지에서 진행함)
	@PostMapping("productUpdate.do")
	public String productUpdate(ProductVO productVO,ProductCategoryVO productCategoryVO, Model model,ProductCategoryVO pcvo, MultipartHttpServletRequest request) {
		//사진파일이 기존에 없는경우만 사진 저장하기
		System.out.println("여기임"+productVO);
		if(productVO.getProductPic()==null) {
			uploadPath=request.getSession().getServletContext().getRealPath("");
			deleteImg(productVO,uploadPath);
			uploadPath=request.getSession().getServletContext().getRealPath("/resources/product/"+productVO.getProductName()+"/");
			String productPic = saveImg(productVO,uploadPath);
			productVO.setProductPic(productPic);
		}
		productVO.setProductCategoryVO(productCategoryVO);
		System.out.println("여기임"+productVO);
		productService.sProductUpdate(productVO);
		model.addAttribute("productName",productVO.getProductName());
		return "product/productUpdate_result";
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
	    			System.out.println("파일삭제 성공");
	    		}else{
	    			System.out.println("파일삭제 실패");
	    		}
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
	}
}
