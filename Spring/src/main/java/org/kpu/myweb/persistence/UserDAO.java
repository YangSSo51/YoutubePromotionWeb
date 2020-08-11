package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.UserVO;

public interface UserDAO {
	public void add(String[] array) throws Exception;
	public List<UserVO> readList() throws Exception;
	public UserVO read(int id) throws Exception;
	public void delete(int id) throws Exception;
	public void update(UserVO User) throws Exception;
	public boolean login(UserVO User)throws Exception;
	public UserVO viewUser(UserVO User)throws Exception;
	
	public UserVO readByUsername(String username) throws Exception;
	public UserVO readByUserID(int id) throws Exception;
	public String readAuthByUsername(String username) throws Exception;
	public Integer readIDByUsername(String username) throws Exception;
}
