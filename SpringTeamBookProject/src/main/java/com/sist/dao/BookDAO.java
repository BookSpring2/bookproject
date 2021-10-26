package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.BookMapper;
import com.sist.vo.BookVO;

@Repository
public class BookDAO {
	
	@Autowired
	private BookMapper mapper;
	
	public List<BookVO> bookBestListData()
	{
		return mapper.bookBestListData();
	}
}
