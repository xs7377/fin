package com.choa.fin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.javassist.bytecode.Mnemonic;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.message.MessageService;
import com.choa.report.ReportDTO;
import com.choa.report.ReportService;

@Controller
@RequestMapping(value="/report/**")
public class ReportController {

	
	@Inject
	private ReportService reportService;
	
	@Inject
	private MessageService messageService;
	
	
	@ResponseBody
	@RequestMapping(value="reportDelete", method=RequestMethod.POST)
	public String reportDel(int num){
		String msg="fail";
		
		try {
			int result=reportService.reportDelete(num);
			if(result>0){
				msg="success";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	
	//읽고 check 변경
	@ResponseBody
	@RequestMapping(value="reportRead", method=RequestMethod.POST)
	public String reportRead(int num,String from_id, String to_id){
		String msg="fail";
		System.out.println(from_id);
		Map<String , Object> map=new HashMap<String, Object>();
		map.put("from_id", from_id);
		System.out.println(map.get("from_id"));
		map.put("to_id", to_id);
		//몇 회 신고를 당했는지
		int count=0;
		
		
		try {
			count=reportService.reportCount(to_id);
			System.out.println("몇회 "+count);
			map.put("toMsg", count+1+"회 누적, 부적절한 게시글입니다.");
			System.out.println(map.get("toMsg"));
			int result=reportService.reportRead(num);
			System.out.println(result);
			if(result>0){
				result=messageService.messageReport(map);
				System.out.println("report후에"+result);
				if(result>0){
				msg="success";
				}else{
				reportService.reportRollback(num);
				System.out.println("롤백 됨.");
				}
			}
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return msg;
	}
	
	
	@RequestMapping(value="reportView", method=RequestMethod.GET)
	public void reportView(int num, Model model){
		ReportDTO reportDTO=new ReportDTO();
		
		try {
			reportDTO=reportService.reportView(num);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("reportDTO", reportDTO);
		
}
	

	
	@RequestMapping(value="reportReg",method=RequestMethod.POST)
	public String report(ReportDTO reportDTO, RedirectAttributes redirectAttributes){
		System.out.println("report 접수 ");
		
		String msg="이미 신고한 사람입니다.";
		
		try {
			if(reportService.reportCheck(reportDTO)==null){
				//null이면 from 이 to를 처음 신고
				reportService.report(reportDTO);
				msg="신고 완료";
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		redirectAttributes.addFlashAttribute("msg",msg);
		return "redirect:/";
	}
	
	
	//count to_id가 몇 번 신고당했는지
	@RequestMapping(value="reportCount", method=RequestMethod.GET)
	public void reportCount(String to_id){
		
		try {
			reportService.reportCount(to_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
}
