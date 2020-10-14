package partner_h.quotecontract.report.dao.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.report.dao.QuoteReportDao;
import partner_h.quotecontract.report.model.QuoteReportBean;

@Repository
public class QuoteReportDaoImpl implements QuoteReportDao {
	
	@Autowired
	private SessionFactory factory;
	
//	@PersistenceContext
//	EntityManager em;

	public QuoteReportDaoImpl() {
		super();
	}


	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<QuoteReportBean>  getYearQuotes(int p_Id, int status) {
		//and (MONTH(q.qcdate)=13)
//		String sql = "SELECT MONTH(q.qcdate), COUNT(q.qcstatus) "
		String sql = "SELECT *,MONTH(q.qcdate), COUNT(q.qcstatus) "
				+ "FROM quotecontracts q "
				+ "WHERE q.qcstatus=3 and q.qcId=13"
				+ "GROUP BY MONTH(q.qcdate) ";
	
		Session session = factory.getCurrentSession();
		List<QuoteReportBean> qrList =null;
//		List<QuoteContractBean> qcList=null;	
		qrList = session.createSQLQuery(sql)
						.addEntity(QuoteContractBean.class)
						.getResultList();	
//		System.out.println(qrList);
		return qrList;
		/*
		//SELECT q FROM QuoteContractBean as q; //HQL
		//SELECT * FROM quotecontracts; //SQL
		Criteria criteria = session.createCriteria(QuoteContractBean.class);
		
		List<QuoteReportBean> qrBeanList = criteria.list();//eager loading
		*/	
	}
	
	
	//抓全部的QuoteContractBean後透過list拆解Bean
	@SuppressWarnings({ "unchecked", "null" })
	@Override
	public List<QuoteContractBean>  getYearQuotes2(int p_Id) {
		//and (MONTH(q.qcdate)=9)
		int status=3;
		String sql = "SELECT MONTH(q.qcdate), COUNT(q.qcstatus) "
				+ "FROM QuoteContractBean q "
				+ "WHERE q.qcstatus=:status and q.p_Id = :pid " 
				+ "GROUP BY MONTH(q.qcdate)";
		String hql = "FROM QuoteContractBean qc WHERE qc.p_Id = :pid and qc.qcStatus =:status ORDER BY qc.qcExecutionDate";
		Session session = factory.getCurrentSession();
		
		List<QuoteContractBean> qcList = session.createQuery(hql)
										.setParameter("pid", p_Id)
										.setParameter("status", status)
										.getResultList();	
		for(int i=0;i<qcList.size();i++) {
			
			System.out.println(i+"筆 服務日期:"+qcList.get(i).getQcExecutionDate()+" 專案金額:"+qcList.get(i).getQcTotalAmount());	
		}
		

		
		return qcList;
	}
}



