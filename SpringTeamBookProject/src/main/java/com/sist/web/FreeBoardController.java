package com.sist.web;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.FreeBoardDAO;
import com.sist.vo.FreeBoardVO;

import java.io.*;
import java.net.URLEncoder;

@Controller
@RequestMapping("freeboard/")
public class FreeBoardController {
	@Autowired
	private FreeBoardDAO dao;
	
	// 리스트 출력
	@RequestMapping("list.do")
	public String board_list(String page,Model model)
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
		List<FreeBoardVO> list=dao.freeBoardList(map);
		int totalpage=dao.freeBoardTotalPage();
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("BLOCK", BLOCK);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("list", list);
		model.addAttribute("main_jsp", "../freeboard/list.jsp");				
		return "main/main";
	}

	// 데이터 입력
	@GetMapping("insert.do")
	public String board_insert(Model model) {
		model.addAttribute("main_jsp", "../freeboard/insert.jsp");
		return "main/main";
	}

	@PostMapping("insert_ok.do")
	public String board_insert_ok(FreeBoardVO vo) throws Exception {
		File dir = new File("c:\\download"); // 일단 만듬
		if (!dir.exists()) {
			dir.mkdir();
		}
		List<MultipartFile> list = vo.getFiles();
		String files = "";
		String sizes = "";
		if (list != null && list.size() > 0) {
			for (MultipartFile mf : list) {
				String fn = mf.getOriginalFilename();
				File file = new File("c:\\download\\" + fn); // C:\\Users\\admin\\Downloads
				mf.transferTo(file);
				files += fn + ",";
				sizes += file.length() + ",";
			}
			vo.setFilename(files.substring(0, files.lastIndexOf(",")));
			vo.setFilesize(sizes.substring(0, sizes.lastIndexOf(",")));
			vo.setFilecount(list.size());
		} else {
			vo.setFilename("");
			vo.setFilesize("");
			vo.setFilecount(0);
		}
		
		dao.freeBoardInsert(vo);
		return "redirect:../freeboard/list.do";
	}

	@GetMapping("download.do")
	public void download(String fn, HttpServletResponse response) {
		try {
			String path = "C:\\Users\\\\admin\\Downloads";
			File file = new File(path + "\\" + fn);
			response.setContentLength((int) file.length());
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fn, "UTF-8"));
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buffer = new byte[1024];
			int i = 0;
			while ((i = bis.read(buffer, 0, 1024)) != -1) {
				bos.write(buffer, 0, i);
			}
			bis.close();
			bos.close();
		} catch (Exception ex) {
		}
	}

	// 상세보기
	@GetMapping("detail.do")
	public String detail(int no, int page, Model model) {
		FreeBoardVO vo = dao.freeBoardDetail(no);
		// 파일이 2개 이상일때
		if(vo.getFilecount()>0) 
    	{
	    	List<String> fList=new ArrayList<String>();
	    	List<String> sList=new ArrayList<String>();
	    	
	    	StringTokenizer st1=new StringTokenizer(vo.getFilename(),",");
	    	while(st1.hasMoreTokens())
	    	{
	    		fList.add(st1.nextToken());
	    	}
	    	
	    	st1=new StringTokenizer(vo.getFilesize(),",");
	    	while(st1.hasMoreTokens())
	    	{
	    		sList.add(st1.nextToken());
	    	}
	    	model.addAttribute("fList", fList);
	    	model.addAttribute("sList", sList);
    	}
		model.addAttribute("vo", vo);
		model.addAttribute("page", page);
		model.addAttribute("main_jsp", "../freeboard/detail.jsp");
		return "main/main";
	}

}
