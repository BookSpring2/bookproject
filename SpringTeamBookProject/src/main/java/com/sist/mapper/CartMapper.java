package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.sist.vo.*;
public interface CartMapper {
	
	////////////////////////////장바구니 /////////////////////////////////
	public List<CartVO> cartMoney(); 
	
	// 목록
	@Select("SELECT cartId, bno, user_id, name, title, amount, price, image "
			+ "FROM book_member m, book_cart c, book_data d "
			+ "WHERE m.user_id=c.userId AND c.bookId=d.bno AND c.userId='admin' ORDER BY cartId")
	public List<CartVO> cartList();
	
	// 추가
	@Insert("INSERT INTO bood_cart (cartId, userId, bookId, amount) VALUES("
			+ "seq_cart.nextval, #{userId}, #{bookId}, #{amount})")
	public String cartInsert(CartVO vo);
	
	// 개별 삭제
	@Delete("DELETE FROM book_cart "
			+ "WHERE cartId=#{cartId}")
	public void cartDelete(int cartid);
	
	// 전체 삭제 
	@Delete("DELETE FROM book_cart "
			+ "WHERE userId=#{userId}")
	public void cartDeleteAll(String userid);
	
	public void cartDelUpdate(int cartid);
	
	// 금액 합계
	@Select("SELECT NVL(SUM(price*amount),0) "
			+ "FROM book_cart c, book_data d "
			+ "WHERE c.bookId=p.bno and userId=#{userId}")
	public int cartSumMoney(String userid);
	
	// 장바구니 상품갯수
	public int cartCount(String userid, int bookid);
	
	// 장바구니 수정
	public void cartUpdate(CartVO vo);
	
	public void cartUpdateOk(CartVO vo);
}