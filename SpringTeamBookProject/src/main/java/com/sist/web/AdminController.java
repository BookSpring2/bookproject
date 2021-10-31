package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminDAO dao;
	
	@RequestMapping("/main.do")
	public String main(Model model){
		model.addAttribute("main_jsp", "../admin/main.jsp");
		return "main/main";
	}
	
	@RequestMapping("/memberList.do")
	public String member_list(Model model)
	{
		Map map=new HashMap();
		List<MemberVO> list=dao.memberListData(map);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../admin/memlerList.jsp");
		return "main/main";
	}
}
