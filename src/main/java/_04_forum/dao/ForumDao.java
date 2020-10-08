package _04_forum.dao;

import java.util.List;

import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;
import _04_forum.model.LikeOrHateBean;

public interface ForumDao {

	List<ForumBean> getAllPosts();
	
	List<ForumBean> getPostPage(List<ForumBean> allFb, int pageNo);
	
	List<ForumBean> getPostByCategory(Integer type);
	
	public void addPost(ForumBean newPost);
	
	CategoriesBean getCategoryById(int categoryId);
	
	List<CategoriesBean> getCategoryList();
	
	public ForumBean getPostById(int postId);
	
	List<CommentBean> getCommentById(int postId);
	
	public void addComment(CommentBean cb);
	
	public void saveLike(LikeOrHateBean loh);
	
	List<LikeOrHateBean> getLoh (int postId);
	
	LikeOrHateBean getSingleLoh(int postId, int memId);
	
	void UpdateViews(ForumBean newPost);
	
}
