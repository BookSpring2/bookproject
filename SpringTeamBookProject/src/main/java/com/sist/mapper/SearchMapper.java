package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;

public interface SearchMapper {
	 
	// 제목
	@Select("SELECT bno,title,image,writer,translator,genre "
			+"FROM book_data "
			+"WHERE REGEXP_LIKE(title,#{title}) "
			+"AND rownum<=12")
	public List<BookVO> bookTitleData(String title);
	
	@Select("SELECT bno,title,image,writer,translator,genre,num "
			+"FROM (SELECT /*+ INDEX_ASC(book_data bd_bno_pk) */ bno,title,image,writer,translator,genre,rownum as num "
			+"FROM book_data "
			+"WHERE title LIKE '%'||#{title}||'%') "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookTitleSearchData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM book_data "
			+"WHERE title LIKE '%'||#{title}||'%'")
	public int bookTitleTotalPage(String title);
	
	// 작가
	@Select("SELECT bno,title,image,writer,translator,genre "
			+"FROM book_data "
			+"WHERE REGEXP_LIKE(writer,#{writer}) "
			+"AND rownum<=12")
	public List<BookVO> bookWriterData(String writer);
	
	@Select("SELECT bno,title,image,writer,translator,genre,num "
			+"FROM (SELECT /*+ INDEX_ASC(book_data bd_bno_pk) */ bno,title,image,writer,translator,genre,rownum as num "
			+"FROM book_data "
			+"WHERE writer LIKE '%'||#{writer}||'%') "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookWriterSearchData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM book_data "
			+"WHERE writer LIKE '%'||#{writer}||'%'")
	public int bookWrtierTotalPage(String writer);
	
	// 번역가
	@Select("SELECT bno,title,image,writer,translator,genre "
			+"FROM book_data "
			+"WHERE REGEXP_LIKE(translator,#{traslator}) "
			+"AND rownum<=12")
	public List<BookVO> bookTranslatorData(String translator);
	
	@Select("SELECT bno,title,image,writer,translator,genre,num "
			+"FROM (SELECT /*+ INDEX_ASC(book_data bd_bno_pk) */ bno,title,image,writer,translator,genre,rownum as num "
			+"FROM book_data "
			+"WHERE translator LIKE '%'||#{translator}||'%') "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookTranslatorSearchData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM book_data "
			+"WHERE translator LIKE '%'||#{translator}||'%'")
	public int bookTranslatorTotalPage(String translator);
	
	// 장르
	@Select("SELECT bno,title,image,writer,translator,genre "
			+"FROM book_data "
			+"WHERE REGEXP_LIKE(genre,#{genre}) "
			+"AND rownum<=12")
	public List<BookVO> bookGenreData(String genre);
	
	@Select("SELECT bno,title,image,writer,translator,genre,num "
			+"FROM (SELECT /*+ INDEX_ASC(book_data bd_bno_pk) */ bno,title,image,writer,translator,genre,rownum as num "
			+"FROM book_data "
			+"WHERE genre LIKE '%'||#{genre}||'%') "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<BookVO> bookGenreSearchData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM book_data "
			+"WHERE genre LIKE '%'||#{genre}||'%'")
	public int bookGenreTotalPage(String genre);
	
	
}
