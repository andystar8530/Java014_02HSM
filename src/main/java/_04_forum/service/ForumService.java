package _04_forum.service;

import java.util.List;

import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;
import _04_forum.model.LikeOrHateBean;

public interface ForumService {
	
	List<ForumBean> getAllPosts();
	
	List<ForumBean> getPostPage(int pageNo, Integer type);
	
	List<ForumBean> getPostByCategory(Integer type);
	
	public void addPost(ForumBean newPost);
	
	CategoriesBean getCategoryById(int categoryId);
	
	List<CategoriesBean> getCategoryList();
	
	public ForumBean getPostById(int postId);
	
	List<CommentBean> getCommentById(int postId);
	
	public void addComment(CommentBean cb);
	
	public void saveLike(LikeOrHateBean loh);
	
	public int getLike(List<LikeOrHateBean> loh);
	
	public int getHate(List<LikeOrHateBean> loh);
	
	LikeOrHateBean getSingleLoh(int postId, int memId);

	int lastPage(Integer type);
	
	public void setViews(int postId); 
	
	public int searchlastpage(String search);
	
	public List<ForumBean> getSearchList(List<ForumBean> li, String search);
	
	public void deletePost(int postId);

	

}