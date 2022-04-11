package com.group6.shopping.boards.controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group6.shopping.boards.services.BoardsService;
import com.group6.shopping.boards.vo.BoardsVO;
import com.group6.shopping.boards.vo.EventPagingVO;
import com.group6.shopping.files.vo.FilesVO;

@Controller
@RequestMapping("/boards")
public class BoardsController {
	@Autowired
	private BoardsService boardsService;

	@RequestMapping("/viewBoard")
	public String viewBoard(String board_id, Model models) throws Exception {
		BoardsVO boardsVO = boardsService.viewBoard(board_id);


		if(boardsVO.getRepliesVOList().size() > 0){
			models.addAttribute("rep_id",
					boardsVO.getRepliesVOList().get(boardsVO.getRepliesVOList().size() - 1).getReply_id());
		}
		models.addAttribute("boardsVO", boardsVO);
		return "/boards/board";

	}

	// 이벤트 메인페이지 진행중게시글 목록조회
	@GetMapping("/event")
	public String EventBoardslist(EventPagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		int total = boardsService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "6";
		}
		vo = new EventPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("eventboardlist", boardsService.EventBoardslist(vo));
		return "boards/event";
	}

	// 이벤트 메인페이지 종료게시글 목록조회
	@GetMapping("/endevent")
	public String EndEventBoardslist(EventPagingVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {

		int total = boardsService.endcountBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "6";
		}
		vo = new EventPagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("endeventboardlist", boardsService.EndEventBoardslist(vo));
		return "boards/endevent";
	}

	// 게시글 보기
	@RequestMapping(value = "/readView")
	public String read(BoardsVO boardsVO, Model model) throws Exception {
		model.addAttribute("read", boardsService.read(boardsVO.getBoard_id()));
		System.out.println(boardsVO);
		return "boards/readView";
	}

	// 이벤트 글쓰는거 페이지
	@RequestMapping(value = "/eventinsertView")
	public String eventinsertView(BoardsVO boardsVO, Model model) throws Exception {
		return "boards/eventinsertView";
	}

	// 이벤트 글쓰기
	@RequestMapping(value = "/eventinsert")
	public String eventinsert(@RequestParam("board_titleimg2") MultipartFile file,@RequestParam("board_content2") MultipartFile file2, BoardsVO boardsVO,
			RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		if (!file.getOriginalFilename().isEmpty()) {
			// 웹서비스 root 경로​
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path = root_path + "resources/static/eventmainimg/";
			System.out.println("************path2 : " + root_path + attach_path);
			String originFile = file.getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			File upchangeFile = new File(attach_path + changeFile);
			try {
				file.transferTo(upchangeFile);
				boardsVO.setBoard_titleimg(changeFile);
				System.out.println(changeFile);
			} catch (IOException e) {

			}

		}
		if (!file2.getOriginalFilename().isEmpty()) {
			// 웹서비스 root 경로​
			String root_path2 = request.getSession().getServletContext().getRealPath("/");
			String attach_path2 = root_path2 + "resources/static/eventimg/";
			System.out.println("************path2 : " + root_path2 + attach_path2);
			String originFile2 = file2.getOriginalFilename();
			String ext2 = originFile2.substring(originFile2.lastIndexOf("."));
			String changeFile2 = UUID.randomUUID().toString() + ext2;
			File upchangeFile2 = new File(attach_path2 + changeFile2);
			try {
				file2.transferTo(upchangeFile2);
				boardsVO.setBoard_content(changeFile2);
				System.out.println(changeFile2);
			} catch (IOException e) {

			}

		}
		boardsService.eventinsert(boardsVO);
		return "redirect:" + boardsVO.getBoard_type();
	}

	// 리뷰글쓰기 뷰페이지
	@RequestMapping(value = "/insertView")
	public String insertView(BoardsVO boardsVO, Model model) throws Exception {
		System.out.println("/insertView");
		System.out.println(boardsVO);
		return "boards/insertView";
	}

	@RequestMapping(value = "/reviewinsert")
	public String insert(@RequestParam("file_name2") List<MultipartFile> file, BoardsVO boardsVO, FilesVO filesVO,
			RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		System.out.println(file);
		// 웹서비스 root 경로​
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = root_path + "resources/static/eventimg/";
		System.out.println("************path2 : " + root_path + attach_path);

		List<Map<String, String>> fileList = new ArrayList<>();

		for (int i = 0; i < file.size(); i++) {
			String originFile = file.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;

			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);

			fileList.add(map);
		}

		try {
			for (int i = 0; i < file.size(); i++) {
				File uploadFile = new File(attach_path + fileList.get(i).get("changeFile"));
				file.get(i).transferTo(uploadFile);
				filesVO.setFile_name(fileList.get(i).get("changeFile"));

			}

		} catch (IllegalStateException | IOException e) {
			System.out.println("실패");
		}

		boardsService.reviewinsert(boardsVO, filesVO);
		System.out.println(boardsVO);
		System.out.println(filesVO);
		return "boards/insertView";
		/* return "redirect:" + boardsVO.getBoard_type(); */
	}

	// 이벤트 글 삭제
	@RequestMapping(value = "/delete")
	public String delete(BoardsVO boardsVO, RedirectAttributes rttr) throws Exception {

		boardsService.delete(boardsVO.getBoard_id());
		return "redirect:" + boardsVO.getBoard_type();
	}

}
