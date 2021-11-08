package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {
	@Autowired
	private OrderDAO dao;
	
	@GetMapping("mypage/order_form.do")
	public String order_form(Model model, HttpSession session)
	{
		String user_id=(String)session.getAttribute("id");
		List<OrderFormVO> list=dao.orderFormListData(user_id);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../mypage/order_form.jsp");
		return "main/main";
	}
	
	@PostMapping("mypage/order_form_ok.do")
	public String order_form_ok(int book_no, int cart_qty, HttpSession session)
	{
		OrderVO vo=new OrderVO();
		OrderDetailVO dvo=new OrderDetailVO();
		String id=(String)session.getAttribute("id");
		vo.setUser_id(id);
		dvo.setBook_no(book_no);
		dvo.setCart_qty(cart_qty);
		dao.orderInfoInsert(vo);
		dao.orderDetailInsert(dvo);
		return "redirect:../mypage/order_form.do";
	}
	
	@PostMapping("mypage/order_insert_ok.do")
	public String order_insert_ok(int book_no, int amount, HttpSession session)
	{
		OrderFormVO vo=new OrderFormVO();
		String id=(String)session.getAttribute("id");
		vo.setUser_id(id);
		vo.setBook_no(book_no);
		vo.setAmount(amount); 
		dao.orderInsert(vo);
		return "redirect:../mypage/order_list.do";
	}
	
	@GetMapping("mypage/order_list.do")
	public String order_list(Model model,HttpSession session)
	{
		String user_id=(String)session.getAttribute("id");
		List<OrderFormVO> list=dao.orderFormListData(user_id);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
		return "main/main";
	}
	
	
}
