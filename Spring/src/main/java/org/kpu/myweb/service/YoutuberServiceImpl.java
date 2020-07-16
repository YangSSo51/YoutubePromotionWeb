package org.kpu.myweb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		System.out.println("Service"+youtuber.getUrl());
	}
	
	public YoutuberVO viewYoutuber(YoutuberVO youtuber) throws Exception {
		return YoutuberDAO.viewYoutuber(youtuber);
	}
	
	public boolean login(YoutuberVO youtuber,HttpSession session) throws Exception {
		boolean result= YoutuberDAO.login(youtuber);
		if(result) {
			YoutuberVO Youtuber2 = viewYoutuber(youtuber);
			session.setAttribute("id", Youtuber2.getId());
			session.setAttribute("Youtubername", Youtuber2.getName());
		}
		return result;
	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}

}