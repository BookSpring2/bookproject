package com.sist.mapper;
import com.sist.vo.*;
import java.util.*;

import org.apache.ibatis.annotations.Select;
public interface ShopMapper {
	@Select("SELECT id,name,addr as address,open,close,tel,optn,adit,hday,la,lo FROM book_store")
	public List<ShopVO> shopListData();
	
	@Select("SELECT id,name,addr as address,open,close,tel,optn,adit,hday,la,lo FROM book_store where id=#{id}")
	public ShopVO shopDetailData(String id);
	
	@Select("SELECT id,name,addr as address,open,close,tel,optn,adit,hday,la,lo FROM book_store WHERE")
	public List<ShopVO> searchListData(String ss);
}
