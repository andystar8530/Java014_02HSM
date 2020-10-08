package _04_forum.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _04_forum.dao.ForumDao;
import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;
import _04_forum.model.LikeOrHateBean;
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
	public List<ForumBean> getPostPage(int pageNo, Integer type) {
		if(type==null) {			
			return dao.getPostPage(getAllPosts(), pageNo);
		}else {			
			return dao.getPostPage(getPostByCategory(type), pageNo);
		}
	}
	
	@Override
	public int lastPage(Integer type) {
		List<ForumBean> li = new ArrayList<>();
		if(type==null) {			
			li = dao.getAllPosts();
		}else {			
			li = dao.getPostByCategory(type);
		}
		int nums = li.size();
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
		ForumBean fb = dao.getPostById(postId);
		List<LikeOrHateBean> loh = dao.getLoh(postId);
		fb.setfCategory(fb.getCategoriesBean().getPcNo());
		fb.setfLike(getLike(loh));
		fb.setfHate(getHate(loh));
		return fb;
	}

	@Override
	public List<CommentBean> getCommentById(int postId) {
		return dao.getCommentById(postId);
	}

	@Override
	public void addComment(CommentBean cb) {
		dao.addComment(cb);
	}

	@Override
	public void saveLike(LikeOrHateBean loh) {
		dao.saveLike(loh);
	}

	@Override
	public int getLike(List<LikeOrHateBean> loh) {
		int count = 0;
		for(LikeOrHateBean bean:loh) {
			if(bean.getLikeOrHate()==1) {
				count++;
			}
		}
		return count;
	}

	@Override
	public int getHate(List<LikeOrHateBean> loh) {
		int count = 0;
		for(LikeOrHateBean bean:loh) {
			if(bean.getLikeOrHate()==2) {
				count++;
			}
		}
		return count;
	}

	@Override
	public LikeOrHateBean getSingleLoh(int postId, int memId) {
		return dao.getSingleLoh(postId, memId);
	}

	@Override
	public List<ForumBean> getPostByCategory(Integer type) {
		return dao.getPostByCategory(type);
	}

	@Override
	public void setViews(int postId) {
		ForumBean fb = getPostById(postId);
		fb.setPostView(fb.getPostView()+1);
		dao.UpdateViews(fb);
	}


}
