package com.choa.reply;

import java.sql.Date;

public class ReplyDTO {
	
	private int num;
	private String kind;
	private int pNum;
	private String m_id;
	private String contents;
	private Date reg_date;
	private int ref;
	private int step;
	private int depth;
	public int getNum() {
		return num;
	}
	public String getKind() {
		return kind;
	}
	public int getpNum() {
		return pNum;
	}
	public String getM_id() {
		return m_id;
	}
	public String getContents() {
		return contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public int getRef() {
		return ref;
	}
	public int getStep() {
		return step;
	}
	public int getDepth() {
		return depth;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	

}
