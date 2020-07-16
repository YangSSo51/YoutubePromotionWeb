package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.EnterprisePostVO;

public interface EnterprisePostService {
	public EnterprisePostVO readEnterprisePost(int id) throws Exception;
	public List<EnterprisePostVO> readEnterprisePostList() throws Exception;
	public void addEnterprisePost(EnterprisePostVO vo) throws Exception;
	public void deleteEnterprisePost(int id) throws Exception; 
	public void updateEnterprisePost(EnterprisePostVO vo) throws Exception;
	public List<EnterprisePostVO> searchEnterprisePost(String title) throws Exception;
}
