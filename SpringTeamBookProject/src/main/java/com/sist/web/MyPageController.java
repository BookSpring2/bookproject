package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.*;
import java.util.*;

import javax.servlet.http.HttpSession;
@Controller
public class MyPageController {
	@Autowired 
	private CartDAO cdao;
	
	@Autowired 
	private OrderDAO odao;
	
	@GetMapping("mypage/mypage.do")
	public String mypage_list(Model model)
	{
		model.addAttribute("main_jsp", "../mypage/mypage.jsp");
		return "main/main";
	}
}
