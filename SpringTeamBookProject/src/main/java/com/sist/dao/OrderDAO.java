package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class OrderDAO {
	@Autowired
	private OrderMapper mapper;
	
	public void OrderInsert(OrderVO vo)
	{
		
	}
	
	public List<OrderVO> orderFormList(Map map)
	{
		return mapper.orderFormList(map);
	}
	
	public List<OrderVO> orderMember(Map map)
	{
		return mapper.orderMember(map);
	}
	
	public OrderVO orderData(int order_no)
	{
		return mapper.orderData(order_no);
	}
	
	public OrderVO orderList(int order_no)
	{
		return mapper.orderList(order_no);
	}
	
	public OrderVO orderInfoData(int order_no)
	{
		return mapper.orderInfoData(order_no);
	}
}
