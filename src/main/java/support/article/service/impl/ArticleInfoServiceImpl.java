package support.article.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import support.article.dao.ArticleInfoDao;
import support.article.model.PlateannouncementBean;
import support.article.service.ArticleInfoService;

@Transactional
@Service
public class ArticleInfoServiceImpl implements ArticleInfoService {
	@Autowired
	ArticleInfoDao dao;

	@Autowired
	SessionFactory factory;

	@Override
	public int saveArticle(PlateannouncementBean bean) {
		int n = 0;
		dao.saveArticle(bean);
		n++;
		return n;
	}


	

}
