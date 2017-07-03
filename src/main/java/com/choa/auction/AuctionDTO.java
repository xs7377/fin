package com.choa.auction;

import java.sql.Date;

public class AuctionDTO {

private int num;
private String m_id;
private String title;
private String contents;
private Date red_date;
private int hit;
private String reply;
private int likes;
private String category;
private String primeum;
private int min_price;
private int max_price;
private String period;
private String buyer;
private String kind;
private int price;
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getM_id() {
	return m_id;
}
public void setM_id(String m_id) {
	this.m_id = m_id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public Date getRed_date() {
	return red_date;
}
public void setRed_date(Date red_date) {
	this.red_date = red_date;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public int getLikes() {
	return likes;
}
public void setLikes(int likes) {
	this.likes = likes;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public int getMin_price() {
	return min_price;
}
public void setMin_price(int min_price) {
	this.min_price = min_price;
}
public int getMax_price() {
	return max_price;
}
public void setMax_price(int max_price) {
	this.max_price = max_price;
}
public String getPeriod() {
	return period;
}
public void setPeriod(String period) {
	this.period = period;
}
public String getBuyer() {
	return buyer;
}
public void setBuyer(String buyer) {
	this.buyer = buyer;
}
public String getReply() {
	return reply;
}
public void setReply(String reply) {
	this.reply = reply;
}
public String getPrimeum() {
	return primeum;
}
public void setPrimeum(String primeum) {
	this.primeum = primeum;
}
public String getKind() {
	return kind;
}
public void setKind(String kind) {
	this.kind = kind;
}

	
}
