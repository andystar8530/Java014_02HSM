package partner_h.quotecontract.main.dao.impl;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h.quotecontract.main.dao.QuoteContractItemDao;
import partner_h.quotecontract.main.model.QuoteContractItemBean;


@Repository
public class QuoteContractItemDaoImpl_Hibernate implements QuoteContractItemDao{

	@Autowired
	SessionFactory factory;
	
	public QuoteContractItemDaoImpl_Hibernate() {
	}
	//依訂單號查詢多筆 
	@SuppressWarnings("unchecked")
	@Override
	public List <QuoteContractItemBean> getQuote(int qcId) {
		List <QuoteContractItemBean> list = null;
		String hql = "FROM QuoteContractItemBean qcb WHERE qcb.qcId = :id";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .setParameter("qcId", qcId)
					  .getResultList();
		return list;
	}
	
	/*計算單筆合約總計*/
	@Override
	public double findItemAmount(QuoteContractItemBean qcItemBean) {
		double subtotal = qcItemBean.getQcdAmount();
		return subtotal;
	}
}
