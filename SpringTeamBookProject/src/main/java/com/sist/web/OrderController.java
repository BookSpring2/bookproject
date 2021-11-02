package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
	@Autowired
	private OrderDAO dao;
	
	@GetMapping("mypage/order_list.do")
	public String order_list(HttpSession session,Model model)
	{
		String user_id=(String)session.getAttribute("user_id");
		List<OrderFormVO> list=dao.orderListData(user_id);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
		return "main/main";
	}
}
