package favorites.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import favorites.model.FavoritesBean;
import newlywed.model.NewlywedBean;
@Repository
public class FavoritesDao {

	@Autowired
	SessionFactory factory;
	
	public int saveFavorites(FavoritesBean fb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(fb);
		n++;
		return n;
	}
	public List<FavoritesBean> queryFavorites(Integer id) {
		FavoritesBean fb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM FavoritesBean f WHERE f.newlywedBean.memberBean.m_No = :mid";
		@SuppressWarnings("unchecked")
		List<FavoritesBean> beans = (List<FavoritesBean>) session.createQuery(hql)
										.setParameter("mid", id)
										.getResultList();
//		if (beans.size() > 0) {
//			nb = beans.get(0);		
		return beans;
}
}
