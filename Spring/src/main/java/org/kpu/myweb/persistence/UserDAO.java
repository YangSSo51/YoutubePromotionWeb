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
	public UserVO readByUserID(String userID) throws Exception;
	public List<String> readAuthByUserID(String userID) throws Exception;
	public Integer readID(String username) throws Exception;
}
