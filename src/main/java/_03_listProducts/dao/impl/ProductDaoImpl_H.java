package _03_listProducts.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _03_listProducts.dao.ProductDao;
import _03_listProducts.model.ProductBean;

@Repository
public class ProductDaoImpl_H implements ProductDao {
	
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		List<ProductBean> list = new LinkedList<>();
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	

}