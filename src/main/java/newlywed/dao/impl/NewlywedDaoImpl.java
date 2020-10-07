package newlywed.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import newlywed.dao.NewlywedDao;
import newlywed.model.NewlywedBean;
@Repository
public class NewlywedDaoImpl implements NewlywedDao {

	@Autowired
	SessionFactory factory;
	
	public NewlywedDaoImpl(){
		
	}
	
	@Override
	public boolean idExists(String id) {
		Session session =factory.getCurrentSession();
		boolean exist =false;
		String hql="FROM NewlywedBean n WHERE n.N_nickname = :nickname";
		@SuppressWarnings("unchecked")
		List<NewlywedBean> beans = (List<NewlywedBean>) session.createQuery(hql)
		.setParameter("nickname", id)
		.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}
		
		return exist;
	}

	@Override
	public int saveNewlyed(NewlywedBean nb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(nb);
		n++;
		return n;
	}

	@Override
	public NewlywedBean queryNewlywed(Integer id) {
		NewlywedBean nb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM NewlywedBean m WHERE m.memberBean.m_No = :mid";
		@SuppressWarnings("unchecked")
		List<NewlywedBean> beans = (List<NewlywedBean>) session.createQuery(hql)
										.setParameter("mid", id)
										.getResultList();
		if (beans.size() > 0) {
			nb = beans.get(0);		
	}
		return nb;
}
}
