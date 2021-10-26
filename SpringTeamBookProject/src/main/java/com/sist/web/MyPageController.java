package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MyPageController {
	@Autowired
	private MyPageDAO dao;
	
	@RequestMapping("mypage/cart.do")
	public String mypage_cart(Model model)
	{
		model.addAttribute("main_jsp", "../mypage/cart.do");
		return "main/main";
	}
}
