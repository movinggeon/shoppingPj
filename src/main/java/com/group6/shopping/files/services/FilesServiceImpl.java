package com.group6.shopping.files.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group6.shopping.batis.BoardsDAO;
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
}
