package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("main/main.do")
	public String main_main(Model model)
	{
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "main/main";
	}
	@RequestMapping("book/list.do")
	public String book_list(Model model)
	{
		model.addAttribute("main_jsp", "../book/list.jsp");
		return "main/main";
	}
	
	/**/
	@RequestMapping("book/detail.do")
	public String book_detail(Model model)
	{
		model.addAttribute("main_jsp", "../book/detail.jsp");
		return "main/main";
	}
	
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
