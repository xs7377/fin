package com.choa.coupon;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choa.auction.AuctionDTO;

@Repository
public class CouponDAO {

	
	@Inject
	private SqlSession sqlSession;
	private String namespace = "CouponMapper.";
	
	//쿠폰 등록
	public int couponInsert (CouponDTO couponDTO) throws Exception{
		return sqlSession.insert(namespace+"couponInsert", couponDTO);
	}
	
	//쿠폰 조회
	public CouponDTO couponSelect(String id, String name) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		return sqlSession.selectOne(namespace+ "couponSelect", map);
	}
	
	//퍼센트 쿠폰 조회
	public CouponDTO couponSelectPercent(String id, String grade) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("grade", grade);
		return sqlSession.selectOne(namespace + "couponSelectPercent", map);
	}
	
	//포인트 쿠폰 조회
	public CouponDTO couponSelectPoint(String id, String grade) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("grade", grade);
		return sqlSession.selectOne(namespace + "couponSelectPoint", map);
	}
	
	//쿠폰 사용 기간 이후 자동 삭제
	public int couponDelete(String id) throws Exception {
		return sqlSession.delete(namespace + "couponDelete", id);
	}
	
	//총 거래 건수
	public int tradeCount(Map<String, Object> map) throws Exception{
		int countSell = sqlSession.selectOne(namespace + "countSell", map);
		int countBuy = sqlSession.selectOne(namespace + "countBuy", map);
		return countSell+countBuy;
	}
	
	//총 거래 금액
	public int tradeMoney(Map<String, Object> map) throws Exception {
		System.out.println(map.get("startDate"));
		List<AuctionDTO> sellList = sqlSession.selectList(namespace+"sellMoney", map);
		List<Integer> sellMoney = new ArrayList<Integer>();
		
		for(int i=0; i<sellList.size(); i++){
			String [] str= sellList.get(i).getBuyer().split(",");
			sellMoney.add((Integer.parseInt(str[1].trim())));
		}
		
		int sMoney = 0;
		int bMoney = 0;
		for(int i=0; i<sellMoney.size(); i++){
			sMoney = sellMoney.get(i);
		}
		
		List<AuctionDTO> buyList = sqlSession.selectList(namespace+"buyMoney", map);
		List<Integer> buyMoney = new ArrayList<Integer>();
		
		for(int i=0; i<buyList.size(); i++){
			String [] str= buyList.get(i).getBuyer().split(",");
			buyMoney.add((Integer.parseInt(str[1].trim())));
		}
		
		for(int i=0; i<buyMoney.size(); i++){
			bMoney =buyMoney.get(i);
		}
		
		return sMoney+bMoney;
	}

}