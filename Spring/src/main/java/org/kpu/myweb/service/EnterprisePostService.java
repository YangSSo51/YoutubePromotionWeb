package org.kpu.myweb.service;

import java.util.ArrayList;
import java.util.List;

import org.kpu.myweb.domain.EnterprisePostVO;
import org.kpu.myweb.domain.EnterpriseVO;

public interface EnterprisePostService {
	public EnterprisePostVO readEnterprisePost(int id) throws Exception;
	public List<EnterprisePostVO> readEnterprisePostList() throws Exception;
	public void addEnterprisePost(EnterprisePostVO vo) throws Exception;
	public void deleteEnterprisePost(int id) throws Exception; 
	public void updateEnterprisePost(EnterprisePostVO vo) throws Exception;
	public List<EnterprisePostVO> searchEnterprisePost(String title) throws Exception;
	public List<EnterprisePostVO> readMyEnterprisePost(int enterid) throws Exception;
}
