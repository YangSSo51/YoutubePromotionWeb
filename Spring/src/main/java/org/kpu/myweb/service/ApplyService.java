package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.InviteVO;

public interface ApplyService {
	public ApplyVO readApply(int id) throws Exception;
	public List<ApplyVO> readApplyList() throws Exception;
	public void addApply(ApplyVO vo) throws Exception;
	public void deleteApply(int id) throws Exception; 
	public void updateApply(ApplyVO vo) throws Exception;
	public List<ApplyVO> readListByPostID(int id) throws Exception;
	public List<ApplyVO> readListByYoutuberID(int id) throws Exception;
	public boolean checkOverlap(List<ApplyVO> list, ApplyVO vo) throws Exception; // 리스트 내 중복 체크
}
