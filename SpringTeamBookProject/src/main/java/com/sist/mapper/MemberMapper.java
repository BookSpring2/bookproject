package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface MemberMapper {

	// ID 존재여부 확인
	@Select("SELECT COUNT(*) FROM book_member "
			+"WHERE user_id=#{id}")
	public int memberIdCount(String id);
	
	// 2. 회원가입 처리
	@Insert("INSERT INTO book_member VALUES("
			+"#{user_id},#{pwd},#{name},#{sex},#{birthday},#{tel},#{addr1},#{addr2},'n',#{email},#{genre},'family')")
	public void memberInsert(MemberVO vo);
}
