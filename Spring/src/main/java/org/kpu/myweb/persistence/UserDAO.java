package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.UserVO;

public interface UserDAO {

	public void add(UserVO user) throws Exception;
	public List<UserVO> readList() throws Exception;
	public UserVO read(String id) throws Exception;
	public void delete(String id) throws Exception;
	public void update(UserVO user) throws Exception;
	public boolean login(UserVO user)throws Exception;
	public UserVO viewUser(UserVO user)throws Exception;
}
