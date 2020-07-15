package org.kpu.myweb.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.kpu.myweb.domain.YoutuberVO;

public interface YoutuberService {
	public YoutuberVO readYoutuber(int id) throws Exception;
	public List<YoutuberVO> readYoutuberList() throws Exception;
	public void addYoutuber(YoutuberVO youtuber) throws Exception;
	public void deleteYoutuber(int id) throws Exception; 
	public void updateYoutuber(YoutuberVO youtuber) throws Exception;
	public boolean login(YoutuberVO vo,HttpSession session) throws Exception;
	public YoutuberVO viewYoutuber(YoutuberVO vo) throws Exception;
	public void logout(HttpSession session) throws Exception;
}
