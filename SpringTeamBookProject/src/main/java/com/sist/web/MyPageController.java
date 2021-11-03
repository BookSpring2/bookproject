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
	
	@Autowired
	private OrderDAO odao;
	
	@RequestMapping("mypage/cart_list.do")
	public String cart_list(String userId, Model model, HttpSession session)
	{
		model.addAttribute("main_jsp","../member/join.jsp");
		Map map=new HashMap();
		MemberVO vo=(MemberVO)session.getAttribute(userId);
		String userid = vo.getUser_id();
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
	
//	@RequestMapping("mypage/order_list.do")
//	public String order_list(String user_id,Model model)
//	{
//		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
//		return "main/main";
//	}

//	@RequestMapping("mypage/order_list.do")
//	public String order_list(Model model)
//	{
//		Map map=new HashMap();
//		
//		List<OrderVO> list=odao.orderFormList(map);
//		List<OrderVO> mList=odao.orderMember(map);
//		model.addAttribute("list", list);
//		model.addAttribute("mList", mList);
//		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
//		return "main/main";
//	}
}