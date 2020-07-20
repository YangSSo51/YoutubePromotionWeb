package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.ApplyVO;

public interface ApplyDAO {
	public void add(ApplyVO apply) throws Exception;
	public List<ApplyVO> readList() throws Exception;
	public ApplyVO read(int id) throws Exception;
	public void delete(int id) throws Exception;
	public void update(ApplyVO apply) throws Exception;
}
