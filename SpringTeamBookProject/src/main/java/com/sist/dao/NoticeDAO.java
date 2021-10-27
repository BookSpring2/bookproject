package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.vo.*;
import com.sist.mapper.*;
import java.util.*;

@Repository
public class NoticeDAO {
	@Autowired
	private NoticeMapper mapper;
	
	public List<NoticeVO> NoticeBoardList(Map map)
	{
		return mapper.NoticeBoardList(map);
	}
	
	public int NoticeTotalPage()
	{
		return mapper.NoticeTotalPage();
	}
}