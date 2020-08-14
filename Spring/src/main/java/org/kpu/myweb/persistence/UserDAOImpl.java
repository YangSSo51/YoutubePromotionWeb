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

	public UserVO read(int id) throws Exception {
		UserVO vo = sqlSession.selectOne(namespace+".selectById", id);
		return vo;   
	}
 
	public List<UserVO> readList() throws Exception {
		List<UserVO> Userlist = sqlSession.selectList(namespace + ".selectAll");
		return Userlist;
	}
	
	public void add(String[] array) throws Exception {
		sqlSession.insert(namespace + ".insert", array);
	}

	public void delete(int id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(UserVO User) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", User);
	}
	
	public boolean login(UserVO User) throws Exception{
		String id=sqlSession.selectOne(namespace+".login",User);
		return (id==null)?false:true;
	}
	
	public UserVO viewUser(UserVO User) throws Exception{
		return sqlSession.selectOne(namespace+".viewUser",User);
	}
	public UserVO readByUserID(int id) throws Exception {
		return sqlSession.selectOne(namespace+".selectByUserID", id);
	}
	public UserVO readByUsername(String username) throws Exception {
		return sqlSession.selectOne(namespace+".selectByUsername", username);
	}
	public String readAuthByUsername(String username) throws Exception{
		return sqlSession.selectOne(namespace+".selectAuthByUsername", username);
	}
	public Integer readIDByUsername(String username) throws Exception{
		return sqlSession.selectOne(namespace+".selectIdByUsername", username);
	}
}
