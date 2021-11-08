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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class CartController {
	@Autowired
	private CartDAO dao;
	
	@GetMapping("mypage/cart_list.do")
	public String cart_list(Model model, HttpSession session)
	{
		String userId=(String)session.getAttribute("id");
		List<CartVO> list=dao.cartListData(userId);
		int sumMoney=dao.cartSumCount(userId);
		int fee=sumMoney>=5000?0:2500;
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		model.addAttribute("sumMoney", sumMoney);
		model.addAttribute("fee", fee);
		model.addAttribute("allSum", sumMoney+fee);
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
	
	@RequestMapping("mypage/cart_insert_ok.do")
	public String cart_insert_ok(int productId, int cart_qty, HttpSession session)
	{
		CartVO vo=new CartVO();
		String userId=(String)session.getAttribute("id");
		vo.setUserId(userId);
		vo.setProductId(productId);
		vo.setCart_qty(cart_qty);
		Map map=new HashMap();
		map.put("productId", productId);
		map.put("userId", userId);
		// 기존 상품 검사
		int count=dao.cartCount(vo);
		if(count==0) {
			dao.cartInsert(vo);
		}
		else
		{
			dao.cartCountUpdate(vo);
		}
		return "redirect:../mypage/cart_list.do";
	}
	
	@GetMapping("mypage/cart_delete.do")
	public String cart_delete(int no)
	{
		dao.cartDelete(no);
		return "redirect:../mypage/cart_list.do";
	}
	
	@RequestMapping("mypage/cart_update.do")
	public String cart_update(HttpSession session, @RequestParam int[] cart_qty, @RequestParam int[] productId)
	{
		String userId=(String)session.getAttribute("id");
		for(int i=0; i<productId.length; i++) {
			CartVO vo=new CartVO();
			vo.setUserId(userId);
			vo.setCart_qty(cart_qty[i]);
			vo.setProductId(productId[i]);
			dao.cartUpdate(vo);
		}
		return "redirect:../mypage/cart_list.do";
	}
}