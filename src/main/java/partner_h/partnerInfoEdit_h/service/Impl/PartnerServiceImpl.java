package partner_h.partnerInfoEdit_h.service.Impl;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
	public PartnerBean getPartner(int p_mId) {	
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
		PartnerBean pb = null;
//		try {
//			tx = session.beginTransaction();
			pb = dao.getPartner(p_mId);
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
	public PartnerBean queryPartner(String p_mId) {
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
		PartnerBean pb = null;
//		try {
//			tx = session.beginTransaction();
			pb = dao.queryPartner(p_mId);
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


	
	
	
	
	
	
}
