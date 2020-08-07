package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.YoutuberVO;

public interface YoutuberDAO {
	public void add(YoutuberVO youtuber) throws Exception;
	public List<YoutuberVO> readList() throws Exception;
	public YoutuberVO read(int id) throws Exception;
	public void delete(int id) throws Exception;
	public void update(YoutuberVO youtuber) throws Exception;
}
