package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;


import com.sist.vo.BookVO;

public interface BookMapper {
	
	//1. 베스트 셀러 도서 출력 기능
	@Select("SELECT bno,title,image,sale,num "
			+"FROM (SELECT bno,title,image,sale,rownum as num "
			+"FROM (SELECT bno,title,image,sale "
			+"FROM book_data WHERE SALE>0 AND RANK IS NOT NULL ORDER BY sale DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookBestListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name}")
	public int bookTotalPage(Map map);
	
	//2. 신간 도서 출력 기능.
	@Select("SELECT bno,title,image,sale,pubdate,num "
			+"FROM (SELECT bno,title,image,sale,pubdate,rownum as num "
			+"FROM (SELECT bno,title,image,sale,pubdate "
			+"FROM book_data WHERE pubdate IS NOT NULL ORDER BY pubdate DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookNewListData(Map map);
	
}
