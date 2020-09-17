package partner_h.quotecontract.main.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h.quotecontract.main.dao.QuoteContractDao;
import partner_h.quotecontract.main.model.QuoteContractBean;



@Repository
public class QuoteContractDaoImpl_Hibernate implements QuoteContractDao {
	
	private int p_Id =0;//合作商ID
	
	@Autowired
	private SessionFactory factory;
	int qcId = 0;//報價單ID
	
	//預設建構子
	public QuoteContractDaoImpl_Hibernate() {
	}
	
	//依訂單號查詢
	@Override
	public QuoteContractBean getQuote(int qcId) {
		QuoteContractBean qcb = null;
		Session session = factory.getCurrentSession();
		qcb = session.get(QuoteContractBean.class, qcId);
		return qcb;
	}
	
	//新增報價
	@Override
	public void insertQuote(QuoteContractBean qcb) {
		
	}

	//依合作商ID 查詢 報價
	@Override
	public QuoteContractBean getP_Id(int p_Id) {

		return null;
	}

	//依合約名稱 查詢 單一筆報價
	@Override
	public QuoteContractBean getQcName(String qcName) {
		return null;
	}
	
	//查詢 所有報價單
	@SuppressWarnings({ "unchecked"})
	@Override
	public List<QuoteContractBean> getAllQuotes() {
		List<QuoteContractBean> list = null;
		String hql = "FROM QuoteContractBean";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	//查詢 合作商多筆報價
	@SuppressWarnings("unchecked")
	@Override
	public List<QuoteContractBean> getPartnerQuotes(int p_Id) {
		List<QuoteContractBean> list = null;
		String hql = "FROM QuoteContractBean qcb WHERE qbc.p_Id = :pid";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .setParameter("pid", p_Id)
					  .getResultList();
		return list;
	}

	



}
