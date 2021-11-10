package com.sist.mapper;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
import java.util.*;
public interface MyPageMapper {

	
	@Select("SELECT point,membership,regdate,genre FROM book_member")
	public List<String> memberListData(String user_id);
	
	@Select("SELECT * FROM book_member "
			+"WHERE user_id=#{user_id}")
	public List<MemberVO> memberInfoData(String user_id);
}
