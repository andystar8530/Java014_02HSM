package support.article.service;

import java.util.List;

import support.article.model.PlateannouncementBean;

public interface ArticleInfoService {

	PlateannouncementBean getArticleById(int paId);

	List<PlateannouncementBean> getArticles();

	int saveArticle(PlateannouncementBean bean);
	
	void updateArticle(PlateannouncementBean bean); 

	void deleteArticleByPrimaryKey(int key);
	
}