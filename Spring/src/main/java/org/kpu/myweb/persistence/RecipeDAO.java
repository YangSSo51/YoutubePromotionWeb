package org.kpu.myweb.persistence;

import java.util.List;

import org.kpu.myweb.domain.RecipeVO;
import org.kpu.myweb.domain.SearchVO;

public interface RecipeDAO {
	public void add(RecipeVO recipe) throws Exception;
	public List<RecipeVO> readList() throws Exception;
	public RecipeVO read(String id) throws Exception;
	public void delete(String id) throws Exception;
	public void update(RecipeVO recipe) throws Exception;
	public List<RecipeVO> search(SearchVO vo) throws Exception; 
	public void updateViewCnt(String title) throws Exception;
}
