package com.choa.fin;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choa.photo.PhotoDTO;


@Controller
@RequestMapping(value="/file/**")
public class FileController {
	//SE2 파일전송
	@RequestMapping(value="/se2")
	public String upload(PhotoDTO photoDTO, HttpSession session){
		
		String callback=photoDTO.getCallback();
		String callback_func=photoDTO.getCallback_func();
		String file_result="";
		try {
			if(photoDTO.getFiledata() != null && photoDTO.getFiledata().getOriginalFilename()!=null && !photoDTO.getFiledata().getOriginalFilename().equals("")){
				//파일이 존재하면
				String original_name=photoDTO.getFiledata().getOriginalFilename();
				//확장자
				String ext= original_name.substring(original_name.lastIndexOf(".")+1);
				//파일 기본경로
				//String defaultPath=session.getServletContext().getRealPath("resources/upload");
				String defaultPath=session.getServletContext().getRealPath("/"); //운영체제에 따라 달라질수있으므로 seperator 사용
				String path=defaultPath+"resources"+File.separator+"upload"+File.separator;
				File file=new File(path);
				if(!file.exists()){
					file.mkdirs();
				}
				//서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
				String realname=UUID.randomUUID().toString()+"."+ext;
				///////////////// 서버에 파일쓰기 ///////////////// 
				photoDTO.getFiledata().transferTo(new File(path,realname));
				file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/fin/resources/upload/"+realname;
			}else{
				file_result += "&errstr=error";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("redirect:" + callback + "?callback_func="+callback_func+file_result);
		return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
}
