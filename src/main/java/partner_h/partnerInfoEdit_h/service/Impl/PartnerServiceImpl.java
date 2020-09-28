package partner_h.partnerInfoEdit_h.service.Impl;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import partner_h.partnerInfoEdit_h.dao.PartnerDao;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;
@Service
public class PartnerServiceImpl implements PartnerService {
	@Autowired
	PartnerDao dao ;
	
//	SessionFactory factory;
	//dao 不能commit，交給service去做try-catch攔截例外
	public PartnerServiceImpl() {
//		this.dao = new PartnerDaoImpl_Hibernate();
//		this.factory = HibernateUtils.getSessionFactory();
	}

	
	@Transactional
	@Override
	public PartnerBean getPartner(int p_id) {	
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
		PartnerBean pb = null;
//		try {
//			tx = session.beginTransaction();
			pb = dao.getPartner(p_id);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!= null) {
//				tx.rollback();
//			}				
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}

		return pb;
	}



	

	@Transactional
	@Override
	public int savePartner(PartnerBean pb) {
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
		int n = 0;
//		try {
//			tx = session.beginTransaction();
			n = dao.savePartner(pb);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!= null) {
//				tx.rollback();
//			}				
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}

		return n ;
	}


	@Transactional
	@Override
	public int updatePartner(PartnerBean pb) {
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
		int n = 0;
//		try {
//			tx = session.beginTransaction();
			n = dao.updatePartner(pb);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!= null) {
//				tx.rollback();
//			}				
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}

		return n ;
	}


	@Transactional
	@Override
	public boolean idExists(String m_No) {
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
		boolean exist = false;
//		try {
//			tx = session.beginTransaction();
			exist = dao.idExists(m_No);
//			tx.commit();
//		}catch(Exception ex) {
//			if(tx!= null) {
//				tx.rollback();
//			}				
//			ex.printStackTrace();
//			throw new RuntimeException(ex);
//		}
//		
		
		return exist ;
	}

	@Transactional
	@Override
	public PartnerBean queryPartner(int p_mId)  {

		return dao.queryPartner(p_mId);
	
	}

	@Transactional
	@Override
	public List<String> getServiceList() {
		return dao.getServiceList();
	}	
	
	@Transactional
	@Override
	public List<PartnerBean> getPartnerByService(String p_service) {
		return dao.getPartnerByService(p_service);
	}

	@Transactional
	@Override
	public List<PartnerBean> getPartnerByArea(int p_area) {
		return dao.getPartnerByArea(p_area);
	}


	


	
}
