package com.group6.shopping.files.services;

import com.group6.shopping.files.vo.FilesVO;

public interface FilesService {
	 public void reviewFile(FilesVO fvo) throws Exception;
	 public void deleteFile(int board_id) throws Exception;
	 public void reviewFileUpdate(FilesVO fvo) throws Exception;
}
