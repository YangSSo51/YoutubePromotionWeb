package org.kpu.myweb.domain;

public class UserVO {

	private String id;
	private String passwd;
	private String username;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", passwd=" + passwd + ", username=" + username +  "]";
	}

	
}
