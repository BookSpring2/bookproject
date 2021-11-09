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
	@Select("SELECT no,subject,writer,regdate,hit, num "
			+"FROM(SELECT no,subject,writer,regdate,hit, rownum as num "
			+"FROM(SELECT /*+ INDEX_DESC(book_freeBoard fb_no_pk) */ no,subject,writer,regdate,hit "
			+"FROM book_freeBoard)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<FreeBoardVO> freeBoardList(Map map);
	
	
	// TotalPage
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_freeBoard")
	public int freeBoardTotalPage();
	
	
	// Insert
	@SelectKey(keyProperty="no", resultType=int.class , before=true, statement="SELECT NVL(MAX(no)+1,1) as no FROM book_freeBoard")
	@Insert("INSERT INTO book_freeBoard VALUES(#{no},#{writer},#{subject},#{content},SYSDATE,0,#{filesize},#{filename},#{filecount})")	
	public void freeBoardInsert(FreeBoardVO vo);
	
	
	// Detail + Hit
	@Update("UPDATE book_freeBoard SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void freeBoardHitIncrement(int no);
	@Select("SELECT no,subject,writer,content,regdate,hit,fileName,fileSize,fileCount "
			+"FROM book_freeBoard "
			+"WHERE no=#{no}")
	public FreeBoardVO freeBoardDetail(int no);
	
	
	// Update
	@Update("UPDATE book_freeBoard SET writer=#{writer}, subject=#{subject}, content=#{content} "
			+"WHERE no=#{no} ")
	public void freeBoardUpdate(FreeBoardVO vo);
	
	
	// Delete
	@Delete("DELETE FROM book_freeBoard WHERE no=#{no} ")
	public void freeBoardDelete(int no);
	
	
	// Find
	@Select({
			"<script>"
			+"SELECT no,subject,writer,regdate,hit "
			+"FROM book_freeBoard "
			+"WHERE "
			+"<trim prefix=\"(\" suffix=\")\" prefixOverrides=\"OR\"> "
			+"<foreach collection=\"fs\" item=\"fd\">"
			+"<trim prefix=\"OR\">"
			+"<choose>"
			+"<when test=\"fd=='N'.toString()\">"
			+"writer LIKE '%'||#{ss}||'%'"
			+"</when>"
			+"<when test=\"fd=='S'.toString()\">"
			+"subject LIKE '%'||#{ss}||'%'"
			+"</when>"
			+"<when test=\"fd=='C'.toString()\">"
			+"content LIKE '%'||#{ss}||'%'"
			+"</when>"
			+"</choose>"
			+"</trim>"
			+"</foreach>"
			+"</trim>"
			+ "</script>"
	})
	public List<FreeBoardVO> freeBoardFind(Map map);
	// Session
	
	// Comments
}
