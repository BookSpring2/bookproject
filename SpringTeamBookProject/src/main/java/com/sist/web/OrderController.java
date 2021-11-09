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
		List<OrderFormVO> olist=dao.orderFormListData(user_id);
		List<CartVO> clist=dao.cartListData(user_id);
		model.addAttribute("olist", olist);
		model.addAttribute("clist", clist);
		model.addAttribute("main_jsp", "../mypage/order_form.jsp");
		return "main/main";
	}
	
	@PostMapping("mypage/order_form_ok.do")
	public String order_form_ok(int book_no, int amount, HttpSession session)
	{
		OrderFormVO vo=new OrderFormVO();
		String id=(String)session.getAttribute("id");
		vo.setUser_id(id);
		vo.setBook_no(book_no);
		vo.setAmount(amount);
		dao.orderInsert(vo);
		return "redirect:../mypage/order_form.do";
	}
	
	@PostMapping("mypage/order_insert_ok.do")
	public String order_insert_ok(int book_no, int amount, HttpSession session)
	{
		OrderFormVO ovo=new OrderFormVO();
		CartVO cvo=new CartVO();
		String id=(String)session.getAttribute("id");
		ovo.setUser_id(id);
		ovo.setBook_no(book_no);
		ovo.setAmount(amount); 
		int camount=cvo.getCart_qty();
		Map map=new HashMap();
		map.put("book_no", book_no);
		map.put("user_id", id);
		map.put("userId", id);
		map.put("productId", book_no);
		int count=dao.orderCount(ovo);
		int ccount=dao.cartCount(cvo);
		if(count==0&&ccount==0) {
			dao.orderInsert(ovo);
		}
		else if(count!=0&&ccount==0)
		{
			dao.orderCountUpdate(ovo);
		}
		else if(count==0&&ccount!=0)
		{
			ovo.setAmount(amount+camount);
			dao.orderInsert(ovo);
		}
		else
		{
			ovo.setAmount(amount+camount);
			dao.orderCountUpdate(ovo);
		}
		return "redirect:../mypage/order_form.do";
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
