package _04_forum.dao;

import java.util.List;

import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;

public interface ForumDao {

	List<ForumBean> getAllPosts();
	
	public void addPost(ForumBean newPost);
	
	CategoriesBean getCategoryById(int categoryId);
	
	List<CategoriesBean> getCategoryList();
	
	public ForumBean getPostById(int postId);
	
	List<CommentBean> getCommentById(int postId);
	
	public void addComment(CommentBean cb);
	
}
