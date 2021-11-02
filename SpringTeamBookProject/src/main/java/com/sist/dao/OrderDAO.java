package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.OrderVO;
@Repository
public class OrderDAO {
	@Autowired
	private OrderMapper mapper;
	 
	public List<OrderVO> orderList(Map map)
	{
		return mapper.orderList(map);
	}
}
