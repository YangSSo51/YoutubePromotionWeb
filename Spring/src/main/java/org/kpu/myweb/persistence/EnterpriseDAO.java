package org.kpu.myweb.persistence;

import java.util.List;
import org.kpu.myweb.domain.EnterpriseVO;

public interface EnterpriseDAO {
	public void add(EnterpriseVO user) throws Exception;
	public List<EnterpriseVO> readList() throws Exception;
	public EnterpriseVO read(int id) throws Exception;
	public void delete(int id) throws Exception;
	public void update(EnterpriseVO user) throws Exception;
}
