package org.kpu.myweb.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.kpu.myweb.domain.EnterpriseVO;

public interface EnterpriseService {
	public EnterpriseVO readUser(int id) throws Exception;
	public List<EnterpriseVO> readUserList() throws Exception;
	public void addUser(EnterpriseVO user) throws Exception;
	public void deleteUser(int id) throws Exception; 
	public void updateUser(EnterpriseVO user) throws Exception;
	public boolean login(EnterpriseVO vo,HttpSession session) throws Exception;
	public EnterpriseVO viewUser(EnterpriseVO vo) throws Exception;
	public void logout(HttpSession session) throws Exception;
}
