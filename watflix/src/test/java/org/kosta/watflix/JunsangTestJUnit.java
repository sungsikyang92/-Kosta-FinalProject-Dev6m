package org.kosta.watflix;

import java.util.HashMap;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.watflix.model.mapper.PartyMapper;
import org.kosta.watflix.model.service.MemberService;
import org.kosta.watflix.model.service.PartyService;
import org.kosta.watflix.model.vo.ApplyVO;
import org.kosta.watflix.model.vo.MemberVO;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 *    TDD : 테스트 주도 개발(test-driven development, TDD)은 
 *            매우 짧은 개발 사이클을 반복하는 소프트웨어 개발 프로세스
 *            
 *    JUnit: 자바 단위 테스트를 위한 TDD 프레임워크
 *    
 *    아래 라이브러리가 maven의 pom.xml에 추가되어야 한다. 
       <!-- spring junit  -->
  <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>${org.springframework-version}</version>            
        </dependency>
        <!-- Test : 기존 4.7에서 4.9로 수정 -->
  <dependency>
   <groupId>junit</groupId>
   <artifactId>junit</artifactId>
   <version>4.9</version>
   <scope>test</scope>
  </dependency>  
 */  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml","file:src/main/webapp/WEB-INF/spring-security.xml"})
public class JunsangTestJUnit {
	//CRUD
	
	@Resource
	private PartyMapper partyMapper;
	@Resource
	private PartyService partyService;
	@Resource
	MemberService memberService;
	//파티 게시글 작성하기
	/*
	 * @Test public void partyWrite(){ MemberVO mvo = new MemberVO();
	 * mvo.setId("java"); mvo.setPassword("1234"); mvo.setName("강상훈");
	 * mvo.setEmail("abc@naver.com"); // 멤버 아이디 받아오기위해 멤버 vo 생성 MembershipVO msvo =
	 * new MembershipVO(); msvo.setConcurrentUsers(1);
	 * //msvo.setMembershipName("premium"); msvo.setMembershipNo(3); //멤버십 설정을 위해
	 * 멤버십 VO 생성
	 * 
	 * PartyVO partyVO = new PartyVO(); partyVO.setMemberVO(mvo);
	 * partyVO.setPartyTitle("제목"); partyVO.setMembershipVO(msvo);
	 * partyVO.setPartyHeadCount(4);
	 * 
	 * partyMapper.write(partyVO); System.out.println("게시글 테스트: "+partyVO); }
	 */
	
	// 총 파티게시글 수 구하기
	/*
	 * @Test public void getTotalPartyCount() { int totalcount=0; totalcount=
	 * partyMapper.getTotalPartyCount(); System.out.println(totalcount); }
	 */
	
	// 원하는 파티게시글번호로 상세 내용 가져오기
	/*
	 * @Test public void getPartyDetail() { int no=2; PartyVO partyvo = new
	 * PartyVO(); partyvo=partyMapper.getPartyDetail(no);
	 * System.out.println(partyvo); System.out.println(partyvo.getPartyTitle());
	 * System.out.println(partyvo.getMemberVO().getId());
	 * System.out.println(partyvo.getMembershipVO().getMembershipName());
	 * System.out.println(partyvo.getPartyHeadCount());
	 * System.out.println(partyvo.getPartyApplyCount());
	 * System.out.println(partyvo.getPartyPostedTime());
	 * System.out.println(partyvo.getPartyStatus());
	 * System.out.println("멤버십vo 멤버십 번호: " +
	 * partyvo.getMembershipVO().getMembershipNo());
	 * 
	 * }
	 */

	// 파티모집 게시글 수정
	/*
	 * @Test public void UpdateParty() { int no = 2; PartyVO partyvo= new PartyVO();
	 * partyvo = partyMapper.getPartyDetail(no);
	 * 
	 * partyvo.getMembershipVO().setMembershipNo(1); partyvo.setPartyHeadCount(2);
	 * partyMapper.updateParty(partyvo);
	 * 
	 * partyvo = partyMapper.getPartyDetail(no); System.out.println(partyvo); }
	 */
	
	// 파티게시글 삭제
	/*
	 * @Test public void DeleteParty() { int no=2;
	 * System.out.println(partyMapper.getPartyDetail(no));
	 * partyMapper.deleteParty(no);
	 * System.out.println(partyMapper.getPartyDetail(no)); }
	 */
	
	// 파티게시물 지원하기
	/*
	 * @Test public void PartyApply() { PartyVO pvo = new PartyVO(); ApplyVO avo =
	 * new ApplyVO(); MemberVO mvo = new MemberVO(); mvo.setId("java"); int no=14;
	 * pvo = partyService.sPartyGetDetail(no); //지원할 게시글 정보 받아오기
	 * avo.setMemberVO(mvo); //지원자 VO set avo.setPartyVO(pvo); //지원할 게시물 set
	 * 
	 * System.out.println(pvo); System.out.println(avo); if(pvo.getPartyHeadCount()
	 * > pvo.getPartyApplyCount()) { //지원가능 여부 check partyService.sPartyApply(avo);
	 * //지원테이블에 지원자 정보 입력 }else { System.out.println("모집인원이 꽉찼습니다."); } pvo =
	 * partyService.sPartyGetDetail(no); System.out.println(pvo);
	 * 
	 * }
	 */
	
	//파티 게시글 리스트 가져오기
	/*
	 * @Test public void PartyGetAllList() { PartyListVO partyListVO =
	 * partyService.sPartyGetAllList();
	 * System.out.println(partyListVO.getPagingBean().getTotalPage());
	 * //System.out.println(partyListVO.getPagingBean().getStartRowNumber());
	 * //System.out.println(partyListVO.getPagingBean().getEndRowNumber());
	 * 
	 * List<PartyVO> list = partyListVO.getPartyList(); for(int i = 0; i <
	 * list.size(); i++) { System.out.println(list.get(i)); } }
	 */
	
	
	
	  @Test public void test(){ MemberVO mvo = new MemberVO(); mvo.setId("java");
	  
	  MembershipVO msvo = new MembershipVO(); msvo.setMembershipNo(1); //멤버십 설정을 위해
	  
	  
	  PartyVO partyVO = new PartyVO(); partyVO.setMemberVO(mvo);
	  partyVO.setPartyTitle("제목"); partyVO.setMembershipVO(msvo);
	  partyVO.setPartyHeadCount(4); for(int i=0;i<10;i++) {
	  partyMapper.mPartyWrite(partyVO); } }
	 
	
	//파티 지원 여부 확인
	/*
	 * @Test public void test() { String id="java"; int no = 156; HashMap<String,
	 * Object> map = new HashMap<String, Object>(); map.put("id", "java");
	 * map.put("no",136);
	 * 
	 * int result =partyService.sPartyIsApply(map); System.out.println(result); }
	 */
}




















