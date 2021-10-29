package com.sist.web;

import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.vo.*;
import com.sist.dao.*;

@RestController
@RequestMapping("mypage/")
public class MyPageRestController {
	@Autowired
	private MyPageDAO dao;
	
	// 장바구니 리스트
	@GetMapping(value="rest_cart_list.do", produces="text/plain;charset=UTF-8")
	public String rest_list(String userId) 
	{
		String json="";
		try {	
			Map map=new HashMap();
			map.put("userId", userId);
			List<MyPageVO> list=dao.cartList(map);//장바구니 목록
			int sumMoney=dao.cartSumMoney(userId);//금액 합계
			
			JSONArray arr=new JSONArray(); // List
			for(MyPageVO vo:list)
			{
				JSONObject obj=new JSONObject();
				obj.put("sumMoney", vo.getMoney());
				obj.put("count", list.size()); //레코드 갯수
				obj.put("list", list); //장바구니 목록 
			}
		}catch(Exception ex) {ex.printStackTrace();}
		return json;
	}
	
	// 장바구니 추가
	@PostMapping(value="rest_cart_insert.do", produces="text/plain;charset=UTF-8")
	public String rest_insert(Map map)
	{
		String json="";
		return json;
	}
}
