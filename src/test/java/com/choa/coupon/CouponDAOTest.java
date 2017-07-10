package com.choa.coupon;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.choa.fin.AbstractTest;

public class CouponDAOTest extends AbstractTest {
	
	@Inject
	private CouponService couoponService;

	@Test
	public void test() throws Exception {
		String id = "mina7433";
		List<CouponDTO> ar = couoponService.allCoupon(id);
		System.out.println(ar.size());
	}

}
