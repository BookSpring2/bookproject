package com.sist.web;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.vo.BookCommentVO;
import com.sist.vo.BookVO;
import com.sist.dao.BookDAO;

@Controller
public class BookController {

	
	@Autowired
	private BookDAO dao;
	
	// 베스트 셀러 목록 출력
	@RequestMapping("book/list.do")
	public String book_list(String page, Model model, HttpServletRequest request)
	{
		
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=(rowSize*curpage);
		map.put("start", start);
		map.put("end", end);
		List<BookVO> list=dao.bookBestListData(map);
		// 총페이지 
		    map.put("table_name", "book_data");
			int totalpage=dao.bookTotalPage(map);
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
		model.addAttribute("main_jsp", "../book/list.jsp");				
		return "main/main";
		
	}
	// 베스트셀러 상세페이지.
	@RequestMapping("book/detail.do")
	public String book_detail(int bno, Model model) {

		//상세 데이터 출력
		BookVO vo = dao.bookDetailData(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("bno", bno);	
		model.addAttribute("main_jsp", "../book/detail.jsp");
		return "main/main";
	}
	
	
	
	
	
			// 신간 목록 출력
			@RequestMapping("book/newlist.do")
			public String book_newlist(String page, Model model)
			{
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("cate", "");
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				//Map map=new HashMap();
				int rowSize=12;
				int start=(rowSize*curpage)-(rowSize-1);
				int end=(rowSize*curpage);
				map.put("start", start);
				map.put("end", end);
				List<BookVO> list=dao.bookNewListData(map);
				// 총페이지 
				    map.put("table_name", "book_data");
					int totalpage=dao.bookTotalPage(map);
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK*BLOCK)+1;
				int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				if(endPage>totalpage)
					endPage=totalpage;
				
				List<BookVO> saleslist2=dao.bookNewListData_SalesRandom(map);//상단부, 판매중인 도서.
				
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage",totalpage);
				model.addAttribute("BLOCK", BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("list", list);
				model.addAttribute("saleslist", saleslist2);
				model.addAttribute("main_jsp", "../book/newlist.jsp");				
				return "main/main";
				
			}
			
			/* 카테고리 선택 - 목록출력*/			
			@RequestMapping("book/newlistSelectCate.do")
			 public String book_menu_category(String page, Model model, Integer select, String form) {
				HashMap<String, Object> map=new HashMap<String, Object>();
				
				//가격 선택
				String price = form;
				if(price!=null) {
					System.out.println("price는"+price+"입니다.");
				}
				
				//카테고리 선택
				if(select==null) {
					select=999;
					System.out.println("선택된 카테고리가 없습니다.");
				}
				
				int whatCate = select;	
				//System.out.println("whatCate에 들어간 값은"+whatCate+"입니다.");
				if(whatCate==1) {
					System.out.println("카테고리는 소설입니다.");
					map.put("cate", "소설");
				}
				else if(whatCate==2){
					System.out.println("카테고리는 시/에세이입니다.");
					map.put("cate", "시/에세이");
				}
				else if(whatCate==3){
					System.out.println("카테고리는 인문입니다.");
					map.put("cate", "인문");
				}
				else if(whatCate==4){
					System.out.println("카테고리는 사회과학입니다.");
					map.put("cate", "사회과학");
				}
				else if(whatCate==5){
					System.out.println("카테고리는 예술/대중문화입니다.");
					map.put("cate", "예술/대중문화");
				}
				else if(whatCate==6){
					System.out.println("카테고리는 가정과 생활입니다.");
					map.put("cate", "가정과 생활");
				}
				else if(whatCate==7){
					System.out.println("카테고리는 유아입니다.");
					map.put("cate", "유아");
				}
				else if(whatCate==8){
					System.out.println("카테고리는 국어/외국어/사전입니다.");
					map.put("cate", "국어/외국어/사전");
				}
				else if(whatCate==9){
					System.out.println("카테고리는 자기계발입니다.");
					map.put("cate", "자기계발");
				}			
				else {
					System.out.println("select에 들어간 값은"+select+"입니다.");
					//System.out.println("데이터형은"+select.getClass().getName()+"입니다.");
					map.put("cate", "");
				}
				
				if(page==null)
					page="1";
				int curpage=Integer.parseInt(page);
				
				int rowSize=12;
				int start=(rowSize*curpage)-(rowSize-1);
				int end=(rowSize*curpage);
				map.put("start", start);
				map.put("end", end);
				
				List<BookVO> list=dao.bookNewListData_SelectCate(map); //하단부, 카테고리 선택시 출력. 페이징처리가 필요한 데이터.
				List<BookVO> saleslist=dao.bookNewListData_SalesRandom(map);//상단부, 판매중인 도서.
				
				// 총페이지 
				map.put("table_name", "book_data");
				int totalpage=dao.bookNewTotalPage(map);
				final int BLOCK=10;
				int startPage=((curpage-1)/BLOCK*BLOCK)+1;
				int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
				if(endPage>totalpage)
					endPage=totalpage;
				
				model.addAttribute("whatCate",whatCate);
				model.addAttribute("curpage", curpage);
				model.addAttribute("totalpage",totalpage);
				model.addAttribute("BLOCK", BLOCK);
				model.addAttribute("startPage",startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("list", list);
				model.addAttribute("saleslist", saleslist);
				model.addAttribute("main_jsp", "../book/newlist.jsp");				
				return "main/main";
				
				 
			 }
			
			
			
			
			// 신간 도서 상세 페이지
			@RequestMapping("book/newdetail.do")
			public String book_newdetail(int bno, Model model) {

				//상세 데이터 출력
				BookVO vo = dao.bookNewDetailData(bno);
				model.addAttribute("vo", vo);
				model.addAttribute("bno", bno);		
				
				//관련 데이터 리스트 출력
				String genre = vo.getGenre();			
				//System.out.println("해당책의 장르는 "+genre+"입니다."); //확인용.
				List<BookVO> list = dao.bookNewRelationListData(genre);
				model.addAttribute("list", list);
				int point = vo.getIntprice() / 100 * 5; //5퍼센트 기본 적립.
				model.addAttribute("point",point);
				
				//리뷰 데이터 리스트 출력			
				System.out.println("bno는 "+bno+"입니다.");			
				List<BookCommentVO> clist = dao.bookCommentListData(bno);//bno를 가져와서 bno==dc_bno인 데이터를 출력.
				model.addAttribute("clist",clist);
				
				
				
				model.addAttribute("main_jsp", "../book/newdetail.jsp");
				return "main/main";
			}
		
			
			
			//3-1. 리뷰 입력
			@RequestMapping("book/newdetail_commentInput.do")
			public String book_newdetail_commentInput(HttpServletRequest request,HttpServletResponse response) throws Exception {
				
				/*리뷰 입력 날짜와 시간 구하기 -> 그냥 오라클 SYSDATE 이용하면 편함.*/
				/*방법1.
				LocalDate todayIs = LocalDate.now();
				LocalTime timeIs = LocalTime.now();				
				DateTimeFormatter format_todayIs = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				DateTimeFormatter format_timeIs = DateTimeFormatter.ofPattern("HH:mm:ss");
				String formated_todayIs = todayIs.format(format_todayIs);
				String formated_timeIs = timeIs.format(format_timeIs);
				String resultTime = formated_todayIs.concat(formated_timeIs);	
				//방법2.
				Date today_and_time = new Date();
			    System.out.println(today_and_time);
			    SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			    String result_today_and_time = form.format(today_and_time);

			    System.out.println("Date를 이용한 현재 시간은:"+result_today_and_time+"입니다.");				
				System.out.println("리뷰를 등록하는 현재 시간은"+formated_todayIs+" "+formated_timeIs+" 입니다.");
				map.put("writedate", result_today_and_time);
				*/
				
				
				/*bno,제목,리뷰내용 얻기*/
				int bno = Integer.parseInt(request.getParameter("bno"));
				String title = request.getParameter("title");
				String comments = request.getParameter("comments");
				String writer = request.getParameter("writer");
				
				System.out.println("bno는?"+bno+"입니다.");
				System.out.println("title은?"+title+"입니다.");
				
				/*넣어야할것 : dc_bno, title, comments,writedate*/
				HashMap<String, Object> map=new HashMap<String, Object>();
				map.put("bno", bno);
				map.put("title",title);
				map.put("comments", comments);
				map.put("writer",writer);
				
				dao.bookCommentInputData(map);
				
				
				String reurl = "redirect:../book/newdetail.do?bno="+Integer.toString(bno); 
				return reurl;
			}
			
		
}
