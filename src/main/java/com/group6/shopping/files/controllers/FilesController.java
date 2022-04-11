package com.group6.shopping.files.controllers;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/files")
public class FilesController {
	
	private static final String FILE_SERVER_PATH = "C:\\yoyoyo22\\shoppingPj\\src\\main\\webapp\\resources\\static\\eventimg";

	@RequestMapping("/upload")
	public String upload(@RequestParam("board_content") MultipartFile file) throws Exception {
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
	}
		return "/boards/event";
	}
}
