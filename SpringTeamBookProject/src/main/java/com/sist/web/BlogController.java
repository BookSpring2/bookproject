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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		int rowSize=6;
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
	public String blog_insert_ok(BlogVO vo,HttpSession Session) throws Exception
	{
		String user_id=(String)Session.getAttribute("name");
		vo.setUser_id(user_id);
		String membership=(String)Session.getAttribute("membership");
		vo.setMembership(membership);
		String path="c:\\download\\";
		File dir=new File(path);
		
		if(!dir.exists())
		{
			dir.mkdir();
		}
		
		List<MultipartFile> list=vo.getFiles();
		
		String files="";
		String sizes="";
		String uuid = UUID.randomUUID().toString();
		if(list!=null && list.size()>0)
		{
			for(MultipartFile mf:list)
			{
				String fn=mf.getOriginalFilename();
				//File file=new File("c:\\download\\"+(uuid+"_"+fn));
				File file=new File(path+(uuid+"_"+fn));
				mf.transferTo(file);
				files+=((uuid+"_"+fn)+",");
				sizes+=file.length()+",";
			}
			vo.setImage(files.substring(0,files.lastIndexOf(",")));

		}
		else
		{
			vo.setImage("");
		}
		dao.BlogInsert(vo);
		return "redirect:../blog/list.do";
	}
	
	@GetMapping("detail.do")
	public String blog_detail(int no, int page, Model model,HttpSession session)
	{
		BlogVO vo=dao.BlogDetailData(no);
		String name=(String)session.getAttribute("name");
		vo.setUser_id(name);
		List<BlogReplyVO> list=dao.BlogReplyListData(no);
		
		model.addAttribute("list",list);
		model.addAttribute("vo", vo);
		model.addAttribute("curpage", page);
		model.addAttribute("main_jsp", "../blog/detail.jsp");
		return "main/main";
	}
	
	@GetMapping("update.do")
	public String blog_update(int no,int page,Model model)
	{
		model.addAttribute("no",no);
		model.addAttribute("page", page);
		BlogVO vo=dao.BlogDetailData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../blog/update.jsp");
		return "main/main";
	}
	
	@PostMapping("update_ok.do")
	public String blog_update_ok(int no,int page,BlogVO vo,Model model)
	{
		model.addAttribute("page", page);
		model.addAttribute("no", vo.getNo());
		
		dao.BlogUpdate(vo);
		return "redirect:../blog/detail.do";
	}
	
	@GetMapping("delete_ok.do")
	@ResponseBody
	public void blog_delete_ok(int no)
	{
		dao.BlogDelete(no);
	}
	
	
	
	@PostMapping("replyinsert.do")
    public String blogreply_insert(int page,BlogReplyVO vo,RedirectAttributes attr,HttpSession session)
    {
    	String id=(String)session.getAttribute("id");
    	String name=(String)session.getAttribute("name");
    	vo.setUser_id(id);
    	vo.setName(name);
    	dao.BlogReplyInsert(vo);
    	attr.addAttribute("no", vo.getBno());
    	attr.addAttribute("page", page);
    	return "redirect:../blog/detail.do"; 
    }
    @PostMapping("replyupdate.do")
    public String blogreply_update(BlogReplyVO vo,int page,RedirectAttributes attr)
    {
    	dao.BlogReplyUpdate(vo);
    	attr.addAttribute("no", vo.getBno());
    	attr.addAttribute("page", page);
    	return "redirect:../blog/detail.do";
    }
    @GetMapping("replydelete.do")
    public String blogreply_delete(int no,int bno,int page,RedirectAttributes attr)
    {
    	dao.BlogReplyDelete(no);
    	attr.addAttribute("no", bno);
    	attr.addAttribute("page", page);
    	return "redirect:../blog/detail.do";
    }
}
