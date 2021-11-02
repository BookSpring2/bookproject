package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.*;
public interface OrderMapper {
	
	// 상세페이지 / 장바구니에서 주문하기 버튼 클릭
	@Insert("INSERT INTO book_order (book_no,user_id,order_no,order_seq_no,orderdate,amount) VALUES("
			+"seq_order.nextval, #{user_id}, #{order_no}, #{order_seq_no}, #{orderdate}, #{amount})")
	public String OrderInsert(OrderVO vo);
	
	// 주문하기 목록
	@Select("SELECT bno,title,price,user_id,name,addr1,addr2,tel,email,"
			+"order_no,order_seq_no,orderdate,deliver_date,deliver_situ,"
			+"amount,total as "
			+"FROM book_data d, book_member m, book_order o "
			+"WHERE d.bno=o.book_no AND m.user_id=o.user_id AND o.user_id=#{user_id} order by order_id")
	public List<OrderVO> orderList(Map map);
	
	
}
