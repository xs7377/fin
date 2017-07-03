package com.choa.message;

import java.sql.Date;

public class MessageDTO {

	private int num;
	private String from_id;
	private String to_id;
	private String title;
	private String contents;
	private int read;
	private Date reg_date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getFrom_id() {
		return from_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public String getTo_id() {
		return to_id;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
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
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
