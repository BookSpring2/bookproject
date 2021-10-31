package com.sist.dao;
import java.util.*;
import com.sist.vo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;

@Repository
public class CartDAO {
	@Autowired
	private CartMapper mapper;
	
	//////////////////////////// 장바구니 /////////////////////////////////
	public List<CartVO> cartMoeny(){
		return null;
	}
	
	public List<CartVO> cartList()
	{
		return mapper.cartList();
	}
	
	public String cartInsert(CartVO vo)
	{
		return mapper.cartInsert(vo);
	}
	
	public void cartDelete(int cartid)
	{
		mapper.cartDelete(cartid);
	}
	
	public void cartDeleteAll(String userid)
	{
		mapper.cartDeleteAll(userid);
	}
	
	public void cartDelUpdate(int cartid)
	{
		
	}
	
	public int cartSumMoney(String userid)
	{
		return mapper.cartSumMoney(userid);
	}
	
	public int cartCount(String userid, int bookid)
	{
		return 0;
	}
	
	public void cartUpdate(CartVO vo)
	{
		mapper.cartInsert(vo);
	}
	
	public void cartUpdateOk(CartVO vo)
	{
		
	}
}
