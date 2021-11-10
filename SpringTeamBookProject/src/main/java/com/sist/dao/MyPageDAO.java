package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.MemberVO;

@Repository
public class MyPageDAO {
	@Autowired
	private MyPageMapper mapper;
	
	public List<String> memberListData(String user_id)
	{
		return mapper.memberListData(user_id);
	}
	
	public List<MemberVO> memberInfoData(String user_id)
	{
		return mapper.memberInfoData(user_id);
	}
}
