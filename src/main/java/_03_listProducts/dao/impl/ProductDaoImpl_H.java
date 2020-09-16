package _03_listProducts.dao.impl;

import java.util.ArrayList;
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

	@Override
	public ProductBean getProduct(int P_Id) {
		ProductBean bean = null;
        Session session = factory.getCurrentSession();
        bean = session.get(ProductBean.class, P_Id);
        return bean;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT b.p_Category FROM ProductBean b";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByCategory(String category) {
		String hql = "FROM ProductBean bb WHERE bb.p_Category = :category";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					.setParameter("category", category)
					.getResultList();
		return list;
	}

	@Override
	public ProductBean getProductById(int p_Id) {
		Session session = factory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, p_Id);
		return pb;
	}


}