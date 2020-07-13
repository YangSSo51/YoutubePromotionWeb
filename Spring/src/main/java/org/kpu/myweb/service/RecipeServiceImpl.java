package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.RecipeVO;
import org.kpu.myweb.domain.SearchVO;
import org.kpu.myweb.persistence.RecipeDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	private RecipeDAO recipeDAO;
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	public RecipeVO readRecipe(String id) throws Exception {
		recipeDAO.updateViewCnt(id);
		return recipeDAO.read(id);
	}
	
	public List<RecipeVO> readRecipeList() throws Exception{
		return recipeDAO.readList();
	}
	
	public void addRecipe(RecipeVO recipe) throws Exception {
		recipeDAO.add(recipe);
	}
	
	public void deleteRecipe(String id) throws Exception {
		recipeDAO.delete(id);
	}
	
	public void updateRecipe(RecipeVO recipe) throws Exception {
		recipeDAO.update(recipe);
	}
	
	public List<RecipeVO> searchRecipe(SearchVO search) throws Exception{
		return recipeDAO.search(search);
	}
}
