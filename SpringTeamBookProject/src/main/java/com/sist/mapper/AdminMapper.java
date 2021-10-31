package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
public interface AdminMapper {
	@Select("SELECT * FROM book_member WHERE user_id NOT IN ('admin') ORDER BY regdate DESC")
	public List<MemberVO> memberListData(Map map);
}
