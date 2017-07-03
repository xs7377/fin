package com.choa.fin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/common/**")
public class CommonController {

	@RequestMapping(value="friendResult", method=RequestMethod.GET)
	public void result(){
	
	}
	
	
}
