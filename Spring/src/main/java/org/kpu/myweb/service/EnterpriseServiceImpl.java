package org.kpu.myweb.service;

import java.util.List;
import java.util.logging.*;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.EnterpriseVO;
import org.kpu.myweb.persistence.EnterpriseDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EnterpriseServiceImpl implements EnterpriseService {
	
	@Autowired
	private EnterpriseDAO EnterpriseDAO;

	public EnterpriseServiceImpl(EnterpriseDAO EnterpriseDAO) {
		this.EnterpriseDAO = EnterpriseDAO;
	}
	
	public EnterpriseVO readUser(int id) throws Exception {
		return EnterpriseDAO.read(id);
	}
	
	public List<EnterpriseVO> readUserList() throws Exception{
		return EnterpriseDAO.readList();
	}
	
	public void addUser(EnterpriseVO user) throws Exception {
		EnterpriseDAO.add(user);
	}
	
	public void deleteUser(int id) throws Exception {
		EnterpriseDAO.delete(id);
	}
	
	public void updateUser(EnterpriseVO user) throws Exception {
		EnterpriseDAO.update(user);
	}
	
	public EnterpriseVO viewUser(EnterpriseVO user) throws Exception {
		return EnterpriseDAO.viewUser(user);
	}
	
	public boolean login(EnterpriseVO user,HttpSession session) throws Exception {
		boolean result= EnterpriseDAO.login(user);
		if(result) {
			EnterpriseVO user2 = viewUser(user);
			session.setAttribute("enterNo", user2.getEnterNo());
			session.setAttribute("name", user2.getName());
		}
		return result;
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}

}
