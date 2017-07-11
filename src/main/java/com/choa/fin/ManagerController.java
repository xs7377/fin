package com.choa.fin;

import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.member.MemberService;
import com.choa.report.ReportService;

@Controller
@RequestMapping(value="/manager/**")
public class ManagerController {

	@Inject
	private ReportService reportService;
	@Inject
	private MemberService memberService;
	
	//매니저-판매 결산 페이지
	@RequestMapping(value="managerSell", method=RequestMethod.GET)
	public void managerSell(@RequestParam(defaultValue="1") int curPage,RedirectAttributes redirectAttributes,Model model) throws Exception{
		Map<String, Object> map=memberService.managerSellPage(curPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}
	
	
	@RequestMapping(value="managerReport", method=RequestMethod.GET)
	public void page(@RequestParam(defaultValue="1") int curPage,RedirectAttributes redirectAttributes,Model model){
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			map= reportService.reportList(curPage);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult",map.get("pageResult"));
		model.addAttribute("curPage",curPage);
	}
		
}