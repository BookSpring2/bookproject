package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.NoticeVO;
import com.sist.vo.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("blog/")
public class BlogController {
	@Autowired
	private BlogDAO dao;
	
	@GetMapping("list.do")
	public String blog_list(String page, Model model)
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
		List<BlogVO> list=dao.BlogList(map);
		
		for(BlogVO vo:list)
		  {
			  String s=vo.getContent();
			  if(s.length()>50)
			  {
				  s=s.substring(0,50)+"...";
				  vo.setContent(s);
			  }
		  }
			
		int totalpage=dao.BlogTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("today", sdf.format(date));
		model.addAttribute("main_jsp", "../blog/list.jsp");
		return "main/main";
	}
	
	@GetMapping("insert.do")
	public String blog_insert(Model model,HttpSession session)
	{
		BlogVO vo=new BlogVO();		
		model.addAttribute("main_jsp", "../blog/insert.jsp");
		return "main/main";
	}
	
	@PostMapping("insert_ok.do")
	public String blog_insert_ok(BlogVO vo,HttpSession Session)
	{
		String user_id=(String)Session.getAttribute("name");
		vo.setUser_id(user_id);
		dao.BlogInsert(vo);
		return "redirect:../blog/list.do";
	}
}
