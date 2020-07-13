package org.kpu.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.kpu.myweb.domain.RecipeVO;
import org.kpu.myweb.domain.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAOImpl implements RecipeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.myweb.mapper.recipeMapper";

	public RecipeVO read(String title) throws Exception {
		RecipeVO vo = sqlSession.selectOne(namespace+".selectByTitle", title);
		return vo;   
	}
 
	public List<RecipeVO> readList() throws Exception {
		List<RecipeVO> recipelist = new ArrayList<RecipeVO>();
		recipelist = sqlSession.selectList(namespace + ".selectAll");
		return recipelist;
	}
	
	public void add(RecipeVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
	}

	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(RecipeVO recipe) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", recipe);
	}
	
	public List<RecipeVO> search(SearchVO vo) throws Exception{
		List<RecipeVO> recipelist = new ArrayList<RecipeVO>();
		recipelist = sqlSession.selectList(namespace+".search", vo);
		return recipelist;
	}
	
	public void updateViewCnt(String title) throws Exception{
		sqlSession.update(namespace+".updateViewCnt",title);
	}

}
