package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.ApplyVO;
import org.kpu.myweb.domain.InviteVO;
import org.kpu.myweb.persistence.ApplyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ApplyServiceImpl implements ApplyService{
	@Autowired
	private ApplyDAO ApplyDAO;
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public ApplyVO readApply(int id) throws Exception {
		return ApplyDAO.read(id);
	}
	
	public List<ApplyVO> readApplyList() throws Exception{
		return ApplyDAO.readList();
	}
	
	public void addApply(ApplyVO vo) throws Exception {
		ApplyDAO.add(vo);
	}
	
	public void deleteApply(int id) throws Exception {
		ApplyDAO.delete(id);
	}
	
	public void updateApply(ApplyVO vo) throws Exception {
		ApplyDAO.update(vo);
	}
	public List<ApplyVO> readListByPostID(int id) throws Exception{
		return ApplyDAO.readListByPostID(id);
	}
	public boolean checkOverlap(List<ApplyVO> list, ApplyVO vo) throws Exception{
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPostID() == vo.getPostID() && list.get(i).getYoutuberID() == vo.getYoutuberID())
				return false;
		}
		return true;
	}
}