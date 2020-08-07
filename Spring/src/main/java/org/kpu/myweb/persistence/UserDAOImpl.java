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
		UserVO vo = sqlSession.selectOne(namespace+".selectByid", id);
		return vo;   
	}
 
	public List<UserVO> readList() throws Exception {
		List<UserVO> Userlist = new ArrayList<UserVO>();
		Userlist = sqlSession.selectList(namespace + ".selectAll");
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
		String url=sqlSession.selectOne(namespace+".login",User);
		return (url==null)?false:true;
	}
	
	public UserVO viewUser(UserVO User) throws Exception{
		return sqlSession.selectOne(namespace+".viewUser",User);
	}
	public UserVO readByUserID(String username) throws Exception {
		return sqlSession.selectOne(namespace+".selectByUserID", username);
	}
	public List<String> readAuthByUserID(String userID) throws Exception{
		return sqlSession.selectOne(namespace+".selectAuthByUserID", userID);
	}
	public Integer readID(String username) throws Exception{
		return sqlSession.selectOne(namespace+".selectIdByUsername", username);
	}
}
