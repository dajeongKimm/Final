package com.tje.service;

import org.springframework.stereotype.Service;

import com.tje.model.FileVo;

@Service
public class FileUploadService {

	public boolean saveFile(String path, FileVo file, String file_name) {
		boolean flag = file.saveFile(path, file_name);
		return flag;
	}
	
}
