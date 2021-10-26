package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;


import com.sist.vo.BookVO;

public interface BookMapper {
	
	/* 리스트 출력 */
	@Select("SELECT 사용할 컬럼들 FROM 테이블 명 ORDER BY no ASC")
	public List<BookVO> bookListData();
	
	/* 상세보기 출력 */
	@Select("SELECT 사용할 컬럼들 FROM 테이블 명 WHERE no=#{no}")
	public BookVO bookDetailData(int no); 
	
}
