package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MyPageController {
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private OrderDAO odao;
	
	@RequestMapping("mypage/cart_list.do")
	public String list(String userId, Model model) 
	{
		model.addAttribute("main_jsp", "../mypage/cart_list.jsp"); 
		return "main/main";
	}
	
	@RequestMapping("mypage/cart_insert.do")
	public String insert(Model model)
	{
		model.addAttribute("main_jsp", "../mypage/cart_insert.do");
		return "redirect:../cart/list.do";
	}
	
	@RequestMapping("mypage/order_list.do")
	public String order_list(String user_id,Model model)
	{
		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
		return "main/main";
	}

}
