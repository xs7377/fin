package com.choa.freeBoard;

import com.choa.board.BoardDTO;

public class FreeBoardDTO extends BoardDTO{

	private int ref;
	private int step;
	private int depth;
	private int likes;
	
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
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
}
