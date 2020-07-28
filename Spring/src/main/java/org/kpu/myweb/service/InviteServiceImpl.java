package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.InviteVO;
import org.kpu.myweb.persistence.InviteDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InviteServiceImpl implements InviteService{
	@Autowired
	private InviteDAO InviteDAO;
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public InviteVO readInvite(int id) throws Exception {
		return InviteDAO.read(id);
	}
	
	public List<InviteVO> readInviteList() throws Exception{
		return InviteDAO.readList();
	}
	
	public void addInvite(InviteVO vo) throws Exception {
		InviteDAO.add(vo);
	}
	
	public void deleteInvite(int id) throws Exception {
		InviteDAO.delete(id);
	}
	
	public void updateInvite(InviteVO vo) throws Exception {
		InviteDAO.update(vo);
	}
	public boolean checkOverlap(List<InviteVO> list, InviteVO vo) throws Exception{
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getPostID() == vo.getPostID() && list.get(i).getYoutuberID() == vo.getYoutuberID())
				return false;
		}
		return true;
	}
	public List<InviteVO> readListByYoutuberID(int youtuberID) throws Exception{
		return InviteDAO.readListByYoutuberID(youtuberID);
	}
	public List<InviteVO> readListByPostID(int postID) throws Exception{
		return InviteDAO.readListByPostID(postID);
	}
}