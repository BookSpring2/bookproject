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
}
