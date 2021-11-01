package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface OrderMapper {
	
	// 상세페이지 / 장바구니에서 주문하기 버튼 클릭하면 주문테이블로 데이터 전송
	@Insert("INSERT INTO book_order (book_no,user_id,order_no,order_seq_no,orderdate,amount,"
			+"title,image,price,name,addr1,addr2,tel,email) VALUES(#{book_no},#{user_id},"
			+"#{order_seq_no},#{orderdate},#{amount},#{title},#{image},#{price},#{name},#{addr1},#{addr2},#{tel},#{email}")
	public void OrderInsert(OrderVO vo);
	
	// 주문하기에서 주문목록(책+배송정보)
	@Select("SELECT book_no,title,image,price,user_id,"
			+"order_no,order_seq_no,orderdate,deliver_date,amount "
			+"FROM book_order")
	public List<OrderVO> orderFormList(Map map);
	
	// 주문....
	@Select("SELECT * FROM book_order")
	public OrderVO orderData(int order_no);
	
	// 주문하기에서 회원정보목록
	@Select("SELECT user_id,name,addr1,addr2,tel,email,deliver_msg "
			+"FROM book_order")
	public List<OrderVO> orderMember(Map map);
	
	// 주문완료 내역
	@Select("SELECT user_id,order_no,orderdate "
			+"FROM book_order "
			+"ORDER BY order_no ASC")
	public OrderVO orderList(int order_no);
	
	// 주문완료 내역 상세보기
	@Select("SELECT book_no,title,image,price,user_id,order_no,order_seq_no,"
			+"orderdate,deliver_date,deliver_situ,amount "
			+"FROM book_order "
			+"WHERE order_no=#{order_no}")
	public OrderVO orderInfoData(int order_no);
	
	
}
