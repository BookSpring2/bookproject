package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;

public interface MemberMapper {

	
	// 1. 회원가입 처리
	// ID 존재여부 확인
	@Select("SELECT COUNT(*) FROM book_member "
			+"WHERE user_id=#{id}")
	public int memberIdCount(String id);
	
	// regdate 컬럼추가
	@Insert("INSERT INTO book_member VALUES("
			+"#{user_id},#{pwd},#{name},#{sex},#{birthday},#{tel},#{addr1},#{addr2},'n',#{email},#{genre},'family',SYSDATE)")
	public void memberInsert(MemberVO vo);
	
	// 2. 로그인 처리
	// ID 존재여부 확인 (memberIdCount 재사용)
	// 비밀번호 체크
	@Select("SELECT pwd,name FROM book_member "
			+"WHERE user_id=#{id}")
	public MemberVO memberGetPassword(String id);
	
}
