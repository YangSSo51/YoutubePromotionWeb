package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.YoutuberVO;
import org.kpu.myweb.persistence.YoutuberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YoutuberServiceImpl implements YoutuberService {
	
	@Autowired
	private YoutuberDAO YoutuberDAO;

	public YoutuberServiceImpl(YoutuberDAO youtuberDAO) {
		this.YoutuberDAO = youtuberDAO;
	}
	
	public YoutuberVO readYoutuber(int id) throws Exception {
		return YoutuberDAO.read(id);
	}
	
	public List<YoutuberVO> readYoutuberList() throws Exception{
		return YoutuberDAO.readList();
	}
	
	public void addYoutuber(YoutuberVO youtuber) throws Exception {
		YoutuberDAO.add(youtuber);
	}
	
	public void deleteYoutuber(int id) throws Exception {
		YoutuberDAO.delete(id);
	}
	
	public void updateYoutuber(YoutuberVO youtuber) throws Exception {
		YoutuberDAO.update(youtuber);
	}
	
}