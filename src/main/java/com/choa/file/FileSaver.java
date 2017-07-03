package com.choa.file;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {

	
	//파일명 만들때 시간 이용방법
	public String saver2(MultipartFile multipartFile, String path) throws Exception{
		String fileName=multipartFile.getOriginalFilename();
		fileName=this.getSaveName2(fileName);
		File f=new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		
		//2번째 방법 transferto 랑 요고 
		File file=new File(f,fileName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);

		
		return fileName;
	}
	private String getSaveName2(String fileName){
		Calendar ca=Calendar.getInstance();
		long l=ca.getTimeInMillis();
		
		return l+"_"+fileName;
	}
	
	
	public String saver(MultipartFile multipartFile, String path) throws Exception{//경로명과 이름만 주면 저장해 줄게.
		//1.리얼Path가 필요함.
		//2.실제저장할 파일명이 필요함 
		//실제 올라가는 파일
		String fileName=multipartFile.getOriginalFilename();
		fileName=this.getSavename(fileName);
		//파일 저장해야하는놈을 만들자.
		File f=new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		//(경로,파일명)
		File file=new File(f, fileName);
		//이제 저장하면 됨. 
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	//1. 파일을 hardDisk저장 할 때 중복되지 않는 파일 만들기 
	//UUID
	private String getSavename(String fileName){
		UUID uuid=UUID.randomUUID();
		return uuid.toString()+"_"+fileName;
	}
	
}
