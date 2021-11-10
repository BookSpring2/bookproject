package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
import java.util.*;
import com.sist.vo.*;

import javax.servlet.http.HttpSession;
@Controller
public class MyPageController {
	@Autowired 
	private CartDAO cdao;
	
	@Autowired 
	private OrderDAO odao;
	
	@Autowired
	private MyPageDAO dao;
	
	@RequestMapping("mypage/mypage")
	public String mypage_mypage(String user_id,Model model)
	{
		List<String> list=dao.memberListData(user_id);
		
		model.addAttribute("list", list);
		//model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		return "main/main";
	}

}
