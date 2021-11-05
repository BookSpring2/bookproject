package com.sist.web;

import java.io.Console;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.ShopDAO;
import com.sist.vo.*;
@RestController
public class ShopRestController {
	@Autowired
	private ShopDAO dao;

/*
@RequestMapping(value="news/news_find.do",produces="text/plain;charset=UTF-8")
   public String news_news_find(String ss) {
	   String json="";
	   List<NewsVO> list=nMgr.newsFindData(ss);
	   try {
		   JSONArray arr=new JSONArray();
		   for(NewsVO vo:list) {
			   JSONObject obj=new JSONObject();
			   obj.put("title", vo.getTitle());
			   obj.put("desc", vo.getDescription());
			   obj.put("author",vo.getAuthor());  
			   obj.put("link",vo.getLink());
			   obj.put("date", vo.getPubDate());
			   
			   arr.add(obj);
		   }
		   json=arr.toJSONString();
	   }catch(Exception ex) {}
	   return json;
   }

 */
	@RequestMapping(value="shop/shop_main.do",produces="text/plain;charset=UTF-8")
		public String board_shop_main(){
			String json="";
			List<ShopVO> list=dao.shopListData();
			try {
				JSONArray arr=new JSONArray();
				for(ShopVO vo:list){
					JSONObject obj=new JSONObject();
					obj.put("id", vo.getId());
					obj.put("name", vo.getName());
					obj.put("open", vo.getOpen());
					obj.put("close", vo.getClose());
					obj.put("hday", vo.getHday());
					obj.put("addr", vo.getAddress());
					obj.put("tel",vo.getTel());
					obj.put("optn",vo.getOptn());
					obj.put("la", vo.getLa());
					obj.put("lo", vo.getLo());
					arr.add(obj);
				}
				json=arr.toJSONString();
			}catch(Exception ex) {}
			
			return json;
		}
	@RequestMapping(value="shop/shop_search.do",produces="text/plain;charset=UTF-8")
	public String shop_search(String ss) {
			String json="";
			List<ShopVO> list=dao.searchListData(ss);
			try {
				JSONArray arr=new JSONArray();
				for(ShopVO vo:list){
					JSONObject obj=new JSONObject();
					obj.put("id", vo.getId());
					obj.put("name", vo.getName());
					obj.put("open", vo.getOpen());
					obj.put("close", vo.getClose());
					obj.put("hday", vo.getHday());
					obj.put("addr", vo.getAddress());
					obj.put("tel",vo.getTel());
					obj.put("optn",vo.getOptn());
					obj.put("la", vo.getLa());
					obj.put("lo", vo.getLo());
					arr.add(obj);
				}
				json=arr.toJSONString();
			}catch(Exception ex) {}

			
			return json;
	}


}
