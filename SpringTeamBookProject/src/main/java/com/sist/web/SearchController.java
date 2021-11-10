package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class SearchController {
	@Autowired
	private SearchDAO dao;
	
	@GetMapping("#")
	public String book_title(String page,String ss,Model model)
	{
		if(ss==null)
			ss="꿈";
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		
		map.put("start", start);
		map.put("end", end);
		map.put("address", ss);
		
		List<BookVO> list=dao.bookTitleSearchData(map);
		int totalpage=dao.bookTitleTotalPage(ss);
		
		model.addAttribute("list", list);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("curpage", curpage);
		return "#";
	}
}
