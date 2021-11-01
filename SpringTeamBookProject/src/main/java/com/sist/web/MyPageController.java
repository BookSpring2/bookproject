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
	
	@Autowired
	private OrderDAO odao;
	
	@RequestMapping("mypate/cart_list.do")
	public String cart_list(String user_id, Model model, HttpSession session)
	{
		Map map=new HashMap();
		MemberVO vo=(MemberVO)session.getAttribute(user_id);
		String userid = vo.getUser_id();
//		/* �α��� �Ǿ��ִ� ������ �̿��ؼ� userid�� �����´� */
//		CartVO cvo = new CartVO();
//		/* cart��ü�� �����ϰ�*/
//		CartVO.setUser_id(userid);
//		CartVO.setProductId(productId);
//		/* ��ü �ȿ� userid�� productId�� set���ش� */
//
//		boolean istAlreadyExisted = cartService.findCartGoods(cartDTO);
//        /* �̹� �ش� ��ǰ�� īƮ�� �����ϴ��� ���θ� �Ǻ����ִ� �޼��� */
//		System.out.println("istAlreadyExisted : " + istAlreadyExisted);
//		
//		if (istAlreadyExisted) {
//			return "already_existed";
//            /* ���� �̹� īƮ�� ����Ǿ��ִٸ�, already_existed�� ���� */
//		} else {
//            cartService.addGoodsInCart(cartDTO);
//			return "add_success";
//             /* īƮ�� ������ īƮ�� ���� ��, add_success�� ����  */
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

	@RequestMapping("mypage/order_list.do")
	public String order_list(Model model)
	{
		Map map=new HashMap();
		
		List<OrderVO> list=odao.orderFormList(map);
		List<OrderVO> mList=odao.orderMember(map);
		model.addAttribute("list", list);
		model.addAttribute("mList", mList);
		model.addAttribute("main_jsp", "../mypage/order_list.jsp");
		return "main/main";
	}
}