package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.*;
public interface OrderMapper {

	@Insert("INSERT INTO book_order VALUES("
			+"(SELECT NVL(MAX(order_no)+1,1) FROM book_order),#{user_id},#{book_no},#{cart_qty},SYSDATE)")
	public void orderInsert(OrderFormVO vo);
	
	
	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/order_no, user_id, cart_qty, orderdate, " 
			+ "(SELECT title FROM book_data WHERE book_data.bno=book_order.book_no) as title, " 
			+ "(SELECT image FROM book_data WHERE book_data.bno=book_order.book_no) as image, "
			+ "(SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_order.book_no) as price "
			+ "FROM book_order "
			+ "WHERE user_id=#{user_id} "
			+ "AND orderdate>=SYSDATE-3 AND orderdate<=SYSDATE")
	public List<OrderFormVO> orderFormListData(String user_id);
	
//	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/ order_no,user_id,amount,"
/*			+"(SELECT title FROM book_data WHERE book_data.bno=book_order.book_no) as title,"
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
 
*/
	
}
