package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

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
	
	// 오더에 동일한 상품 레코드 확인
	@Select("SELECT COUNT(*) FROM book_order "
			+ "WHERE user_id=#{user_id} AND book_no=#{book_no}")
	public int orderCount(OrderFormVO vo);
	
	// 오더에 동일한 상품이 존재하면 수정
	@Update("UPDATE book_order SET amount=amount+#{amount} "
			+ "WHERE user_id=#{user_id} AND book_no=#{book_no}")
	public void orderCountUpdate(OrderFormVO vo);

	// 장바구니 목록
	@Select("SELECT /*+ INDEX_DESC(book_cart bc_cartId_pk)*/cartId, userId, cart_qty, TO_CHAR(regdate,'MM-DD') as regdate, " 
			+ "(SELECT title FROM book_data WHERE book_data.bno=book_cart.productId) as title, " 
			+ "(SELECT image FROM book_data WHERE book_data.bno=book_cart.productId) as image, "
			+ "(SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_cart.productId) as price "
			+ "FROM book_cart "
			+ "WHERE userId=#{user_id} "
			+ "AND regdate>=SYSDATE-3 AND regdate<=SYSDATE")
	public List<CartVO> cartListData(String user_id);
	
	// 장바구니에 동일한 상품 레코드 확인
	@Select("SELECT COUNT(*) FROM book_cart "
			+ "WHERE userId=#{user_id} AND productId=#{book_no}")
	public int cartCount(CartVO vo);
	
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
