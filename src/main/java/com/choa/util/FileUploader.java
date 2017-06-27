package com.choa.util;

import java.io.File;
import java.util.UUID;


import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	public String fileUploader(MultipartFile multipartFile, String path)throws Exception{
		System.out.println("================================파일업로더시작");
		String fileName=multipartFile.getOriginalFilename();
		fileName=this.getFName(fileName);
		File f= new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		File file= new File(f, fileName);
		multipartFile.transferTo(file);
		return fileName;
	}
	
	
	private String getFName(String fileName){
		UUID uuid=UUID.randomUUID();
		return fileName=uuid.toString()+"_"+fileName;
	}
}
