package partner_h.partnerInfoEdit_h.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.dao.MemberDao;
import _01_register.model.MemberBean;
import partner_h.partnerInfoEdit_h.dao.PartnerDao;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Repository
public class PartnerDaoImpl implements PartnerDao{

	@Autowired
	SessionFactory factory;
	@Autowired
	MemberDao dao;
	
	@Override
	public PartnerBean getPartner(int p_id) {
		PartnerBean pb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM PartnerBean WHERE p_id = :p_id";
		@SuppressWarnings("unchecked")
		List<PartnerBean> pbList = session.createQuery(hql)
									.setParameter("p_id", p_id)
									.getResultList();
		if(pbList.size()>0) {
			pb = pbList.get(0);
		}
		return pb; 
		
	}

	@Override
	public int updatePartner(PartnerBean pb) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		pb.setP_editTime( new java.sql.Timestamp(System.currentTimeMillis()));
		session.saveOrUpdate(pb);
		n++;
		return n;
	}

	@Override
	public int savePartner(PartnerBean pb) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		pb.setP_review(0.0);
		pb.setP_createTime( new java.sql.Timestamp(System.currentTimeMillis()));
		pb.setP_editTime( new java.sql.Timestamp(System.currentTimeMillis()));
	    session.save(pb);	
	    n++;
	    return n;
	}

	@Override
	public boolean idExists(String p_mId) {
		// TODO Auto-generated method stub
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PartnerBean queryPartner(int p_mId) {
		PartnerBean pb = null;
		String hql = "FROM PartnerBean WHERE p_mId =:p_mId" ;
		Session session = factory.getCurrentSession();
		List<PartnerBean> pbList = session.createQuery(hql)
				.setParameter("p_mId", p_mId)
				.getResultList();
			if(pbList.size()>0) {
				pb = pbList.get(0);
			}
			return pb; 
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getServiceList() {
		String hql = "SELECT DISTINCT p_service FROM PartnerBean";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PartnerBean> getPartnerByService(String p_service) {
		String hql = "FROM PartnerBean WHERE p_servie = :p_service";
		List<PartnerBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}



	@SuppressWarnings("unchecked")
	@Override
	public List<PartnerBean> getPartnerByArea(int p_area) {
		String hql = "FROM PartnerBean WHERE p_area = :p_area";
		List<PartnerBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	
	
	
	
	
}
