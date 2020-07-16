package org.kpu.myweb.domain;

public class InviteVO {
	int id;
	int postID;
	int enterID;
	int youtuberID;
	String phoneNo;
	int result;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	public int getEnterID() {
		return enterID;
	}
	public void setEnterID(int enterID) {
		this.enterID = enterID;
	}
	public int getYoutuberID() {
		return youtuberID;
	}
	public void setYoutuberID(int youtuberID) {
		this.youtuberID = youtuberID;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
}
