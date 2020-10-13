package partner_h.quotecontract.main.dao.impl;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h.quotecontract.main.dao.QuoteContractDao;
import partner_h.quotecontract.main.model.QuoteContractBean;
/*
 * 1.新增一筆訂單到quoteContract表格內
 * 2.查詢quoteContract單筆訂單
 * 3.查詢quoteContract表格內的所有訂單
 * 
 */

@Repository
public class QuoteContractDaoImpl_Hibernate implements QuoteContractDao {
	
	@Autowired
	private SessionFactory factory;
	int qcId = 0;//報價單ID
	
	//預設建構子
	public QuoteContractDaoImpl_Hibernate() {
	}
		
	//新增報價
	@Override
	public Object save(QuoteContractBean bean) {
		Session session = factory.getCurrentSession();
//		bean.setQcDate(new java.util.Date());
		return session.save(bean);
	}

	
	//查詢 合作商多筆報價 (已完成)
	@SuppressWarnings("unchecked")
	@Override
	public List<QuoteContractBean> getPartnerQuotes(int p_Id) {
		List<QuoteContractBean> list = null;
		String hql = "FROM QuoteContractBean qcb WHERE qcb.p_Id = :pid";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
					  .setParameter("pid", p_Id)
					  .getResultList();
		return list;
	}
	
	
	//依合作商ID 查詢 報價
	@Override
	public QuoteContractBean getP_Id(int p_Id) {
		QuoteContractBean qcb = null;
		Session session  = factory.getCurrentSession();
		qcb = session.get(QuoteContractBean.class, p_Id);
		return qcb;
	}

	//依合約名稱 查詢 單一筆報價
	@Override
	public QuoteContractBean getQcName(String qcName) {
		QuoteContractBean qcb = null;
		Session session  = factory.getCurrentSession();
		qcb = session.get(QuoteContractBean.class, qcName);
		return qcb;
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

	
	//依據案號查詢item明細
	@Override
	public QuoteContractBean getQuote(int qcId) {
		Session session = factory.getCurrentSession();
		QuoteContractBean qcb = session.get(QuoteContractBean.class, qcId);
		return qcb;
	}

	//修改報價合約
	@Override
	public void updateQuote(QuoteContractBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);
	}

	
	//狀態0:未報價、1:未簽約、2:已付訂金未簽約、3:服務完成結案、4:未服務完成結案
	@SuppressWarnings("unchecked")
	@Override
	public List<QuoteContractBean> getStatusQuotes(int p_Id,int status) {
		List<QuoteContractBean> list = null;
		String hql = "FROM QuoteContractBean q WHERE q.p_Id = :pid and q.qcStatus = :status";
		String hql1 ="FROM QuoteContractBean q WHERE q.p_Id = :pid and q.qcStatus < :status";
		Session session = factory.getCurrentSession();
		if(status==0) {
				list = session.createQuery(hql1)
						  .setParameter("pid", p_Id)
						  .setParameter("status", 2)
					      .getResultList();						
		}else if(status==2) {
			list = session.createQuery(hql)
					  .setParameter("pid", p_Id)
					  .setParameter("status", status)
				      .getResultList();		
		}
		
		return list;
	}




}
