package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.OrderDetailVO;
import com.sist.vo.OrderFormVO;
import com.sist.vo.OrderVO;
@Repository
public class OrderDAO {
	@Autowired
	private OrderMapper mapper;
	 
	public void orderInsert(OrderFormVO vo)
	{
		mapper.orderInsert(vo);
	}

	public List<OrderFormVO> orderFormListData(String user_id)
	{
		return mapper.orderFormListData(user_id);
	}
/*
	public List<OrderFormVO> orderListData(String user_id)
	{
		return mapper.orderListData(user_id);
	}
	*/
}
