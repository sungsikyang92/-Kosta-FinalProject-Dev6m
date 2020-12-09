package org.kosta.watflix.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.watflix.model.mapper.PartyMapper;
import org.kosta.watflix.model.vo.ApplyVO;
import org.kosta.watflix.model.vo.MembershipVO;
import org.kosta.watflix.model.vo.PartyListVO;
import org.kosta.watflix.model.vo.PartyVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service
public class PartyServiceImpl implements PartyService{
	@Resource 
	private PartyMapper partyMapper;
	
	@Override
	public void sPartyWrite(PartyVO partyVO) {
		partyMapper.mPartyWrite(partyVO);
	}
	
	@Override
	public int sPartyGetTotalCount() {
		return partyMapper.mPartyGetTotalCount(); 
	}
	
	@Override
	public PartyVO sPartyGetDetail(int no) {
		PartyVO pvo = new PartyVO();
		pvo=partyMapper.mPartyGetDetail(no);
		return pvo;
	}
	
	@Override
	public void sPartyUpdate(PartyVO partyvo) {
		partyMapper.mPartyUpdate(partyvo);
	}
	@Override
	public void sPartyDelete(int no) {
		partyMapper.mPartyDelete(no);
	}
	@Transactional
	@Override
	public void sPartyApply(ApplyVO avo) {
		partyMapper.mPartyApply(avo);
		partyMapper.mPartyApplyCountPlus(avo.getPartyVO().getPartyNo());
		PartyVO pvo = partyMapper.mPartyGetDetail(avo.getPartyVO().getPartyNo());
		if(pvo.getPartyHeadCount() == pvo.getPartyApplyCount()) {
			partyMapper.mPartyEnd(pvo);
		}
	}
	/*
	 * @Override public PartyListVO sPartyGetAllList() { return
	 * sPartyGetAllList("1"); }
	 * 
	 * @Override public PartyListVO sPartyGetAllList(String pageNo) { int
	 * totalPartyCount = partyMapper.mPartyGetTotalCount(); PagingBean pagingBean =
	 * null; if(pageNo == null) { int contentNumberPerPage=10; int
	 * pageNumberPerPageGroup=5; pagingBean = new
	 * PagingBean(totalPartyCount,contentNumberPerPage,pageNumberPerPageGroup);
	 * }else { int contentNumberPerPage=10; int pageNumberPerPageGroup=5; pagingBean
	 * = new PagingBean(totalPartyCount,
	 * contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo)); }
	 * PartyListVO partyListVO = new
	 * PartyListVO(partyMapper.mPartyGetAllList(pagingBean),pagingBean); return
	 * partyListVO; }
	 */
	
	@Override
	public MembershipVO sPartyGetMembershipDetail(int no) {
		MembershipVO msvo = partyMapper.mPartyGetMembershipDetail(no);
		return msvo;
	}
	@Override
	public List<MembershipVO> sPartyMembershipInfo() {
		List<MembershipVO> lmsvo = partyMapper.mPartyMembershipInfo();
		return lmsvo;
	}
	@Override
	public int sPartyIsApply(HashMap<String, Object> map) {
		int result= partyMapper.mPartyIsApply(map);
		return result;
	}

	@Override
	public PartyListVO sPartyGetAllList() {
		return sPartyGetAllList("1");
	}
	@Override
	public PartyListVO sPartyGetAllList(String pageNo) {
		int totalPartyCount = partyMapper.mPartyGetTotalCount();
		PagingBean pagingBean = null;
		if(pageNo == null) {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(totalPartyCount,contentNumberPerPage,pageNumberPerPageGroup);
		}else {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(totalPartyCount, contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo));
		}		
		PartyListVO partyListVO = new PartyListVO(partyMapper.mPartyGetAllList(pagingBean),pagingBean);
		return partyListVO;
	}
	
	
	/*
	 * @Override public PartyListVO sPartyGetAllList(String id) { return
	 * sPartyGetAllList("1",id); }
	 * 
	 * @Override public PartyListVO sPartyGetAllList(String pageNo,String id) { int
	 * totalPartyCount = partyMapper.mPartyGetTotalCount(); PagingBean pagingBean =
	 * null; if(pageNo == null) { int contentNumberPerPage=10; int
	 * pageNumberPerPageGroup=5; pagingBean = new
	 * PagingBean(totalPartyCount,contentNumberPerPage,pageNumberPerPageGroup);
	 * }else { int contentNumberPerPage=10; int pageNumberPerPageGroup=5; pagingBean
	 * = new PagingBean(totalPartyCount,
	 * contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo)); }
	 * PartyListVO partyListVO = new
	 * PartyListVO(partyMapper.mPartyGetAllList(pagingBean),pagingBean); return
	 * partyListVO; }
	 */
	@Override
	public PartyListVO sPartyGetAllList(HashMap<String, Object> map) {
		int totalPartyCount = partyMapper.mPartyGetTotalCount();
		PagingBean pagingBean = null;
		String pageNo = (String) map.get("pageNo");
		//String id = (String)map.get("loginid");
		if(pageNo == null) {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(totalPartyCount,contentNumberPerPage,pageNumberPerPageGroup);
			//map.put("pagingBean", pagingBean);
		}else {
			int contentNumberPerPage=10;
			int pageNumberPerPageGroup=5;
			pagingBean = new PagingBean(totalPartyCount, contentNumberPerPage,pageNumberPerPageGroup,Integer.parseInt(pageNo));
			//map.put("pagingBean", pagingBean);
		}		
//		PartyListVO partyListVO = new PartyListVO(partyMapper.mPartyGetAllList(map),pagingBean);
		PartyListVO partyListVO = new PartyListVO(partyMapper.mPartyGetAllList(pagingBean),pagingBean);
		return partyListVO;
	}
	
	

}
