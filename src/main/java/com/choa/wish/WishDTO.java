package com.choa.wish;

import java.sql.Date;

public class WishDTO {

	
	private int num;
	private String m_id;
	private String title;
	private String contents;
	private Date reg_date;
	private int hit;
	private int ref;
	private int step;
	private int depth;
	private int likes;
	private String category;
	private String kind;
	
	private String cate1;
	private String cate2;
	private String cate3;
	
	//섬네일
	private String thumb;
	
	
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getCate3() {
		return cate3;
	}
	public void setCate3(String cate3) {
		this.cate3 = cate3;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
}
