package com.sist.vo;
import java.util.*;
/*
 *  BOOK_NO      NOT NULL NUMBER         
	TITLE                 VARCHAR2(300)  
	IMAGE                 VARCHAR2(1000) 
	PRICE                 VARCHAR2(200)  
	USER_ID               VARCHAR2(20)   
	NAME                  VARCHAR2(34)   
	ADDR1                 VARCHAR2(500)  
	ADDR2                 VARCHAR2(500)  
	TEL                   VARCHAR2(20)   
	EMAIL                 VARCHAR2(100)  
	ORDER_NO     NOT NULL NUMBER         
	ORDER_SEQ_NO          NUMBER         
	ORDERDATE             DATE           
	DELIVER_DATE          DATE           
	DELIVER_SITU          VARCHAR2(200)  
	DELIVER_MSG           CLOB           
	AMOUNT                NUMBER         

 * 
 */
public class OrderVO {
	private int book_no;
	private String title,image;
	private String user_id,name,addr1,addr2,tel,email;
	private int order_no,order_seq_no;
	private Date orderdate,deliver_date;
	private String deliver_situ,deliver_msg;
	private int amount,price;
	
	
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public int getOrder_seq_no() {
		return order_seq_no;
	}
	public void setOrder_seq_no(int order_seq_no) {
		this.order_seq_no = order_seq_no;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public Date getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(Date deliver_date) {
		this.deliver_date = deliver_date;
	}
	public String getDeliver_situ() {
		return deliver_situ;
	}
	public void setDeliver_situ(String deliver_situ) {
		this.deliver_situ = deliver_situ;
	}
	public String getDeliver_msg() {
		return deliver_msg;
	}
	public void setDeliver_msg(String deliver_msg) {
		this.deliver_msg = deliver_msg;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
