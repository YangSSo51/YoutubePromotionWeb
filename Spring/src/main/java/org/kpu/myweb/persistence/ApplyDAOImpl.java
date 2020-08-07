package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.ApplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDAOImpl  implements ApplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.myweb.mapper.applyMapper";

	public void add(ApplyVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}
	
	public List<ApplyVO> readList() throws Exception {
		List<ApplyVO> applylist = new ArrayList<ApplyVO>();
		applylist = sqlSession.selectList(namespace + ".selectAll");
		return applylist;
	}

	public ApplyVO read(int id) throws Exception {
		ApplyVO vo = sqlSession.selectOne(namespace+".selectById", id); 
		return vo;   
	}
	
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(ApplyVO vo) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", vo);
	}
	
	public List<ApplyVO> readListByPostID(int id) throws Exception {
		List<ApplyVO> applylist = new ArrayList<ApplyVO>();
		applylist = sqlSession.selectList(namespace + ".selectByPostId", id);
		return applylist;
	}
	public List<ApplyVO> readListByYoutuberID(int id) throws Exception {
		List<ApplyVO> applylist = new ArrayList<ApplyVO>();
		applylist = sqlSession.selectList(namespace + ".selectByYoutuberId", id);
		return applylist;
	}
}
