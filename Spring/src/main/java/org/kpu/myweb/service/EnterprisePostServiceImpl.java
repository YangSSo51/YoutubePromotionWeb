package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.persistence.EnterprisePostDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EnterprisePostServiceImpl implements EnterprisePostService{
	@Autowired
	private EnterprisePostDAO enterprisePostDAO;
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public EnterprisePostVO readEnterprisePost(int id) throws Exception {
		enterprisePostDAO.updateViewCnt(id);
		return enterprisePostDAO.read(id);
	}
	
	public List<EnterprisePostVO> readEnterprisePostList() throws Exception{
		return enterprisePostDAO.readList();
	}
	
	public void addEnterprisePost(EnterprisePostVO vo) throws Exception {
		enterprisePostDAO.add(vo);
	}
	
	public void deleteEnterprisePost(int id) throws Exception {
		enterprisePostDAO.delete(id);
	}
	
	public void updateEnterprisePost(EnterprisePostVO vo) throws Exception {
		enterprisePostDAO.update(vo);
	}
	
	public List<EnterprisePostVO> searchEnterprisePost(String title) throws Exception{
		return enterprisePostDAO.search(title);
	}
	public List<EnterprisePostVO> searchByCategory(String category) throws Exception{
		return enterprisePostDAO.searchByCategory(category);
	}
	public List<EnterprisePostVO> readMyEnterprisePost(int enterid) throws Exception{
		return enterprisePostDAO.readMyPost(enterid);
	}
}