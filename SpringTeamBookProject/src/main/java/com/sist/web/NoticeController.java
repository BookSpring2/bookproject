package com.sist.web;
import com.sist.dao.*;
import com.sist.vo.*;
import java.io.*;
import java.net.URLEncoder;

import com.sist.mapper.*;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
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
		int totalpage=dao.NoticeTotalPage();
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
		model.addAttribute("main_jsp", "../noticeboard/list.jsp");
		return "main/main";
	}
	
	@GetMapping("insert.do")
	public String noticeboard_insert(Model model,HttpSession session)
	{
		NoticeVO vo=new NoticeVO();
		vo.setName((String)session.getAttribute("name"));		
		model.addAttribute("main_jsp", "../noticeboard/insert.jsp");
		return "main/main";
	}
	
	@PostMapping("insert_ok.do")
	public String noticeboard_insert_ok(NoticeVO vo) throws Exception
	{
		String path="C:\\Users\\jyh91\\git2\\git2\\SpringTeamBookProject\\src\\main\\webapp\\resources\\noticeboardimage\\";
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
			vo.setImagename(files.substring(0,files.lastIndexOf(",")));
			vo.setImagesize(sizes.substring(0,sizes.lastIndexOf(",")));
			vo.setImagecount(list.size());
		}
		else
		{
			vo.setImagename("");
			vo.setImagesize("");
			vo.setImagecount(0);
		}
		dao.NoticeBoardInsert(vo);
		return "redirect:../noticeboard/list.do";
	}
	
	@GetMapping("detail.do")
	public String noticeboard_detail(int no,int page,Model model)
	{
		NoticeVO vo=dao.NoticeDetailData(no);
		
		if(vo.getImagecount()>0)
		{
			List<String> fList=new ArrayList<String>();
			List<String> sList=new ArrayList<String>();
			
			StringTokenizer st=new StringTokenizer(vo.getImagename(),",");
			while(st.hasMoreTokens())
			{
				fList.add(st.nextToken());
			}
			
			st=new StringTokenizer(vo.getImagesize(),",");
			while(st.hasMoreTokens())
			{
				sList.add(st.nextToken());
			}
			model.addAttribute("fList",fList);
			model.addAttribute("sList",sList);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("curpage", page);
		model.addAttribute("main_jsp", "../noticeboard/detail.jsp");
		return "main/main";
	}
	
	
	@GetMapping("update.do")
	public String noticeboard_update(int no,int page,Model model)
	{
		model.addAttribute("no",no);
		model.addAttribute("page", page);
		NoticeVO vo=dao.NoticeDetailData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../noticeboard/update.jsp");
		return "main/main";
	}
	
	@PostMapping("update_ok.do")
	public String noticeboard_update_ok(int no,int page,NoticeVO vo,Model model)
	{
		model.addAttribute("page", page);
		model.addAttribute("no", vo.getNo());
		dao.NoticeBoardUpdate(vo);
		return "redirect:../noticeboard/detail.do";
	}
	
	@GetMapping("delete.do")
	public String noticeboard_delete(int no,int page,Model model)
	{
		model.addAttribute("no", no);
		model.addAttribute("page", page);
		NoticeVO vo=dao.NoticeDetailData(no);
		model.addAttribute("vo", vo);
		model.addAttribute("main_jsp", "../noticeboard/delete.jsp");
		return "main/main";
	}
	
	@PostMapping("delete_ok.do")
	public String noticeboard_delete_ok(int no,int page)
	{
		dao.NoticeBoardDelete(no);
		return "redirect:../noticeboard/list.do";
	}
}
