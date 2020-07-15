package org.kpu.myweb.persistence;

import java.util.List;
import org.kpu.myweb.domain.EnterprisePostVO;


public interface EnterprisePostDAO {
	public void add(EnterprisePostVO vo) throws Exception;
	public List<EnterprisePostVO> readList() throws Exception;
	public EnterprisePostVO read(int id) throws Exception;
	public void delete(int id) throws Exception;
	public void update(EnterprisePostVO vo) throws Exception;
	public void updateViewCnt(int id) throws Exception;
}
