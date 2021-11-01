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
	
	public CartVO findCartGoods(String userId, int productId)
	{
		CartVO vo=new CartVO();
		Map map=new HashMap();
		Boolean check=mapper.findCartGoods(map);
		if(check==true)
		{
			vo.setMsg("already_existed");
		}
		else
		{
			vo.setMsg("add_success");
		}
		return vo;
	}
	
	public void cartInsert(CartVO vo)
	{
		mapper.cartInsert(vo);
	}
}
