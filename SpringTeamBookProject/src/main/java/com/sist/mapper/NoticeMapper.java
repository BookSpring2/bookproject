package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;
/*
 * private int no,hit,imagecount;
	private String name,subject,content,imagename,imagesize;
	private Date regdate;
 */
public interface NoticeMapper {
	@Select("SELECT no,hit,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT no,hit,name,subject,content,regdate,rownum as num "
			+"FROM (SELECT no,hit,name,subject,content,regdate "
			+"FROM book_noticeboard ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> NoticeBoardList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_noticeboard")
	public int NoticeTotalPage();
	
}
