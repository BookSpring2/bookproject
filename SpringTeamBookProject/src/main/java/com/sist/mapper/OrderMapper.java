package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.*;
public interface OrderMapper {

	// 주문하기 폼에서 -> 구매 버튼 누를시 서버로 데이터 전송
	@Insert("INSERT INTO book_order VALUES("
			+"(SELECT NVL(MAX(order_no)+1,1) FROM book_order),#{user_id},#{book_no},#{amount},SYSDATE)")
	public void orderInsert(OrderFormVO vo);
	
	// 주문하기 폼 출력
	@Select("SELECT /*+ INDEX_DESC(book_order bo_orderno_pk)*/order_no, user_id, amount, TO_CHAR(orderdate,'MM-DD') as orderday, " 
			+ "(SELECT title FROM book_data WHERE book_data.bno=book_order.book_no) as title, " 
			+ "(SELECT image FROM book_data WHERE book_data.bno=book_order.book_no) as image, "
			+ "(SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_order.book_no) as price "
			+ "FROM book_order "
			+ "WHERE user_id=#{user_id} "
			+ "AND orderdate>=SYSDATE-3 AND orderdate<=SYSDATE")
	public List<OrderFormVO> orderFormListData(String user_id);
	
	@Insert("INSERT INTO book_orderInfo(order_no,user_id,name,addr1,addr2,tel,amount) "
			+"VALUES(#{order_no},#{user_id},#{name},#{addr1},#{addr2},#{tel},#{amount}")
	public void orderInfoInsert(OrderVO vo);
	
	@Insert("INSERT INTO book_orderDetail(order_detail_no,order_no,book_no,cart_qty) "
			+"SELECT bod_detailno_sql.nextval,#{order_no},book_no,cart_qty "
			+"FROM book_cart")
	public void orderDetailInsert(OrderDetailVO vo);

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
