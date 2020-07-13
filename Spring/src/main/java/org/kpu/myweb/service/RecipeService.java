package org.kpu.myweb.service;

import java.util.List;

import org.kpu.myweb.domain.RecipeVO;
import org.kpu.myweb.domain.SearchVO;

public interface RecipeService {
	public RecipeVO readRecipe(String id) throws Exception;
	public List<RecipeVO> readRecipeList() throws Exception;
	public void addRecipe(RecipeVO recipe) throws Exception;
	public void deleteRecipe(String id) throws Exception; 
	public void updateRecipe(RecipeVO recipe) throws Exception;
	public List<RecipeVO> searchRecipe(SearchVO search) throws Exception;
}
