package com.sist.dao;
import com.sist.mapper.*;
import com.sist.vo.BlogVO;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDAO {
	@Autowired
	private BlogMapper mapper;
	
	public List<BlogVO> BlogList(Map map)
	{
		return mapper.BlogList(map);
	}
	
	public int BlogTotalPage()
	{
		return mapper.BlogTotalPage();
	}
	
	public void BlogInsert(BlogVO vo)
	{
		mapper.BlogInsert(vo);
	}
}
