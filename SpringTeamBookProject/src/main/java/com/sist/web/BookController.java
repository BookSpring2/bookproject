package com.sist.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.BookVO;
import com.sist.dao.BookDAO;

@Controller
public class BookController {

	
	@Autowired
	private BookDAO dao;
 
	/*
	// 목록 페이지 
	@RequestMapping("bookBestList/list.do") 
	public String bookBestList_list(HttpServletRequest request,HttpServletResponse response) 
	{
		
		List<BookVO> list=dao.bookListData();
		request.setAttribute("bestlist", list);
		return "book/bestlist"; 
	}
	
	// 상세보기 페이지 
	@RequestMapping("book/detail.do")
	public String book_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		BookVO vo=dao.bookDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		return "book/detail"; 
	}
	*/
}
