package partner_h._01_profolios.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h._01_profolios.dao.PortfoliosDao;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
@Repository
public class PortfoliosDaoImpl implements PortfoliosDao {
	
	
	@Autowired
	SessionFactory factory; 
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosBean> getAllPortfolios() {
		
		List<PortfoliosBean> pfList = new ArrayList<>();
		String hql ="FROM PortfoliosBean ORDER BY pfCreateTime DESC";
		Session session = null;
		session = factory.getCurrentSession();
		pfList = session.createQuery(hql).getResultList();
		
		return pfList;
		
	}

	@Override
	public void updatePortfolio(PortfoliosBean pfBean) {
		Session session = factory.getCurrentSession();
		session.saveOrUpdate(pfBean);
		
	}
	//**取得所有服務分類
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllPServices() {
		String hql = "SELECT DISTINCT p_service FROM PartnerBean";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	//***************未完成
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosBean> getPortfoliosByService(String pfService) {
		String hql= "FROM PortfoliosBean WHERE pfService = :pfService";
		Session session = factory.getCurrentSession();
		List<PortfoliosBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("pfService", pfService).getResultList();
		return list;
	}

	@Override
	public PortfoliosBean getPortfolioById(int pfmId) {
		Session session = factory.getCurrentSession();
		PortfoliosBean pfBean = session.get(PortfoliosBean.class,pfmId);
		return pfBean ; 
	}
	
	

	@Override
	public PartnerBean getPartnerById(int p_id) {
		Session session = factory.getCurrentSession();
		PartnerBean pb = null;
		pb = session.get(PartnerBean.class, p_id);
		return pb;
		
	}
	@Override
	public void addPortfolio(PortfoliosBean pfBean) {
		Session session = factory.getCurrentSession();
		PartnerBean pb = getPartnerById(pfBean.getP_id());
		pfBean.setPartnerBean(pb);
		pfBean.setPfCreateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		pfBean.setPfUpdateTime(new java.sql.Timestamp(System.currentTimeMillis()));
		session.save(pfBean);
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosBean> getPortfoliosByPartnerId(int p_id) {
		String hql= "FROM PortfoliosBean WHERE p_id = :p_id";
		Session session = factory.getCurrentSession();
		List<PortfoliosBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("p_id", p_id).getResultList();
		return list;
	}

	@Override
	public void deletePortfolioById(int pfmId) {
		Session session = factory.getCurrentSession();
		PortfoliosBean pfBean = session.get(PortfoliosBean.class, pfmId);
		session.delete(pfBean);
		
	}
	

	
		
}
