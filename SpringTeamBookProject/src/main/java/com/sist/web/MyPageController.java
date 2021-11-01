package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;

import java.security.Principal;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class MyPageController {
	@Autowired
	private CartDAO dao;
	
//	@Autowired
//	private OrderDAO odao;
	
	@RequestMapping("mypage/cart_list.do")
	public String cart_list(Model model)
	{
		model.addAttribute("main_jsp","../member/join.jsp");
		return "main/main";
	}
	
	@GetMapping("mypage/cartcheck.do")
	@ResponseBody
	public String cart_check(String userId, int productId)
	{
		String msg="";
		CartVO vo=dao.findCartGoods(userId, productId);
		if (vo.getMsg().equals("already_existed")) {
			msg="already_existed";
		} else {
			msg="add_success";
		}
		msg=vo.getMsg();
		return msg;
	}
	
	@PostMapping("mypage/cart_insert_ok.do")
	public String cart_insert_ok(CartVO vo)
	{
		dao.cartInsert(vo);
		return "redirect:../main/main.do";
	}
	
//	@RequestMapping("mypage/order_list.do")
//	public String order_list(String user_id,Model model)
//	{
//		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
//		return "main/main";
//	}

}
