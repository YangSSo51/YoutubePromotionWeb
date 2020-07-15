package org.kpu.myweb.domain;

public class YoutuberVO {
	String id;
	String name;
	int subscriber;
	int uploadCnt;
	String openingDate;
	String url;
	String filename;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSubscriber() {
		return subscriber;
	}
	public void setSubscriber(int subscriber) {
		this.subscriber = subscriber;
	}
	public int getUploadCnt() {
		return uploadCnt;
	}
	public void setUploadCnt(int uploadCnt) {
		this.uploadCnt = uploadCnt;
	}
	public String getOpeingDate() {
		return openingDate;
	}
	public void setOpeingDate(String opeingDate) {
		this.openingDate = opeingDate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
