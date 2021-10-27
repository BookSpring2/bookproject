package com.sist.vo;
/*
 *  CARTID NOT NULL NUMBER        
	USERID NOT NULL VARCHAR2(100) 
	BOOKID NOT NULL NUMBER        
	AMOUNT          NUMBER  
 */
public class MyPageVO {
	private int cartId;
	private String userId;
	private String name;
	private int bookId;
	private String title;
	private int price;
	private int money;
	private int amount;
	public int getCartId() {
		return cartId;
	}
	public void setCartid(int cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
    @Override
    public String toString() {
        return "CartVO [cartId=" + cartId + ", userId=" + userId + ", name=" + name + ", booId=" + bookId
                + ", title=" + title + ", price=" + price + ", money=" + money + ", amount=" + amount + "]";
    }
	
}
