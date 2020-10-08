package support.article.dao.impl;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import support.article.dao.ArticleInfoDao;
import support.article.model.PlateannouncementBean;

@Repository
public class ArticleDao implements ArticleInfoDao {

	private static final Object paId = null;
	@Autowired
	SessionFactory factory;
	
	
	
	public ArticleDao() {

	}
	@Override
	public PlateannouncementBean getArticleById(int paId) {
//		CustomerBean bean = null;
//		Session session = factory.getCurrentSession();
//		bean = session.get(CustomerBean.class, id);
//		return bean;
		PlateannouncementBean bean = null;
		Session session = factory.getCurrentSession();
		String hql  = "FROM PlateannouncementBean cb WHERE cb.paId = :id";
		try {
			bean = (PlateannouncementBean)session.createQuery(hql)
									             .setParameter("id", paId)
									             .getSingleResult();
		} catch(NoResultException e) {
			;  // 表示查無紀錄
		}
		
		return bean;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PlateannouncementBean> getArticles() {
		Session session = factory.getCurrentSession();
		String hql  = "FROM PlateannouncementBean";
		List<PlateannouncementBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}



	@Override
	public int saveArticle(PlateannouncementBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}
	@Override
	public void updateArticle(PlateannouncementBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);
		
	}
	
	@Override
	public void deleteArticleByPrimaryKey(int key) {
		Session session = factory.getCurrentSession();
		PlateannouncementBean plateann = new PlateannouncementBean();
		plateann.setPaId(key);
		session.delete(plateann);
	}
	
	



}
