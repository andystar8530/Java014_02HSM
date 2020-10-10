package newlywed.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import newlywed.dao.NewlywedDao;
import newlywed.model.NewlywedBean;
import partner_h.quotecontract.main.model.QuoteContractBean;
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

	@SuppressWarnings("unchecked")
	@Override
	public List<QuoteContractBean> getNewlyQuotes(String m_Id) {
		List<QuoteContractBean> list =null;
		String hql ="FROM QuoteContractBean qcb WHERE qcb.m_Id = :m_Id" ;
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .setParameter("m_Id", m_Id)
//					  .setParameter("status", 0)
					  .getResultList();
		return list;
	}

	//status: 0:未報價, 1:未簽約, 2:未訂金, 3:結案:完成服務, 4:結案:放棄服務
	@SuppressWarnings("unchecked")
	@Override
	public List<QuoteContractBean> getNewlyStatusQuotes(String m_Id, int status) {
		List<QuoteContractBean> list =null;
		String hql ="FROM QuoteContractBean qcb WHERE qcb.m_Id = :m_Id and qcb.qcStatus >0";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .setParameter("m_Id", m_Id)
//					  .setParameter("status", status)
					  .getResultList();
				return list;
	}
}
