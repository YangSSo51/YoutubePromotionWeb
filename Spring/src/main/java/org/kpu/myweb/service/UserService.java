package org.kpu.myweb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.UserVO;

public interface UserService {
	public UserVO readUser(int id) throws Exception;
	public List<UserVO> readUserList() throws Exception;
	public void addUser(UserVO User) throws Exception;
	public void deleteUser(int id) throws Exception; 
	public void updateUser(UserVO User) throws Exception;
	public UserVO viewUser(UserVO vo) throws Exception;
	public Integer readID(String username) throws Exception;
}
