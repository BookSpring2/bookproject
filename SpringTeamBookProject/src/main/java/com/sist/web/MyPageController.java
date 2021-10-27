package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MyPageController {
	@Autowired
	private MyPageDAO dao;
	
	@RequestMapping("mypage/insert.do")
	public String insert(Model model)
	{
		model.addAttribute("main_jsp", "../mypage/insert.do");
		return "redirect:../cart/list.do";
	}
	
	@RequestMapping("mypage/list.do")
	public String list(String userId, Model model) 
	{
		Map map=new HashMap();
        int sumMoney=dao.cartSumMoney(userId);//금액 합계
        int fee=sumMoney >= 30000 ? 0 : 2500; 
            
        //배송료 계산
        //30000원이 넘으면 배송료가 0원, 안넘으면 2500원
            
        //hasp map에 장바구니에 넣을 각종 값들을 저장함
        map.put("sumMoney", sumMoney);
        map.put("fee", fee); //배송료
        map.put("sum", sumMoney+fee); //전체 금액
        List<MyPageVO> list=dao.cartList(map);//장바구니 목록
        map.put("list", list); //장바구니 목록
        map.put("count", list.size()); //레코드 갯수

        //ModelAndView mav에 이동할 페이지의 이름과 데이터를 저장한다.

        model.addAttribute("map", map);
        model.addAttribute("main_jsp", "../mypage/list.jsp"); //이동할 페이지의 이름
        
		return "main/main";
	}
}
