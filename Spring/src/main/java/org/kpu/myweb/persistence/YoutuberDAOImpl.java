package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.YoutuberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class YoutuberDAOImpl implements YoutuberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.myweb.mapper.youtuberMapper";

	public YoutuberVO read(int id) throws Exception {
	
		YoutuberVO vo = sqlSession.selectOne(namespace+".selectByid", id);
		return vo;   
	}
 
	public List<YoutuberVO> readList() throws Exception {
		List<YoutuberVO> youtuberlist = new ArrayList<YoutuberVO>();
		youtuberlist = sqlSession.selectList(namespace + ".selectAll");
		return youtuberlist;
	}
	
	public void add(YoutuberVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}

	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(YoutuberVO youtuber) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("DAO"+youtuber.getUrl());
	    sqlSession.update(namespace + ".update", youtuber);
	}
	
	public boolean login(YoutuberVO youtuber) throws Exception{
		String url=sqlSession.selectOne(namespace+".login",youtuber);
		return (url==null)?false:true;
	}
	
	public YoutuberVO viewYoutuber(YoutuberVO youtuber) throws Exception{
		return sqlSession.selectOne(namespace+".viewYoutuber",youtuber);
		
	}

}