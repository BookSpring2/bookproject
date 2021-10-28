package com.sist.mapper;
import com.sist.vo.FreeBoardVO;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import java.util.*;
public interface FreeBoardMapper {
	// Load
	@Select("SELECT no,subject,user_id,regdate,hit, num "
			+"FROM(SELECT no,subject,user_id,regdate,hit, rownum as num "
			+"FROM(SELECT no,subject,user_id,regdate,hit "
			+"FROM book_freeBoard ORDER BY no DESC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<FreeBoardVO> freeBoardList(Map map);
	
	// TotalPage
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM book_freeBoard")
	public int freeBoardTotalPage();
	
	// 갈아엎기
	// Seq,Insert
	@SelectKey(keyProperty = "no",resultType = int.class, before = true,
			statement = "SELECT NVL(MAX(no)+1,1) as no FROM book_freeBoard")
	@Insert("INSERT INTO freeboard(no,subject,content,sysdate,hit,filename,filesize,filecount) VALUES("
				 +"#{no},#{subject},#{content},SYSDATE,0,#{filename},#{filesize},#{filecount})")
	public void freeBoardInsert(FreeBoardVO vo);
	
	// 조회수 증가 & 상세보기
	@Update("UPDATE freeboard SET "
			+"hit=hit+1 "
			+"WHERE no=#{no}")
	public void freeBoardHitIncrement(int no);
	@Select("SELECT no,subject,content,regdate,hit,fileName,fileSize,fileCount "
			+"FROM freeboard "
			+"WHERE no=#{no}")
	public FreeBoardVO freeBoardDetail(int no);
}
