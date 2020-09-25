package _04_forum.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _04_forum.dao.ForumDao;
import _04_forum.model.CategoriesBean;
import _04_forum.model.CommentBean;
import _04_forum.model.ForumBean;

@Repository
public class ForumDaoImpl implements ForumDao {

	@Autowired
	SessionFactory factory;

	@Override
	@SuppressWarnings("unchecked")
	public List<ForumBean> getAllPosts() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ForumBean";
		List<ForumBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public void addPost(ForumBean newPost) {
		Session session = factory.getCurrentSession();
		CategoriesBean cb = getCategoryById(newPost.getfCategory());
		newPost.setCategoriesBean(cb);
		session.save(newPost);
	}

	@Override
	public CategoriesBean getCategoryById(int categoryId) {
		Session session = factory.getCurrentSession();
		CategoriesBean cb = null;
		cb = session.get(CategoriesBean.class, categoryId);
		return cb;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<CategoriesBean> getCategoryList() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CategoriesBean";
		List<CategoriesBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public ForumBean getPostById(int postId) {
		Session session = factory.getCurrentSession();
		ForumBean fb = session.get(ForumBean.class, postId);
		return fb;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<CommentBean> getCommentById(int postId) {
		Session session = factory.getCurrentSession();
		List<CommentBean> list = null;
		String hql = "FROM CommentBean c where c.forumBean.fId = :p";
		list = session.createQuery(hql).setParameter("p", postId).getResultList();
		return list;
	}

	@Override
	public void addComment(CommentBean cb) {
		Session session = factory.getCurrentSession();
		ForumBean fb = getPostById(cb.getPostId());
		cb.setForumBean(fb);
		session.save(cb);
	}

}
