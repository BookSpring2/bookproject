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
	
	// regdate 컬럼
	@Insert("INSERT INTO book_member VALUES("
			+"#{user_id},#{pwd},#{name},#{sex},#{birthday},#{tel},#{addr1},#{addr2},'n',#{email},#{genre},'family',SYSDATE)")
	public void memberInsert(MemberVO vo);
	
	// 2. 로그인 처리
	// ID 존재여부 확인 (memberIdCount 재사용)
	// 비밀번호 체크
	@Select("SELECT pwd,name FROM book_member "
			+"WHERE user_id=#{id}")
	public MemberVO memberGetPassword(String id);
	
	// 3-1. 아이디찾기
	@Select("SELECT COUNT(*) FROM book_member WHERE tel=#{tel}")
	public int memberIdFind(String tel);
	@Select("SELECT RPAD(SUBSTR(user_id,1,1),LENGTH(user_id),'*') FROM book_member WHERE tel=#{tel}")
	public String memberIdFindData(String tel);
	
	// 3-2. 비밀번호찾기
	// memberIdCount 재사용
	@Select("SELECT RPAD(SUBSTR(pwd,1,1),LENGTH(pwd),'*') FROM book_member WHERE user_id=#{id}")
	public String memberPwdFindData(String id);
	
}
