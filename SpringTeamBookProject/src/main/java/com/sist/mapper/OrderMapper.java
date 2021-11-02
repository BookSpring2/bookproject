package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.*;
public interface OrderMapper {
/*
 * 	@SelectKey(keyProperty = "product_id",resultType = int.class,before=true,
			statement = "SELECT NVL(MAX(product_id)+1,1) as product_id FROM goods")
	@Insert("INSERT INTO goods(product_id,product_name,product_price,product_poster,product_desc) "
			+"VALUES(#{product_id},#{product_name},#{product_price},#{product_poster},#{product_desc})")
	public void goodsInsert(GoodsVO vo);
	
	// 상세목록 출력
	@Select("SELECT product_id,product_name,product_poster,product_price,num "
			+"FROM (SELECT product_id,product_name,product_poster,product_price,rownum as num "
			+"FROM (SELECT product_id,product_name,product_poster,product_price "
			+"FROM goods)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<GoodsVO> goodsListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) FROM goods")
	public int goodsTotalPage();
	// 상세보기
	@Select("SELECT product_id,product_name,product_poster,product_price,product_amount "
			+"FROM goods "
			+"WHERE product_id=#{product_id}")
	public GoodsVO goodsDetailData(int product_id);
*/

	@Insert("INSERT INTO book_order VALUES("
			+"(SELECT NVL(MAX(order_no)+1,1) FROM book_order),#{user_id},#{book_no},#{amount},SYSDATE)")
	public void orderInsert(OrderFormVO vo);
	
	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/ order_no,user_id,amount,"
			+"(SELECT title FROM book_data WHERE book_data.bno=book_order.book_no) as title,"
			+"(SELECT image FROM book_data WHERE book_data.bno=book_order.book_no) as image,"
			+"(SELECT price FROM book_data WHERE book_data.bno=book_order.book_no) as image,"
			+"(SELECT name FROM book_member WHERE book_member.user_id=book.order.user_id) as name,"
			+"(SELECT addr1 FROM book_member WHERE book_member.user_id=book.order.user_id) as addr1,"
			+"(SELECT addr2 FROM book_member WHERE book_member.user_id=book.order.user_id) as addr2,"
			+"(SELECT tel FROM book_member WHERE book_member.user_id=book.order.user_id) as tel,"
			+"(SELECT email FROM book_member WHERE book_member.user_id=book.order.user_id) as email "
			+"FROM book_order "
			+"WHERE user_id=#{user_id} "
			+"AND orderdate>=SYSDATE-3 AND orderdate<=SYSDATE")
	public List<OrderFormVO> orderListData(String user_id);
 
	
}
