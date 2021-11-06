package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;
/*
 * private int hit;
	private String user_id,subject,image,content,category,tag;
	private Date regdate;
 */
public interface BlogMapper {
	@Select("SELECT no,hit,user_id,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT no,hit,user_id,subject,content,regdate,rownum as num "
			+"FROM (SELECT no,hit,user_id,subject,content,regdate "
			+"FROM book_blog ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BlogVO> BlogList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM book_blog")
	public int BlogTotalPage();
}
