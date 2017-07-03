package com.choa.file;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	public String saver(MultipartFile multipartFile ,String path) throws Exception{
		String fileName=multipartFile.getOriginalFilename();
		
		File f=new File(path);
		if(!f.exists()){
			f.mkdir();
		}
		fileName=this.fileNaming1(fileName);
		
		File file=new File(f, fileName);
		
		multipartFile.transferTo(file);
		
		return fileName;
	}
	
	public String fileNaming1(String fileName){
		UUID uuid=UUID.randomUUID();
		String fname=uuid.toString();
		String extension=fileName.substring(fileName.lastIndexOf("."));
		return fname+extension;
	}
	
	public String fileNaming2(String fileName){
		Calendar ca=Calendar.getInstance();
		long l=ca.getTimeInMillis();
		return l+"_"+fileName;
	}
	
	public void fileDelete(String path, String fname){
		File file=new File(path, fname);
		if(file.exists()){
			file.delete();
		}
	}

}
