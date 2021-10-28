package com.sist.mapper;
import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
/*
 * private int no,hit,imagecount;
	private String name,subject,content,imagename,imagesize;
	private Date regdate;
 */
import org.apache.ibatis.annotations.Update;
public interface NoticeMapper {
	@Select("SELECT no,hit,name,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT no,hit,name,subject,content,regdate,rownum as num "
			+"FROM (SELECT no,hit,name,subject,content,regdate "
			+"FROM book_noticeboard ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<NoticeVO> NoticeBoardList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_noticeboard")
	public int NoticeTotalPage();
	
	@SelectKey(keyProperty="no", resultType=int.class , before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM book_noticeboard")
	
	@Insert("INSERT INTO book_noticeboard VALUES("
		  +"#{no},#{name},#{subject},#{content},SYSDATE,0,#{imagename},#{imagesize},#{imagecount})")
	public void NoticeBoardInsert(NoticeVO vo);
	
	@Update("UPDATE book_noticeboard SET hit=hit+1 WHERE no=#{no}")
	public void NoticeBoardIncrement(int no);
	
	@Select("SELECT no,name,subject,content,regdate,hit,imagename,imagesize,imagecount "
			+"FROM book_noticeboard WHERE no=#{no}")
	public NoticeVO NoticeDetailData(int no);
	
	
}
