package support.article.dao.impl;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import support.article.dao.ArticleInfoDao;
import support.article.model.PlateannouncementBean;

@Repository
public class ArticleDao implements ArticleInfoDao {

	@Autowired
	SessionFactory factory;
	
	
	
	public ArticleDao() {

	}



	@Override
	public int saveArticle(PlateannouncementBean bean) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(bean);
		n++;
		return n;
	}



}
