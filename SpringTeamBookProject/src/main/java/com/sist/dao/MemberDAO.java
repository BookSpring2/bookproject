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
	
	// 로그인처리
	public MemberVO isLogin(String id,String pwd)
	{
		MemberVO vo=new MemberVO();
		int count=mapper.memberIdCount(id);
		if(count==0) // 일치하는 아이디 없음
		{
			vo.setMsg("NOID");
		}
		else if(count!=0) // 아이디가 존재하는 경우
		{
			MemberVO dbVO=mapper.memberGetPassword(id);
			if(pwd.equals(dbVO.getPwd())) // 비밀번호가 일치하는 경우
			{
				vo.setMsg("OK");
				vo.setUser_id(id);
				vo.setName(dbVO.getName());
				vo.setMembership(dbVO.getMembership());
				vo.setAdmin(dbVO.getAdmin());
			}
			else // 비밀번호가 일치하지 않는 경우
			{
				vo.setMsg("NOPWD");
			}
		}
		return vo;
	}
	
	// 아이디 찾기
	public String memberIdFindData(String tel)
	{
		String msg="";
		int count=mapper.memberIdFind(tel);
		if(count==0)
		{
			msg="핸드폰번호가 존재하지 않습니다";
		}
		else
		{
			msg=mapper.memberIdFindData(tel);
		}
		return msg;
	}
	
	// 비밀번호 찾기
	public String memberPwdFindData(String id)
	{
		String msg="";
		int count=mapper.memberIdCount(id);
		if(count==0)
		{
			msg="아이디가 존재하지 않습니다";
		}
		else
		{
			msg=mapper.memberPwdFindData(id);
		}
		return msg;
	}

	
}
