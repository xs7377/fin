package com.choa.member;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.choa.coupon.CouponService;

@Component
public class GradeUpdate {

	@Scheduled(cron = "0 0 0 1 * ?")  //매월 1일마다 멤버십 등급 산정
	public void gradeUpdate() throws Exception{
		MemberService memberService = new MemberService();
		CouponService couponService = new CouponService();

		//3개월 후 날짜 조회
		Calendar today = Calendar.getInstance();
		Calendar today2 = Calendar.getInstance();
		today.add(Calendar.MONTH, -3);
		today2.add(Calendar.MONTH, -1);
		Date startMonth = today.getTime();
		Date lastMonth= today2.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-01");
		int lastDay = 0;
		Calendar real_today = Calendar.getInstance();
		int real_month = (real_today.get(Calendar.MONTH));
		if(real_month == 1 || real_month == 3 ||  real_month == 5 ||  real_month == 7 ||
				real_month == 8 ||  real_month == 10 ||  real_month == 12 ){
			lastDay = 31;
		} else if( real_month == 4 ||  real_month == 6 ||  real_month == 9 ||
				real_month == 11 ) {
			lastDay = 30;
		} else {
			lastDay = 28;
		}
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-"+lastDay);
		String startDate = format.format(startMonth);
		String lastDate = format2.format(lastMonth);

		Map<String, Object> map = new HashMap<String, Object>();

		List<MemberDTO> memberList = memberService.memberList();
		map.put("startDate", startDate);
		map.put("lastDate", lastDate);
		int tCount=0;
		int tMoney=0;
		String grade="NEW";
		try{
			for(int i=0; i<memberList.size(); i++) {
				map.put("id", memberList.get(i).getId());

				tCount=couponService.tradeCount(map);
				tMoney=couponService.tradeMoney(map);

				if(tCount>=20 && tMoney >=1350000){ //first
					grade = "FIRST";
				} else if(tCount>=15 && tMoney >=500000){ //vvip
					grade = "VVIP";
				} else if(tCount >=8 && tMoney>=270000){ //vip
					grade = "VIP";
				} else if(tCount >=5 && tMoney >= 120000){ //gold
					grade = "GOLD";
				} else if(tCount>=2 && tMoney>= 40000){ //silver
					grade = "SILVER";
				} else { //new

				}
				map.put("grade", grade);
				memberService.gradeUpdate(map);

			}
		}catch (Exception e) {
		}
	}
}