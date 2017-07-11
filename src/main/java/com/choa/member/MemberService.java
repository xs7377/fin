package com.choa.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.choa.auction.AuctionDTO;
import com.choa.util.PageMaker;
import com.choa.util.PageResult;
import com.choa.util.RowMaker;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public String fileSelect(String id) throws Exception {
		return memberDAO.fileSelect(id);
	}

	public int fileDelete(String id) throws Exception {
		return memberDAO.fileDelete(id);
	}
	
	//매니저- 판매자 결산 페이지
	public Map<String, Object> managerSellPage(int curPage) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		PageMaker pageMaker=new PageMaker(curPage);
		List<AuctionDTO> list = memberDAO.sellerList();
		int totalCount = list.size();
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr=pageMaker.paging(totalCount);
		map.put("list", memberDAO.buyerList(list));
		map.put("pageResult", pr);
		return map;
	}
	
	//구매 완료 상품
	public Map<String, Object> buyEnd(int curPage, String id) throws Exception{
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr = pageMaker.paging(memberDAO.buyEndTotalCount(id));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", memberDAO.buyEnd(rowMaker, id));
		map.put("pageResult", pr);
		return map;
	}

	//관심 상품
	public Map<String, Object> likesProduct(String id, int curPage) throws Exception{
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr = pageMaker.paging(memberDAO.likeProductTotalCount(id));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", memberDAO.likesProduct(id, rowMaker));
		map.put("pageResult", pr);

		return map;
	} 

	//구매 중 상품
	public Map<String, Object> buyIng(String id, int curPage) throws Exception{
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr = pageMaker.paging(memberDAO.buyIngPnum(id));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", memberDAO.buyIng(rowMaker, id));
		map.put("pageResult", pr);
		return map;
	} 

	//입찰 중 상품
	public Map<String, Object> bidding(String id, int curPage) throws Exception{
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr = pageMaker.paging(memberDAO.biddingPnum(id));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", memberDAO.bidding(rowMaker, id));
		map.put("pageResult", pr);
		return map;
	} 

	//판매 중 상품
	public Map<String, Object> sellIng(int curPage, String id) throws Exception{
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr = pageMaker.paging(memberDAO.sellIngTotalCount(id));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", memberDAO.sellIng(rowMaker, id));
		map.put("pageResult", pr);
		return map;
	}

	//판매 완료 상품
	public Map<String, Object> sellEnd(int curPage, String id) throws Exception{
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr = pageMaker.paging(memberDAO.sellEndTotalCount(id));
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", memberDAO.sellEnd(rowMaker, id));
		map.put("pageResult", pr);
		return map;
	}

	//멤버십 등급 업데이트
	public int gradeUpdate(Map<String, Object> map) throws Exception{
		return memberDAO.gradeUpdate(map);
	}

	//멤버 리스트
	public List<MemberDTO> memberList() throws Exception{
		return memberDAO.memberList();
	}

	//아이디 찾기
	public MemberDTO idFind(String name, String email) throws Exception{
		return memberDAO.idFind(name, email);
	}

	//비밀번호 찾기
	public MemberDTO pwFind(String id, String email) throws Exception{
		return memberDAO.pwFind(id, email);
	}

	//정보 조회
	public MemberDTO memberView(String id) throws Exception{
		return memberDAO.memberView(id);
	}

	//회원 가입
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		return memberDAO.memberJoin(memberDTO);
	}

	//회원 탈퇴
	public int memberDelete(String id) throws Exception{
		return memberDAO.memberDelete(id);
	}

	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.memberLogin(memberDTO);
	}

	//정보 수정
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.memberUpdate(memberDTO);
	}

	//아이디 중복 확인
	public boolean checkId(String id) throws Exception{
		return memberDAO.checkId(id);
	}


}
