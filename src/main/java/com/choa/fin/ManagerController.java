package com.choa.fin;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.report.ReportDTO;
import com.choa.report.ReportService;

@Controller
@RequestMapping(value="/manager/**")
public class ManagerController {

	@Inject
	private ReportService reportService;
	
	
	@RequestMapping(value="managerPage", method=RequestMethod.GET)
	public void page(@RequestParam(defaultValue="1") int curPage,RedirectAttributes redirectAttributes,Model model){
		List<ReportDTO> ar=new ArrayList<ReportDTO>();
	
		try {
			ar=reportService.reportList(curPage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//redirectAttributes.addFlashAttribute("list", ar);
		model.addAttribute("list", ar);
		
	}
	
}
