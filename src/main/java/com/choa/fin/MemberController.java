package com.choa.fin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.attend.AttendService;
import com.choa.auction.AuctionDTO;
import com.choa.coupon.CouponDTO;
import com.choa.coupon.CouponService;
import com.choa.file.FileSaver;
import com.choa.friend.FriendDTO;
import com.choa.friend.FriendService;
import com.choa.member.MailService;
import com.choa.member.MemberDTO;
import com.choa.member.MemberService;
import com.choa.member.SendSMS;
import com.choa.message.MessageDTO;
import com.choa.message.MessageService;
import com.choa.util.PageMaker;
import com.choa.util.RowMaker;



@Controller
@RequestMapping(value = "/member/**")
public class MemberController {

	@Inject
	private MemberService memberService;
	@Inject
	private MailService mailService;
	@Inject
	private MessageService messageService;
	@Inject
	private CouponService couponService;
	@Inject
	private FriendService friendService;
	@Inject
	private AttendService attendService;
	
	
	

	//출석 체크
	@RequestMapping(value="memberAttend",method=RequestMethod.GET)
	public void attendCheck(String m_id, Model model, String msg) throws Exception{
		int total = attendService.totalCheck(m_id);
		model.addAttribute("total", total);
		model.addAttribute("msg", msg);
		System.out.println(total);
	}
	
	
	@RequestMapping(value="attendCheck",method=RequestMethod.GET)
	public String attendCheck(String id,RedirectAttributes redirectAttributes){
		String msg="출석 실패";
		System.out.println("ㅇㅇ");
		int result=0;
		int check=0;
		try {
			check=attendService.attendCut(id);
			System.out.println(id);
			System.out.println("check " + check);
			if(check==0){
				result=attendService.attendCheck(id);
				
				if(result>0){
					msg="누적 "+result+"일 출석 완료";
				}
				//누적 16일째되면 1일로 초기화
				if(result>15){
					result=attendService.attendReset(id);
					if(result>0){
						msg="누적"+result+"일 출석 완료";
					}else{
						msg="출석 리셋 실패";
					}
				}
			}else{
				msg="이미 출석했습니다.";
			}


			//result> 오늘 며 칠째인지 숫자가 넘어옴.
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		redirectAttributes.addAttribute("msg",msg);
		
		return "redirect: ./memberAttend?m_id="+id; 
	}



	//나의 친구
	@RequestMapping(value = "memberFriends", method = RequestMethod.GET)
	public void memberFriends(int curPage, String id, Model model) throws Exception {
		Map<String, Object> map = friendService.friendList(curPage, id);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}
	

	//구매 완료 상품 리스트
	@RequestMapping(value = "buyEnd", method = RequestMethod.GET)
	public void buyEnd(int curPage, String id, Model model) throws Exception {
		Map<String, Object> map = memberService.buyEnd(curPage, id);
		List<AuctionDTO> list = (List<AuctionDTO>)map.get("list");
		for(AuctionDTO auctionDTO: list){
			String category = auctionDTO.getCategory();
			String period = auctionDTO.getPeriod();
			String [] str = category.split(",");
			category = str[str.length-1].trim();
			String [] str3 = period.split(",");
			period = str3[0].trim();
			String buyer = auctionDTO.getBuyer();
			int price = 0;
			if(buyer != null) {
				String [] str2 = buyer.split(",");
				buyer = str2[0].trim();
				auctionDTO.setBuyer(buyer);
				price = Integer.parseInt(str2[1].trim());
			}
			auctionDTO.setCategory(category);
			auctionDTO.setPeriod(period);
			auctionDTO.setPrice(price);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}


	//구매 중 상품 리스트
	@RequestMapping(value = "buyIng", method = RequestMethod.GET)
	public void buyIng(Integer curPage, String id, Model model) throws Exception {
		Map<String, Object> map = memberService.buyIng(id, curPage);
		List<AuctionDTO> list = (List<AuctionDTO>)map.get("list");
		for(AuctionDTO auctionDTO: list){
			String category = auctionDTO.getCategory();
			String period = auctionDTO.getPeriod();
			String [] str = category.split(",");
			category = str[str.length-1].trim();
			String [] str3 = period.split(",");
			period = str3[0].trim();
			String buyer = auctionDTO.getBuyer();
			int price = 0;
			if(buyer != null) {
				String [] str2 = buyer.split(",");
				buyer = str2[0].trim();
				auctionDTO.setBuyer(buyer);
				price = Integer.parseInt(str2[1].trim());
			}
			auctionDTO.setCategory(category);
			auctionDTO.setPeriod(period);
			auctionDTO.setPrice(price);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}

	//입찰 중 상품 리스트
	@RequestMapping(value = "bidding", method = RequestMethod.GET)
	public void bidding(Integer curPage, String id, Model model) throws Exception {
		Map<String, Object> map = memberService.bidding(id, curPage);
		List<AuctionDTO> list = (List<AuctionDTO>)map.get("list");
		for(AuctionDTO auctionDTO: list){
			String category = auctionDTO.getCategory();
			String period = auctionDTO.getPeriod();
			String [] str = category.split(",");
			category = str[str.length-1].trim();
			String [] str3 = period.split(",");
			period = str3[0].trim();
			String buyer = auctionDTO.getBuyer();
			int price = 0;
			if(buyer != null) {
				String [] str2 = buyer.split(",");
				buyer = str2[0].trim();
				auctionDTO.setBuyer(buyer);
				price = Integer.parseInt(str2[1].trim());
			}
			auctionDTO.setCategory(category);
			auctionDTO.setPeriod(period);
			auctionDTO.setPrice(price);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}



	//관심 상품 리스트
	@RequestMapping(value = "likesProduct", method = RequestMethod.GET)
	public void likesProduct(Integer curPage, String id, Model model) throws Exception {
		Map<String, Object> map = memberService.likesProduct(id, curPage);
		List<AuctionDTO> list = (List<AuctionDTO>)map.get("list");
		for(AuctionDTO auctionDTO: list){
			String category = auctionDTO.getCategory();
			String period = auctionDTO.getPeriod();
			String [] str = category.split(",");
			category = str[str.length-1].trim();
			String [] str3 = period.split(",");
			period = str3[0].trim();
			String buyer = auctionDTO.getBuyer();
			int price = 0;
			if(buyer != null) {
				String [] str2 = buyer.split(",");
				buyer = str2[0].trim();
				auctionDTO.setBuyer(buyer);
				price = Integer.parseInt(str2[1].trim());
			}
			auctionDTO.setCategory(category);
			auctionDTO.setPeriod(period);
			auctionDTO.setPrice(price);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}


	//판매 중 상품 리스트
	@RequestMapping(value = "sellIng", method = RequestMethod.GET)
	public void sellIng(Integer curPage, String id, Model model) throws Exception {
		Map<String, Object> map = memberService.sellIng(curPage, id);
		List<AuctionDTO> list = (List<AuctionDTO>)map.get("list");

		for(AuctionDTO auctionDTO: list){
			String category = auctionDTO.getCategory();
			String period = auctionDTO.getPeriod();
			String [] str = category.split(",");
			category = str[str.length-1].trim();
			String [] str3 = period.split(",");
			period = str3[0].trim();
			String buyer = auctionDTO.getBuyer();
			if(buyer != null) {
				String [] str2 = buyer.split(",");
				buyer = str2[0].trim();
				auctionDTO.setBuyer(buyer);
			}
			auctionDTO.setCategory(category);
			auctionDTO.setPeriod(period);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}

	//판매 완료 상품 리스트
	@RequestMapping(value = "sellEnd", method = RequestMethod.GET)
	public void sellEnd(Integer curPage, String id, Model model) throws Exception {
		Map<String, Object> map = memberService.sellEnd(curPage, id);
		List<AuctionDTO> list = (List<AuctionDTO>)map.get("list");

		for(AuctionDTO auctionDTO: list){
			String category = auctionDTO.getCategory();
			String [] str = category.split(",");
			category = str[str.length-1].trim();
			String buyer = auctionDTO.getBuyer();
			String [] str2 = buyer.split(",");
			buyer = str2[0].trim();
			int price = Integer.parseInt(str2[1].trim());
			auctionDTO.setBuyer(buyer);
			auctionDTO.setCategory(category);
			auctionDTO.setPrice(price);
		}
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}


	//쿠폰 조회
	@RequestMapping(value = "memberPoint", method = RequestMethod.GET)
	public void memberPoint(String message, Model model, HttpSession session) throws Exception {
		model.addAttribute("message", message);
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		CouponDTO couponDTO1 = couponService.couponSelectPercent(memberDTO.getId(), memberDTO.getGrade()); //퍼센트 쿠폰 조회
		CouponDTO couponDTO2 = couponService.couponSelectPoint(memberDTO.getId(), memberDTO.getGrade()); //포인트 쿠폰 조회
		int percent_result = 0;
		int point_result = 0;
		if(couponDTO1 == null) {
			percent_result = 1; //퍼센트 쿠폰 발급 가능
		} else {
			percent_result = 0; //퍼센트 쿠폰 발급 불가능
		}

		if(couponDTO2 == null) {
			point_result = 1; //포인트 쿠폰 발급 가능
		} else {
			point_result = 0; //포인트 쿠폰 발급 불가능
		}
		model.addAttribute("percent_result", percent_result);
		model.addAttribute("point_result", point_result);

		//3개월 후 날짜 조회
		Calendar today = Calendar.getInstance();
		Calendar today2 = Calendar.getInstance();
		today.add(Calendar.MONTH, -3);
		today2.add(Calendar.MONTH, -1);
		Date startMonth = today.getTime();
		Date lastMonth= today2.getTime();
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-01");
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
		SimpleDateFormat format2 = new SimpleDateFormat("YYYY-MM-"+lastDay);
		String startDate = format.format(startMonth);
		String lastDate = format2.format(lastMonth);
		model.addAttribute("startDate", startDate);
		model.addAttribute("lastDate", lastDate);

		Map<String , Object> map = new HashMap<String, Object>();
		map.put("id", memberDTO.getId());
		map.put("startDate", startDate);
		map.put("lastDate", lastDate);
		int tCount = couponService.tradeCount(map);
		int tMoney = couponService.tradeMoney(map);
		model.addAttribute("tCount", tCount);
		model.addAttribute("tMoney", tMoney);

		int needCount = 0;
		int needMoney = 0;
		if(memberDTO.getGrade().equals("NEW")){
			needCount = 2-tCount;
			needMoney = 40000-tMoney;
		} else if (memberDTO.getGrade().equals("SILVER")){
			needCount = 5-tCount;
			needMoney = 120000-tMoney;
		} else if (memberDTO.getGrade().equals("GOLD")){
			needCount = 8-tCount;
			needMoney = 270000-tMoney;
		} else if (memberDTO.getGrade().equals("VIP")) {
			needCount = 15-tCount;
			needMoney = 500000-tMoney;
		} else if (memberDTO.getGrade().equals("VVIP")){
			needCount = 20-tCount;
			needMoney = 1350000-tMoney;
		} else {
			needCount = 20-tCount;
			needMoney = 1350000-tMoney;
		}
		
		if(needCount < 0) {
			needCount = 0;
		}
		if(needMoney < 0) {
			needMoney = 0;
		}
		model.addAttribute("needCount", needCount);
		model.addAttribute("needMoney", needMoney);
	}


	//쿠폰 발급
	@RequestMapping(value = "memberCoupon", method = RequestMethod.GET)
	public String memberCoupon(String name, String contents, String kind, HttpSession session, 
			RedirectAttributes redirectAttributes) throws Exception {
		//오늘 날짜로부터 30일 후 구하기            
		Calendar today = Calendar.getInstance();
		today.add(Calendar.DATE, 30);
		Date year = today.getTime();            
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String end_date = format.format(year);
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		CouponDTO couponDTO = couponService.couponSelect(memberDTO.getId(), name);
		if(couponDTO != null ) {
			redirectAttributes.addAttribute("message", "발급된 쿠폰입니다.");
		} else {
			CouponDTO couponDTO2 = new CouponDTO();
			couponDTO2.setEnd_date(end_date);
			couponDTO2.setM_id(memberDTO.getId());
			couponDTO2.setName(name);
			couponDTO2.setContents(contents);
			couponDTO2.setKind(kind);
			couponDTO2.setGrade(memberDTO.getGrade());
			couponService.couponInsert(couponDTO2);
			redirectAttributes.addAttribute("message", "쿠폰이 발급되었습니다.");
		}
		return "redirect: ./memberPoint";
	}


	//아이디 중복확인
	@RequestMapping(value = "idCheck", method = RequestMethod.GET)
	public void idCheck() {
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public void idCheck(String id, Model model) throws Exception {
		boolean result = memberService.checkId(id);
		model.addAttribute("result", result);
	}

	//휴대폰 인증
	@RequestMapping(value = "phoneConfirm", method = RequestMethod.GET)
	public void phoneConfirm(String message, String phone, String text, Model model) {
		model.addAttribute("message", message);
		model.addAttribute("phone", phone);
		model.addAttribute("text", text);
	}


	@RequestMapping(value = "phoneConfirm", method = RequestMethod.POST)
	public String phoneConfirm(String phone, RedirectAttributes redirectAttributes) {
		String text = randomNumber(6);
		SendSMS sendSMS = new SendSMS();
		sendSMS.SendMessage(text, phone);
		redirectAttributes.addAttribute("message", "핸드폰으로 인증 번호가 발송되었습니다.");
		redirectAttributes.addAttribute("phone", phone);
		redirectAttributes.addAttribute("text", text);
		return "redirect: ./phoneConfirm";
	}

	//휴대폰 인증번호 확인
	@RequestMapping(value = "phoneConfirm_number", method = RequestMethod.GET)
	public void phoneConfirm_number(String message, Model model) {
		model.addAttribute("message", message);
	}

	@RequestMapping(value = "phoneConfirm_number", method = RequestMethod.POST)
	public String phoneConfirm_number(String number1, String number2, RedirectAttributes redirectAttributes) {
		String path = "";
		if(!number1.equals(number2)) {
			redirectAttributes.addAttribute("message", "인증번호가 일치하지 않습니다.");
			path = "redirect: ./phoneConfirm";
		} else {
			redirectAttributes.addAttribute("message", "인증번호가 일치합니다. 회원가입 페이지로 이동합니다.");
			path = "redirect: ./memberJoin";
		}
		return path;
	}


	//이메일 인증번호 확인
	@RequestMapping(value = "emailConfirm_number", method = RequestMethod.GET)
	public void emailConfirm_number(String message, Model model) {
		model.addAttribute("message", message);
	}

	@RequestMapping(value = "emailConfirm_number", method = RequestMethod.POST)
	public String emailConfirm_number(String number1, String number2, RedirectAttributes redirectAttributes) {
		String path = "";
		if(!number1.equals(number2)) {
			redirectAttributes.addAttribute("message", "인증번호가 일치하지 않습니다.");
			path = "redirect: ./emailConfirm";
		} else {
			redirectAttributes.addAttribute("message", "인증번호가 일치합니다. 회원가입 페이지로 이동합니다.");
			path = "redirect: ./memberJoin";
		}
		return path;
	}

	//이메일 인증
	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
	public void emailConfirm(String message, String email, String number, Model model) {
		model.addAttribute("message", message);
		model.addAttribute("email", email);
		model.addAttribute("number", number);
	}


	@RequestMapping(value = "emailConfirm", method = RequestMethod.POST)
	public String emailConfirm(String email, RedirectAttributes redirectAttributes) {
		try {
			String number = randomPassword(10);
			String from = "mina110288@gmail.com";
			String to = email;
			String subject = "중고 경매 사이트 [TRADEMARK] 인증 번호 발급";
			String contents = "회원님의 인증 번호는 [ " +number+ " ] 입니다.";
			mailService.sendMail(from, to, subject, contents);
			redirectAttributes.addAttribute("message", "이메일로 인증 번호가 발송되었습니다.");
			redirectAttributes.addAttribute("email", email);
			redirectAttributes.addAttribute("number", number);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect: ./emailConfirm";
	}


	//인증 번호 알고리즘
	public String randomNumber (int length) {
		int index = 0;
		char[] charSet = new char[] {
				'0','1','2','3','4','5','6','7','8','9'};
		StringBuffer sb = new StringBuffer();
		for (int i=0; i<length; i++) {
			index =  (int) (charSet.length * Math.random());
			sb.append(charSet[index]);
		}
		return sb.toString();	
	}

	//인증 번호 알고리즘
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

	//약관 동의
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void memberAgree() {
	}

	//이메일, 핸드폰 인증 페이지
	@RequestMapping(value = "memberConfirm", method = RequestMethod.GET)
	public void memberConfirm() {
	}

	//아이디 찾기
	@RequestMapping(value = "memberFindId", method = RequestMethod.GET)
	public void memberFindId(String message, Model model) {
		model.addAttribute("message", message);
	}

	@RequestMapping(value = "idFind", method = RequestMethod.POST)
	public String idFind(String name, String email, RedirectAttributes redirectAttributes) {
		MemberDTO memberDTO = new MemberDTO();
		try {
			memberDTO = memberService.idFind(name, email);
			if(memberDTO != null) {
				String from = "mina110288@gmail.com";
				String to = email;
				String subject = "중고 경매 사이트 [TRADEMARK] 아이디 찾기";
				String contents = "회원님의 아이디는 [ " +memberDTO.getId()+ " ] 입니다.";
				mailService.sendMail(from, to, subject, contents);
				redirectAttributes.addAttribute("message", "이메일로 아이디가 발송되었습니다.");
			} else {
				redirectAttributes.addAttribute("message", "일치하는 회원 정보가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect: ./memberFindId";
	}


	//비밀번호 찾기
	@RequestMapping(value = "memberFindPw", method = RequestMethod.GET)
	public void memberFindPw(String message, Model model) {
		model.addAttribute("message", message);
	}

	@RequestMapping(value = "pwFind", method = RequestMethod.POST)
	public String pwFind(String id, String email, RedirectAttributes redirectAttributes) {
		try {
			MemberDTO memberDTO = memberService.pwFind(id, email);
			if(memberDTO != null) {
				String from = "mina110288@gmail.com";
				String to = email;
				String subject = "중고 경매 사이트 [TRADEMARK] 임시 비밀번호 발급";
				String contents = "회원님의 임시 비밀번호는 [ " +memberDTO.getPw()+ " ] 입니다.";
				mailService.sendMail(from, to, subject, contents);
				redirectAttributes.addAttribute("message", "이메일로 임시 비밀번호가 발송되었습니다.");
			} else {
				redirectAttributes.addAttribute("message", "일치하는 회원 정보가 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect: ./memberFindPw";
	}


	//memberProfileDelete
	@RequestMapping (value="memberProfileDelete", method=RequestMethod.POST)
	public String memberProfileDelete(String id, String fname, HttpSession session, Model model){
		System.out.println(id);
		System.out.println(fname);
		int result = 0; 
		// 파일 삭제
		String path = session.getServletContext().getRealPath("resources/upload");
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		File file = new File(f, fname);
		file.delete();
		// DB에서 fname, onmae 초기화
		try {
			result = memberService.fileDelete(id);
			System.out.println(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("profileResult", result);
		return "redirect:/"; 
	}


	//정보 수정
	@RequestMapping(value="memberUpdate",method=RequestMethod.GET)
	public void memberUpdate(){

	}


	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam(defaultValue="") MultipartFile file){
		System.out.println("컨트롤러입장");
		int result = 0;
		FileSaver fileSaver = new FileSaver();

		if(!file.getOriginalFilename().equals("")) {
			memberDTO.setOname(memberDTO.getFile().getOriginalFilename());
			try {
				memberDTO.setFname(fileSaver.saver(memberDTO.getFile(), session.getServletContext().getRealPath("resources/upload")));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			memberDTO.setOname(((MemberDTO)session.getAttribute("member")).getOname());
			memberDTO.setFname(((MemberDTO)session.getAttribute("member")).getFname());
			System.out.println("사진 바꾸지 않았음");
		}

		/*try {
		} catch (Exception e1) {
		}*/
		try {
			result = memberService.memberUpdate(memberDTO);
			if(result > 0) {
				System.out.println("수정 성공");
				redirectAttributes.addAttribute("message", "수정 성공");
			} else {
				System.out.println("수정 실패");
				redirectAttributes.addAttribute("message", "수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		try {
			memberDTO = memberService.memberView(memberDTO.getId());
			session.setAttribute("member", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect: ./memberView"; 
	}


	//회원 탈퇴
	@RequestMapping(value="memberDelete", method=RequestMethod.GET)
	public String memberDelete(HttpSession session, String id, RedirectAttributes redirectAttributes){
		int result = 0;
		boolean check = false;

		// 파일삭제
		String path = session.getServletContext().getRealPath("resources/upload");
		String fileName = "";
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		try {
			fileName = memberService.fileSelect(id);
			File file = new File(f, fileName);
			check = file.delete();
			if(check){
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			result = memberService.memberDelete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(result > 0) {
			redirectAttributes.addFlashAttribute("message", "탈퇴 성공");
			session.invalidate();
		} else {
			redirectAttributes.addFlashAttribute("message", "탈퇴 실패");
		}
		return "redirect:/";
	}


	//마이페이지 
	@RequestMapping(value = "memberMypage", method = RequestMethod.GET)
	public void memberMypage() {
	}

	//나의정보
	@RequestMapping(value = "memberView", method = RequestMethod.GET)
	public void memberView(String message, Model model) {
		System.out.println("memberView에서 받은 메세지: " + message);
		model.addAttribute("message", message);
	}

	//로그아웃
	@RequestMapping(value="memberLogout", method=RequestMethod.GET)
	public String memberLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}

	//로그인
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void memberLogin() {
	}

	@RequestMapping(value = "memberLogin", method = RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, String idcheck, HttpServletRequest request, HttpServletResponse response,
			HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
		MemberDTO member = new MemberDTO();
		if(idcheck==null) {
			Cookie[] cookie = request.getCookies();
			for(int i=0; i<cookie.length; i++) {
				if(cookie[i].getName().equals("id")){
					cookie[i].setMaxAge(0);
					response.addCookie(cookie[i]);
				}
			}
		} else {
			Cookie cookie = new Cookie("id", memberDTO.getId());
			response.addCookie(cookie);
		}

		member = memberService.memberLogin(memberDTO);
		if(member != null) {
			redirectAttributes.addFlashAttribute("msg", "로그인 성공");
			session.setAttribute("member", member);
		} else {
			redirectAttributes.addFlashAttribute("msg", "로그인 실패");
		}
		return "redirect:/";
	}

	//회원가입
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void memberJoin() {
	}

	@RequestMapping(value = "memberJoin", method = RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, HttpSession session, RedirectAttributes redirectAttributes) {
		int result = 0;
		FileSaver fileSaver = new FileSaver();
		memberDTO.setOname(memberDTO.getFile().getOriginalFilename());

		try {
			memberDTO.setFname(fileSaver.saver(memberDTO.getFile(), session.getServletContext().getRealPath("resources/upload")));
			result = memberService.memberJoin(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			redirectAttributes.addFlashAttribute("message", "환영합니다!");
		} else {
			redirectAttributes.addFlashAttribute("message", "회원가입 실패");
		}

		return "redirect:/";
	}

	////메시지 주고 받은 List
	@RequestMapping(value="memberReceive", method=RequestMethod.GET)
	public void messageReciveList(String to_id,Model model){
		Map<String, Object> map= new HashMap<String, Object>();
		List<MessageDTO> ar=new ArrayList<MessageDTO>();
		PageMaker pageMaker=new PageMaker(1, 10);
		RowMaker rowMaker=pageMaker.getRowMaker();
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		map.put("to_id", to_id);
		try {
			ar=messageService.messageReciveList(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(ar!=null){
			model.addAttribute("list", ar);
		}else{
			System.out.println("안 넘어옴");
		}
	}



	@RequestMapping(value="memberSend", method=RequestMethod.GET)
	public void messageSendList(String from_id,Model model){
		Map<String, Object> map= new HashMap<String, Object>();

		List<MessageDTO> ar=new ArrayList<MessageDTO>();
		PageMaker pageMaker=new PageMaker(1, 10);
		RowMaker rowMaker=pageMaker.getRowMaker();
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		map.put("from_id", from_id);
		try {
			ar=messageService.messageSendList(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if(ar!=null){
			model.addAttribute("list", ar);
		}else{
			System.out.println("안 넘어옴");
		}
	}

	//쪽지 보내기 및 받기
	@RequestMapping(value="memberMessage", method=RequestMethod.GET)
	public void memberMessage(String id, Model model) throws Exception{
		String from_id=id;
		String to_id=id;
		Map<String , Object> map=new HashMap<String, Object>();	
		PageMaker pageMaker=new PageMaker(1, 10);
		RowMaker rowMaker=pageMaker.getRowMaker();
		map.put("startRow", rowMaker.getStartRow());
		map.put("lastRow", rowMaker.getLastRow());
		map.put("from_id", from_id);
		map.put("to_id", to_id);
		//쪽지 map 		

		model.addAttribute("sendList", messageService.messageSendList(map));
		model.addAttribute("recvList", messageService.messageReciveList(map));
	}
	
	@RequestMapping(value="memberImages")
	@ResponseBody
	public String memberImages(@RequestParam(value="id",required=false)String id) throws Exception{
		return memberService.fileSelect(id);
	}
	
	@RequestMapping(value="pointUpdate")
	@ResponseBody
	public int pointUpdate(String id, int point){
		return memberService.pointUpdate(id, point);
	}
}