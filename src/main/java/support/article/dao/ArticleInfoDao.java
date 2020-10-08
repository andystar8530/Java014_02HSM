package support.article.dao;

import java.util.List;


import support.article.model.PlateannouncementBean;

public interface ArticleInfoDao {
	PlateannouncementBean getArticleById(int PAID);
	
	List<PlateannouncementBean> getArticles();

	int saveArticle(PlateannouncementBean bean);
	
	void updateArticle(PlateannouncementBean bean); 

	void deleteArticleByPrimaryKey(int key);


}