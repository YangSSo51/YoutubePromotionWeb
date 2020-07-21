package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.ApplyVO;

public interface ApplyService {
	public ApplyVO readApply(int id) throws Exception;
	public List<ApplyVO> readApplyList() throws Exception;
	public void addApply(ApplyVO vo) throws Exception;
	public void deleteApply(int id) throws Exception; 
	public void updateApply(ApplyVO vo) throws Exception;
}
