package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@Autowired
	private MainDAO dao;
	
	@RequestMapping("main/main.do")
	public String main_main(Model model)
	{
		List<BookVO> list=dao.MainTopListData();
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "main/main";
	}
	/* 책과 관련된 컨트롤러는 BookController 파트로 옮기겠습니다.
	 
	@RequestMapping("book/list.do")
	public String book_list(Model model)
	{
		model.addAttribute("main_jsp", "../book/list.jsp");
		return "main/main";
	}
		
	@RequestMapping("book/detail.do")
	public String book_detail(Model model)
	{
		model.addAttribute("main_jsp", "../book/detail.jsp");
		return "main/main";
	}
	*/
	@RequestMapping("blog/list.do")
	public String blog_list(Model model)
	{
		model.addAttribute("main_jsp", "../blog/list.jsp");
		return "main/main";
	}
	@RequestMapping("blog/detail.do")
	public String blog_detail(Model model)
	{
		model.addAttribute("main_jsp", "../blog/detail.jsp");
		return "main/main";
	}
	@RequestMapping("member/join.do")
	public String member_join(Model model)
	{
		model.addAttribute("main_jsp", "../member/join.jsp");
		return "main/main";
	}
}
