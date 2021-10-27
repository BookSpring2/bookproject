package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.dao.*;
@Controller
public class ShopController {
	@Autowired
	private ShopDAO dao;
	
	@RequestMapping("shop/shop_main.do")
	public String shop_main(Model model) {
		
		model.addAttribute("main_jsp", "../shop/shop_main.jsp");
		return "main/main";
	}
}
