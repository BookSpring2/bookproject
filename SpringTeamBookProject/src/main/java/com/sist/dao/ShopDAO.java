package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.ShopMapper;
import com.sist.vo.*;
import java.util.*;
@Repository
public class ShopDAO {
	@Autowired
	private ShopMapper mapper;
	
	public List<ShopVO> shopListData(){
		return mapper.shopListData();
	}
	
	public ShopVO shopDetailData(String id) {
		return mapper.shopDetailData(id);
	}
}
