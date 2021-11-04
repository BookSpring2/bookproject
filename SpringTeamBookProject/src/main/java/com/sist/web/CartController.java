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
public class CartController {
	@Autowired
	private CartDAO dao;
	
	@Autowired
	private OrderDAO odao;
	
	@GetMapping("mypage/cart_list.do")
	public String cart_list(Model model, HttpSession session)
	{
		String userId=(String)session.getAttribute("id");
		List<CartVO> list=dao.cartListData(userId);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../mypage/cart_list.jsp");
		return "main/main";
	}
	
	@RequestMapping("mypage/cartcheck.do")
	@ResponseBody
	public String cart_check(HttpSession session, int productId)
	{
		String msg="";
		String userId=(String)session.getAttribute("id");
		CartVO vo=dao.findCartGoods(productId, userId);
		if (vo.getMsg().equals("already_existed")) {
			msg="already_existed";
		} else {
			msg="add_success";
		}
		//msg=vo.getMsg();
		return msg;
	}
	
	@PostMapping("mypage/cart_insert_ok.do")
	public String cart_insert_ok(int productId, int cart_qty, HttpSession session)
	{
		CartVO vo=new CartVO();
		String id=(String)session.getAttribute("id");
		vo.setUserId(id);
		vo.setProductId(productId);
		vo.setCart_qty(cart_qty);
		dao.cartInsert(vo);
		return "redirect:../mypage/cart_list.do";
	}
}