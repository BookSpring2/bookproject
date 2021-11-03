package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.FreeBoardMapper;
import com.sist.vo.FreeBoardVO;

@Repository
public class FreeBoardDAO {
	@Autowired
	private FreeBoardMapper mapper;
	
	public List<FreeBoardVO> freeBoardList(Map map)
	{
		return mapper.freeBoardList(map);
	}
	
	public int freeBoardTotalPage()
	{
		return mapper.freeBoardTotalPage();
	}
	
	public void freeBoardInsert(FreeBoardVO vo)
	{
		mapper.freeBoardInsert(vo);
	}
	
	public FreeBoardVO freeBoardDetail(int no)
	{
		mapper.freeBoardHitIncrement(no);
		return mapper.freeBoardDetail(no);
	}
	
	public void freeBoardUpdate(FreeBoardVO vo)
	{
		mapper.freeBoardUpdate(vo);
	}
	
	public void freeBoardDelete(int no)
	{
		mapper.freeBoardDelete(no);
	}
	
	public List<FreeBoardVO> freeBoardFind(Map map)
	{
		return mapper.freeBoardFind(map);
	}

}
