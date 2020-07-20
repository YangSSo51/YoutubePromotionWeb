package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.InviteVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InviteDAOImpl  implements InviteDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.myweb.mapper.inviteMapper";

	public void add(InviteVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}
	
	public List<InviteVO> readList() throws Exception {
		List<InviteVO> postlist = new ArrayList<InviteVO>();
		postlist = sqlSession.selectList(namespace + ".selectAll");
		return postlist;
	}

	public InviteVO read(int id) throws Exception {
		InviteVO vo = sqlSession.selectOne(namespace+".selectById", id); 
		return vo;   
	}
	
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(InviteVO vo) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", vo);
	}
}
