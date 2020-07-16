package org.kpu.myweb.domain;

public class EnterprisePostVO {
	int id;
	int enterID;
	String title;
	String date; // format (yyyy-MM-dd HH:mm:ss)
	String category;
	String description;
	String image;
	int recuitCnt;
	int viewCnt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEnterID() {
		return enterID;
	}
	public void setEnterID(int enterID) {
		this.enterID = enterID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getRecuitCnt() {
		return recuitCnt;
	}
	public void setRecuitCnt(int recuitCnt) {
		this.recuitCnt = recuitCnt;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
}
