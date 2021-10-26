package com.sist.web;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.BookVO;
import com.sist.dao.BookDAO;

@Controller
public class BookController {

	
	@Autowired
	private BookDAO dao;
	
	// 목록 페이지 :1026 틀만 만들어둠. 페이징 처리 해야함.
	@RequestMapping("book/list.do")
	public String book_list(Model model)
	{
		model.addAttribute("main_jsp", "../book/list.jsp");	
		
		List<BookVO> list = dao.bookBestListData();
		model.addAttribute("list", list);
		return "main/main";
	}
	// 상세 페이지 : 아직 건드리지 않음.
	@RequestMapping("book/detail.do")
	public String book_detail(Model model)
	{
		model.addAttribute("main_jsp", "../book/detail.jsp");
		return "main/main";
	}

}
