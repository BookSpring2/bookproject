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
	
//	@GetMapping("mypage/order_form.do")
//	public String order_form(Model model, HttpSession session)
//	{
//		String user_id=(String)session.getAttribute("id");
//		List<OrderFormVO> list=dao.orderFormListData(user_id);
//		model.addAttribute("list", list);
//		model.addAttribute("main_jsp", "../mypage/order_form.jsp");
//		return "main/main";
//	}
//	
//	@PostMapping("mypage/order_form_ok.do")
//	public String order_form_ok(int book_no, int amount, HttpSession session)
//	{
//		OrderFormVO vo=new OrderFormVO();
//		String id=(String)session.getAttribute("id");
//		vo.setUser_id(id);
//		vo.setBook_no(book_no);
//		vo.setAmount(amount);
//		dao.orderInsert(vo);
//		return "redirect:../mypage/order_form.do";
//	}
//	
//	@PostMapping("mypage/order_insert_ok.do")
//	public String order_insert_ok(int book_no, int amount, HttpSession session)
//	{
//		OrderFormVO vo=new OrderFormVO();
//		String id=(String)session.getAttribute("id");
//		vo.setUser_id(id);
//		vo.setBook_no(book_no);
//		vo.setAmount(amount); 
//		Map map=new HashMap();
//		map.put("book_no", book_no);
//		map.put("user_id", id);
//		int count=dao.orderCount(vo);
//		if(count==0) {
//			dao.orderInsert(vo);
//		}
//		else
//		{
//			dao.orderCountUpdate(vo);
//		}
//		return "redirect:../mypage/order_form.do";
//	}
//	
//	@GetMapping("mypage/order_list.do")
//	public String order_list(Model model,HttpSession session)
//	{
//		String user_id=(String)session.getAttribute("id");
//		List<OrderFormVO> list=dao.orderFormListData(user_id);
//		model.addAttribute("list", list);
//		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
//		return "main/main";
//	}
	
	@GetMapping("mypage/order_form.do")
	public String cart_list(Model model, HttpSession session)
	{
		String userId=(String)session.getAttribute("id");
		List<CartVO> list=dao.orderListData(userId);
		List<MemberVO> mlist=dao.userData(userId);
		model.addAttribute("list", list);
		model.addAttribute("mlist", mlist);
		model.addAttribute("main_jsp", "../mypage/order_form.jsp");
		return "main/main";
	}
	 
	
	@RequestMapping("mypage/order_form_ok.do")
	public String cart_insert_ok(int book_no, int amount, HttpSession session)
	{
		CartVO vo=new CartVO();
		String userId=(String)session.getAttribute("id");
		vo.setUserId(userId);
		vo.setProductId(book_no);
		vo.setCart_qty(amount);
		Map map=new HashMap();
		map.put("productId", book_no);
		map.put("userId", userId);
		// 기존 상품 검사
		int count=dao.orderCount(vo);
		if(count==0) {
			dao.orderInsert(vo);
		}
		else
		{
			dao.orderCountUpdate(vo);
		}
		return "redirect:../mypage/order_form.do";
	}
	
	@GetMapping("mypage/order_delete.do")
	public String cart_delete(int no)
	{
		dao.orderDelete(no);
		return "redirect:../mypage/order_form.do";
	}
	
	@PostMapping("order_pay_insert_ok")
	public String order_pay_insert_ok()
	{
		return "";
	}
}
