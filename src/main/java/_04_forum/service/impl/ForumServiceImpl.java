package _04_forum.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _04_forum.dao.ForumDao;
import _04_forum.model.CategoriesBean;
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


}
