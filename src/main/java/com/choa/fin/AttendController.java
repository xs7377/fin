package com.choa.fin;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withCreatedEntity;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choa.attend.AttendService;

@Controller
@RequestMapping(value="/attend/**")
public class AttendController {

	@Inject
	private AttendService attendService;


	@RequestMapping(value="attendCheck",method=RequestMethod.GET)
	public String attendCheck(String m_id,RedirectAttributes redirectAttributes){
		String msg="출석 실패";
		int result=0;
		int check=0;
		try {
			check=attendService.attendCut(m_id);
			if(check==0){
				result=attendService.attendCheck(m_id);
				if(result>0){
					msg="누적 "+result+"일 출석 완료";
				}
				//누적 16일째되면 1일로 초기화
				if(result>15){
					result=attendService.attendReset(m_id);
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

		redirectAttributes.addFlashAttribute("msg",msg);

		return "redirect:/";
	}



}
