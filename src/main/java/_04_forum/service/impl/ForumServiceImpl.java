package _04_forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _04_forum.dao.ForumDao;
import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;
import _04_forum.service.ForumService;

@Service
@Transactional
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDao dao;

	@Override
	public List<ForumBean> getAllPosts() {
		return dao.getAllPosts();
	}
	
	@Override
	public List<ForumBean> getPostPage(int pageNo) {
		return dao.getPostPage(getAllPosts(), pageNo);
	}
	
	@Override
	public int lastPage() {
		int nums = getAllPosts().size();
		if(nums%5==0) {
			return nums/5;
		}else {
			return nums/5+1;
		}
	}

	@Override
	public void addPost(ForumBean newPost) {
		dao.addPost(newPost);
		
	}

	@Override
	public CategoriesBean getCategoryById(int categoryId) {
		return dao.getCategoryById(categoryId);
	}

	@Override
	public List<CategoriesBean> getCategoryList() {
		return dao.getCategoryList();
	}

	@Override
	public ForumBean getPostById(int postId) {
		return dao.getPostById(postId);
	}

	@Override
	public List<CommentBean> getCommentById(int postId) {
		return dao.getCommentById(postId);
	}

	@Override
	public void addComment(CommentBean cb) {
		dao.addComment(cb);
	}

}
