package org.kpu.myweb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.UserVO;

public interface UserService {
	
	public UserVO readUser(String id) throws Exception;
	public List<UserVO> readUserList() throws Exception;
	public void addUser(UserVO user) throws Exception;
	public void deleteUser(String id) throws Exception; 
	public void updateUser(UserVO user) throws Exception;
	public boolean login(UserVO vo,HttpSession session) throws Exception;
	public UserVO viewUser(UserVO vo) throws Exception;
	public void logout(HttpSession session) throws Exception;
}
