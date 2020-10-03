package partner_h._01_profolios.dao.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h._01_profolios.dao.PortfoliosDetailDao;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.model.PortfoliosDetailsBean;
@Repository
public class PortfoliosDaoDetailImpl implements PortfoliosDetailDao {

	@Autowired
	SessionFactory factory ; 
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosDetailsBean> getPfDetailsBypfmId(int pfmId) {
		Session session = factory.getCurrentSession();
		List<PortfoliosDetailsBean> list = null;
		String hql = "FROM PortfoliosDetailsBean WHERE pfmId = :pfmId";
		list = session.createQuery(hql)
				.setParameter("pfmId", pfmId)
				.getResultList();
		return list;
	}

	@Override
	public void addPortfolioDetails(PortfoliosDetailsBean pfdBean) {
		Session session = factory.getCurrentSession();
		PortfoliosBean pfBean = session.get(PortfoliosBean.class,pfdBean.getPfmId());
		pfdBean.setPortfolioBean(pfBean);		
		session.save(pfdBean);
		
	}

	@Override
	public int updatePortfolioDetail(PortfoliosDetailsBean pfdBean) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(pfdBean);
		n++ ; 
		return n ;
		
	}

	@Override
	public int deletePortfolioDetail(PortfoliosDetailsBean pfdBean) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		session.delete(pfdBean);
		n++ ; 
		return n ;
		
		
	}

	@Override
	public PortfoliosDetailsBean getPortfolioDetailsBypfdId(int pfdId) {
		Session session = factory.getCurrentSession();
		PortfoliosDetailsBean pfdBean = null; 
		pfdBean = session.get(PortfoliosDetailsBean.class, pfdId);
		return pfdBean ;
	}
	
}
