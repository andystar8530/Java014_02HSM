package partner_h._01_profolios.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h._01_profolios.dao.PortfoliosDao;
import partner_h._01_profolios.model.PortfoliosBean;
@Repository
public class PortfoliosDaoImpl implements PortfoliosDao {
	
	
	@Autowired
	SessionFactory factory; 
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosBean> getAllPortfolios() {
		
		List<PortfoliosBean> pfList = new ArrayList<>();
		String hql ="FROM PortfoliosBean";
		Session session = null;
		session = factory.getCurrentSession();
		pfList = session.createQuery(hql).getResultList();
		
		return pfList;
		
	}
//***************未完成
	@Override
	public void updatePortfolio(PortfoliosBean pfBean) {
		Session session = null;
		session = factory.getCurrentSession();
		pfBean = session.get(PortfoliosBean.class, pfBean.getP_Id());
		session.update(pfBean);
		
	}
	//***************未完成
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllPFCategory() {
		String hql = "SELECT DISTINCT pfCategory FROM PortfoliosBean";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	//***************未完成
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosBean> getProductsByCategory(String category) {
		String hql= "FROM PortfoliosBean WHERE pfCategory = :pfCategory";
		Session session = factory.getCurrentSession();
		List<PortfoliosBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("pfCategory", category).getResultList();
		return list;
	}

	@Override
	public PortfoliosBean getProductById(int pfmId) {
		Session session = factory.getCurrentSession();
		PortfoliosBean pfBean = session.get(PortfoliosBean.class,pfmId);
		return pfBean ; 
	}

	@Override
	public void addProduct(PortfoliosBean product) {
		// TODO Auto-generated method stub
		
	}

		
}
