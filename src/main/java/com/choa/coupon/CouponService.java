package com.choa.coupon;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponService {

	@Inject
	private CouponDAO couponDAO;
	
	//쿠폰 등록
	public int couponInsert(CouponDTO couponDTO) throws Exception{
		return couponDAO.couponInsert(couponDTO);
	}

	//쿠폰 조회
	public CouponDTO couponSelect(String id, String name) throws Exception{
		return couponDAO.couponSelect(id, name);
	}
	
	//모든 쿠폰 조회
	public List<CouponDTO> allCoupon(String id) throws Exception{
		return couponDAO.allCoupon(id);
	}
	
	//퍼센트 쿠폰 조회
	public CouponDTO couponSelectPercent(String id, String grade) throws Exception{
		return couponDAO.couponSelectPercent(id, grade);
	}
	
	//포인트 쿠폰 조회
	public CouponDTO couponSelectPoint(String id, String grade) throws Exception{
		return couponDAO.couponSelectPoint(id, grade);
	}
	
	//쿠폰 사용 기간 이후 자동 삭제
	public int couponDelete(String id) throws Exception{
		return couponDAO.couponDelete(id);
	}
	
	//총 거래 건수
	public int tradeCount(Map<String, Object> map) throws Exception{
		return couponDAO.tradeCount(map);
	}
	
	//총 거래 금액
	public int tradeMoney(Map<String, Object> map) throws Exception{
		return couponDAO.tradeMoney(map);
	}
	
	//쿠폰 사용 업데이트
	public int couponUpdate(String coupon,String id) throws Exception{
		return couponDAO.couponUpdate(coupon, id);
	}
}
