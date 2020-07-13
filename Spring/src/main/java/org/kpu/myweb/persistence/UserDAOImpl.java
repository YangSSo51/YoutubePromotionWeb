package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.myweb.mapper.userMapper";

	public UserVO read(String id) throws Exception {
	
		UserVO vo = sqlSession.selectOne(namespace+".selectByid", id);
		return vo;   
	}
 
	public List<UserVO> readList() throws Exception {
		List<UserVO> userlist = new ArrayList<UserVO>();
		userlist = sqlSession.selectList(namespace + ".selectAll");
		return userlist;
	}
	
	public void add(UserVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}

	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(UserVO user) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", user);
	}
	
	public boolean login(UserVO user) throws Exception{
		String name=sqlSession.selectOne(namespace+".login",user);
		return (name==null)?false:true;
	}
	
	public UserVO viewUser(UserVO user) throws Exception{
		return sqlSession.selectOne(namespace+".viewUser",user);
		
	}

}
