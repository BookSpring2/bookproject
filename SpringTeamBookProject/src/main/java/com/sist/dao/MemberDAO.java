package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper mapper;
	
	// 아이디 중복체크
	public int memberIdCheck(String id)
	{
		return mapper.memberIdCount(id);
	}
	
	// 회원가입
	public void memberInsert(MemberVO vo)
	{
		mapper.memberInsert(vo);
	}
	
}
