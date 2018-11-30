package com.tje.model;

import java.io.*;
import org.springframework.web.multipart.MultipartFile;

public class FileVo {

	private MultipartFile file;

	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
	public boolean saveFile(String path, String file_name) {
		
		boolean flag = true;
		File dir = new File(path);
		
		if( !dir.exists() )
			dir.mkdirs();
		
		File f = new File(dir, file_name);
		
		
		try {
			file.transferTo(f);
		}catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}
		
		return flag;
	}
}
