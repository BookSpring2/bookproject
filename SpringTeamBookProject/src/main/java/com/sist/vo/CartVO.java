package com.sist.vo;

import java.util.*;

/*
 *	CARTID    NOT NULL NUMBER(10)    
	USERID             VARCHAR2(500) 
	PRODUCTID          NUMBER        
	CART_QTY           NUMBER        
	REGDATE            DATE    
 */
public class CartVO {
	private String userId;
	private int cartId, productId, cart_qty;
	private Date regdate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
