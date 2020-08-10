package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.EnterpriseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EnterpriseDAOImpl implements EnterpriseDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private static final String namespace = "org.kpu.myweb.mapper.enterpriseMapper";

	public EnterpriseVO read(int id) throws Exception {
		EnterpriseVO vo = sqlSession.selectOne(namespace+".selectById", id);
		return vo;   
	}
 
	public List<EnterpriseVO> readList() throws Exception {
		List<EnterpriseVO> userlist = new ArrayList<EnterpriseVO>();
		userlist = sqlSession.selectList(namespace + ".selectAll");
		return userlist;
	}
	
	public void add(EnterpriseVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	} 

	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(EnterpriseVO user) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", user);
	}
	
}
