package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.InviteVO;

public interface InviteDAO {
	public void add(InviteVO invite) throws Exception;
	public List<InviteVO> readList() throws Exception;
	public InviteVO read(int id) throws Exception;
	public void delete(int id) throws Exception;
	public void update(InviteVO invite) throws Exception;
	public List<InviteVO> readListByYoutuberID(int youtuberID) throws Exception;
}
