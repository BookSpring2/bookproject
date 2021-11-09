package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
/*
	private String user_id,subject,image,content,category,tag;
	private Date regdate;
	
	NO       NOT NULL NUMBER         
USER_ID  NOT NULL VARCHAR2(20)   
SUBJECT  NOT NULL VARCHAR2(1000) 
IMAGE             VARCHAR2(1000) 
CONTENT  NOT NULL CLOB           
REGDATE           DATE           
CATEGORY NOT NULL VARCHAR2(500)  
TAG      NOT NULL VARCHAR2(500)
 */
public interface BlogMapper {
	@Select("SELECT no,subject,content,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,num "
			+"FROM (SELECT no,subject,content,regdate,rownum as num "
			+"FROM (SELECT no,subject,content,regdate "
			+"FROM book_blog ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BlogVO> BlogList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/6.0) FROM book_blog")
	public int BlogTotalPage();
	
	@SelectKey(keyProperty="no", resultType=int.class , before=true,
		     statement="SELECT NVL(MAX(no)+1,1) as no FROM book_blog")
	
	@Insert("INSERT INTO book_blog VALUES("
		  +"#{no},#{user_id},#{subject},#{image},#{content},SYSDATE,#{category},#{tag},#{membership})")
	public void BlogInsert(BlogVO vo);
	
	@Select("SELECT no,user_id,subject,content,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,category,tag,membership "
			+"FROM book_blog WHERE no=#{no}")
	public BlogVO BlogDetailData(int no);
	
	@Delete("DELETE FROM book_blog WHERE no=#{no}")
	public void BlogDelete(int no);
	
	@Update("UPDATE book_blog SET "
			+"user_id=#{user_id},subject=#{subject},content=#{content} WHERE no=#{no}")
	public void BlogUpdate(BlogVO vo);
}
