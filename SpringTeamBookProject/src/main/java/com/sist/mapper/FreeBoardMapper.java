package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import com.sist.vo.FreeBoardVO;
public interface FreeBoardMapper {

	// List
	@Select("SELECT no,subject,user_id,regdate,hit, num "
			+"FROM(SELECT no,subject,user_id,regdate,hit, rownum as num "
			+"FROM(SELECT no,subject,user_id,regdate,hit "
			+"FROM book_freeBoard ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<FreeBoardVO> freeBoardList(Map map);
	
	
	// TotalPage
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_freeBoard")
	public int freeBoardTotalPage();
	
	
	// Insert
	@SelectKey(keyProperty="no", resultType=int.class , before=true, statement="SELECT NVL(MAX(no)+1,1) as no FROM book_freeBoard")
	@Insert("INSERT INTO book_freeBoard VALUES(#{no},#{user_id},#{subject},#{content},SYSDATE,0,#{filesize},#{filename},#{filecount})")	
	public void freeBoardInsert(FreeBoardVO vo);
	
	
	// Detail + Hit
	@Update("UPDATE book_freeBoard SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void freeBoardHitIncrement(int no);
	@Select("SELECT no,subject,user_id,content,regdate,hit,fileName,fileSize,fileCount "
			+"FROM book_freeBoard "
			+"WHERE no=#{no}")
	public FreeBoardVO freeBoardDetail(int no);
	
	
	// Update
	@Update("UPDATE book_freeBoard SET user_id=#{user_id}, subject=#{subject}, content=#{content} "
			+"WHERE no=#{no}")
	public void freeBoardUpdate(FreeBoardVO vo);
	
	
	// Delete
	@Delete("DELETE FROM book_freeBoard WHERE no=#{no}")
	public void freeBoardDelete(int no);
	
	
	// Find
	
	// Session
	
	// Comments
}