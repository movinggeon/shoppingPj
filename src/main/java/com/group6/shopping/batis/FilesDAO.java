package com.group6.shopping.batis;

import com.group6.shopping.files.vo.FilesVO;

public interface FilesDAO {
	
	//리뷰 게시글 파일등록
    public void reviewFile(FilesVO fvo) throws Exception;
    
    public void deleteFile(int board_id) throws Exception;
    public void reviewFileUpdate(FilesVO fvo) throws Exception;
    
    
}
