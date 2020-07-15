package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.EnterprisePostVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EnterprisePostDAOImpl implements EnterprisePostDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.myweb.mapper.recipeMapper";

	public void add(EnterprisePostVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}
	
	public List<EnterprisePostVO> readList() throws Exception {
		List<EnterprisePostVO> recipelist = new ArrayList<EnterprisePostVO>();
		recipelist = sqlSession.selectList(namespace + ".selectAll");
		return recipelist;
	}

	public EnterprisePostVO read(int id) throws Exception {
		EnterprisePostVO vo = sqlSession.selectOne(namespace+".selectById", id); // title -> id
		return vo;   
	}
	
	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(EnterprisePostVO vo) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", vo);
	}
	
	public void updateViewCnt(int id) throws Exception{
		sqlSession.update(namespace+".updateViewCnt", id);
	}

}
