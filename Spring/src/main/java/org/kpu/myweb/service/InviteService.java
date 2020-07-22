package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.InviteVO;

public interface InviteService {
	public InviteVO readInvite(int id) throws Exception;
	public List<InviteVO> readInviteList() throws Exception;
	public void addInvite(InviteVO vo) throws Exception;
	public void deleteInvite(int id) throws Exception; 
	public void updateInvite(InviteVO vo) throws Exception;
	public boolean checkOverlap(List<InviteVO> list, InviteVO vo) throws Exception; // 리스트 내 중복 체크
	public List<InviteVO> readListByYoutuberID(int youtuberID) throws Exception;
}

