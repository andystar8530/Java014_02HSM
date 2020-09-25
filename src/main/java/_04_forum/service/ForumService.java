package _04_forum.service;

import java.util.List;

import _04_forum.model.CategoriesBean;
import _04_forum.model.ForumBean;

public interface ForumService {
	
	List<ForumBean> getAllPosts();
	
	public void addPost(ForumBean newPost);
	
	CategoriesBean getCategoryById(int categoryId);
	
	List<CategoriesBean> getCategoryList();
	
	public ForumBean getPostById(int postId);

}
