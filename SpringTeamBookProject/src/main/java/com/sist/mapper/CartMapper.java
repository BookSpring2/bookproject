package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.sist.vo.*;
public interface CartMapper {
	@Select("SELECT DECODE(COUNT(*), 0, 'false', 'true') FROM book_cart "
			+ "WHERE productId=#{productId} "
			+ "AND userId=#{userId}")
	public String findCartGoods(CartVO vo);
	
	@SelectKey(keyProperty="cartId", resultType=int.class, before=true,
			statement="SELECT NVL(MAX(cartId)+1, 1) as cartId FROM book_cart")
	@Insert("INSERT INTO book_cart (cartId, userId, productId, cart_qty) "
			+ "VALUES(#{cartId}, #{userId}, #{productId}, #{cart_qty})")
	public void cartInsert(CartVO vo);
	
	@Select("SELECT /*+ INDEX_DESC(book_cart bc_cartId_pk)*/cartId, userId, cart_qty, regdate, " 
			+ "(SELECT title FROM book_data WHERE book_data.bno=book_cart.productId) as title, " 
			+ "(SELECT image FROM book_data WHERE book_data.bno=book_cart.productId) as image, "
			+ "(SELECT REPLACE(REPLACE(price, '원', ''),',','') "
			+ "FROM book_data WHERE book_data.bno=book_cart.productId) as price "
			+ "FROM book_cart "
			+ "WHERE userId=#{userId} "
			+ "AND regdate>=SYSDATE-3 AND regdate<=SYSDATE")
	public List<CartVO> cartListData(String userId);
}
