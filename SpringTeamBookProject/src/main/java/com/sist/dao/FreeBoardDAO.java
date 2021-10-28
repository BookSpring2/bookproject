package com.sist.dao;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.FreeBoardVO;
import com.sist.mapper.FreeBoardMapper;

@Repository
public class FreeBoardDAO {
	@Autowired
	private FreeBoardMapper mapper;
	/*
	 * // Load
	@Select("SELECT no,subject,user_id,regdate,hit, num "
			+"FROM(SELECT no,subject,user_id,regdate,hit, rownum as num "
			+"FROM(SELECT no,subject,user_id,regdate,hit "
			+"FROM book_freeBoard ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<FreeBoardVO> freeBoardList(Map map);
	
	// TotalPage
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_freeBoard")
	public int freeBoardTotalPage();
	 */
	public List<FreeBoardVO> freeBoardList(Map map)
	{
		return mapper.freeBoardList(map);
	}
	
	public int freeBoardTotalPage()
	{
		return mapper.freeBoardTotalPage();
	}
}
