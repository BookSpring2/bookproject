package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.MemberVO;
@Repository
public class AdminDAO {
	@Autowired
	private AdminMapper amapper;
	
	public List<MemberVO> memberListData(Map map)
	{
		return amapper.memberListData(map);
	}
}
