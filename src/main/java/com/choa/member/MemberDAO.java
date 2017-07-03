package com.choa.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choa.auction.AuctionDTO;
import com.choa.util.RowMaker;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "MemberMapper.";
	
	//관심 상품 토탈카운트
	public int likeProductTotalCount(String id) throws Exception{
		List<Integer> pnum = sqlSession.selectList(namespace+"likesNum", id);
		int num = pnum.size();
		return num;
	}
	
	//관심 상품
	public List<AuctionDTO> likesProduct(String id, RowMaker rowMaker) throws Exception{
		List<Integer> pnum = sqlSession.selectList(namespace+"likesNum", id);
		System.out.println(pnum);
		System.out.println(pnum.get(0));
		Map<String, Object> map=new HashMap<String, Object>();
		List<AuctionDTO> list = new ArrayList<AuctionDTO>();
		map.put("row", rowMaker);
		for(int i=0; i<pnum.size(); i++) {
			map.put("pnum", pnum.get(i));
			System.out.println("map pnum"+map.get("pnum"));
			list.add((AuctionDTO) sqlSession.selectOne(namespace+"likesProduct", map));
			System.out.println(list.get(i).getCategory());
		}
		return list;
	}
	
	//판매 중 상품 토탈카운트
	public int sellIngTotalCount(String id) throws Exception{
		return sqlSession.selectOne(namespace+"sellIngTotalCount", id);
	}
	
	//판매 완료 상품 토탈카운트
	public int sellEndTotalCount(String id) throws Exception{
		return sqlSession.selectOne(namespace+"sellEndTotalCount", id);
	}
	
	//판매 중 상품
	public List<AuctionDTO> sellIng(RowMaker rowMaker, String id) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("row", rowMaker);
		map.put("id", id);
		return sqlSession.selectList(namespace+"sellIng", map);
	}
	
	//판매 완료 상품
	public List<AuctionDTO> sellEnd(RowMaker rowMaker, String id) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("row", rowMaker);
		map.put("id", id);
		return sqlSession.selectList(namespace+"sellEnd", map);
	}
	
	//멤버십 등급 업데이트
	public int gradeUpdate(Map<String, Object> map) throws Exception{
		return sqlSession.update(namespace + "gradeUpdate", map);
	}
	
	//멤버 리스트
	public List<MemberDTO> memberList() throws Exception{
		return sqlSession.selectList(namespace+"memberList");
	}
	
	//아이디 찾기
	public MemberDTO idFind(String name, String email) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne(namespace+"idFind", map);
	}
	
	//비밀번호 찾기
	public MemberDTO pwFind(String id, String email) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		this.pwUpdate(id);
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne(namespace+"pwFind", map);
	}
	
	//임시 비밀번호
	public int pwUpdate(String id) throws Exception {
		String password = randomPassword(10);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		return sqlSession.update(namespace+"pwUpdate", map);
	}
	
	public String randomPassword (int length) {
		int index = 0;
		char[] charSet = new char[] {
			    '0','1','2','3','4','5','6','7','8','9'
			    ,'A','B','C','D','E','F','G','H','I','J','K','L','M'
			    ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
			    ,'a','b','c','d','e','f','g','h','i','j','k','l','m'
			    ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};
		
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<length; i++) {
			index =  (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		return sb.toString();	
	}
	
	//정보 조회
	public MemberDTO memberView(String id) throws Exception {
		return sqlSession.selectOne(namespace+"memberView", id);
	}
	
	
	//이메일 조회
	public MemberDTO searchEmail(String email) throws Exception{
		return sqlSession.selectOne(namespace+"searchEmail", email);
	}
	
	//회원 가입
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(namespace+"memberJoin", memberDTO);
	}
	
	//회원 탈퇴
	public int memberDelete(String id) throws Exception{
		return sqlSession.delete(namespace+"memberDelete", id);
	}
	
	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(namespace+"memberLogin", memberDTO);
	}
	
	//정보 수정
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(namespace+"memberUpdate", memberDTO);
	}
	
	//아이디 중복 확인
	public boolean checkId(String id) throws Exception{
		MemberDTO memberDTO = sqlSession.selectOne(namespace+"checkId", id);
		boolean check = false;
		if(memberDTO != null){
			check = false; //중복 id 존재
		} else {
			check = true; //중복 id 없음
		}
		
		return check;
	}

	
	public String fileSelect(String id) throws Exception {
		return sqlSession.selectOne(namespace+"fileSelect", id);
	}
	
	public int fileDelete(String id) throws Exception {
		return sqlSession.update(namespace+"fileDelete", id);
	}
	
}