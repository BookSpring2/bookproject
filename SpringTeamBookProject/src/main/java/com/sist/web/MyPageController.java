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
@Controller
public class MyPageController {
	@Autowired
	private CartDAO dao;
	
//	@Autowired
//	private OrderDAO odao;
	
	@RequestMapping("mypate/cart_list.do")
	public String cart_list(String user_id, Model model, HttpSession session)
	{
		Map map=new HashMap();
		MemberVO vo=(MemberVO)session.getAttribute(user_id);
		String userid = vo.getUser_id();
//		/* 로그인 되어있는 정보를 이용해서 userid를 가져온다 */
//		CartVO cvo = new CartVO();
//		/* cart객체를 생성하고*/
//		CartVO.setUser_id(userid);
//		CartVO.setProductId(productId);
//		/* 객체 안에 userid와 productId를 set해준다 */
//
//		boolean istAlreadyExisted = cartService.findCartGoods(cartDTO);
//        /* 이미 해당 상품이 카트에 존재하는지 여부를 판별해주는 메서드 */
//		System.out.println("istAlreadyExisted : " + istAlreadyExisted);
//		
//		if (istAlreadyExisted) {
//			return "already_existed";
//            /* 만약 이미 카트에 저장되어있다면, already_existed를 리턴 */
//		} else {
//            cartService.addGoodsInCart(cartDTO);
//			return "add_success";
//             /* 카트에 없으면 카트에 저장 후, add_success를 리턴  */
//		}
		model.addAttribute("main_jsp", "../mypage/cart_list.jsp");
		return "main/main";
	}
	
//	@RequestMapping("mypage/order_list.do")
//	public String order_list(String user_id,Model model)
//	{
//		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
//		return "main/main";
//	}

}
