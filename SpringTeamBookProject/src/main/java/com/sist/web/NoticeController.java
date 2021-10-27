package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.mapper.*;

import java.text.SimpleDateFormat;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("noticeboard/")
public class NoticeController {
	@Autowired
	private NoticeDAO dao;
	
	@GetMapping("list.do")
	public String noticeboard_list(String page, Model model)
	{
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		
		List<NoticeVO> list=dao.NoticeBoardList(map);
		model.addAttribute("curpage", curpage);
		
		int totalpage=dao.NoticeTotalPage();
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("today", sdf.format(date));
		model.addAttribute("main_jsp", "../noticeboard/list.jsp");
		return "main/main";
	}
	
	
}
