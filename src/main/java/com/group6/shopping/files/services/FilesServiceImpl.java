package com.group6.shopping.files.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.FilesDAO;
import com.group6.shopping.files.vo.FilesVO;

@Service
public class FilesServiceImpl implements FilesService {
	
	
	@Autowired
	private FilesDAO filesDAO;
	
	
	@Override
	public void reviewFile(FilesVO fvo) throws Exception {
		filesDAO.reviewFile(fvo);
	}
	
	@Override
	public void deleteFile(int board_id) throws Exception {
		filesDAO.deleteFile(board_id);
		
	}
		
		@Override
		public void reviewFileUpdate(FilesVO fvo) throws Exception {
			filesDAO.reviewFileUpdate(fvo);
	
}
}
