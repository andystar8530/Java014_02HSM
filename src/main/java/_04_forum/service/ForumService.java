package _04_forum.service;

import java.util.List;

import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;

public interface ForumService {
	
	List<ForumBean> getAllPosts();
	
	List<ForumBean> getPostPage(int pageNo);
	
	public int lastPage();
	
	public void addPost(ForumBean newPost);
	
	CategoriesBean getCategoryById(int categoryId);
	
	List<CategoriesBean> getCategoryList();
	
	public ForumBean getPostById(int postId);
	
	List<CommentBean> getCommentById(int postId);
	
	public void addComment(CommentBean cb);

}
