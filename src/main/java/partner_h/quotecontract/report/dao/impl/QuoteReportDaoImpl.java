package partner_h.quotecontract.report.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.report.dao.QuoteReportDao;
import partner_h.quotecontract.report.model.QuoteReportBean;

@Repository
@Service
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
		//and (MONTH(q.qcdate)=9)
//		String sql = "SELECT MONTH(q.qcdate), COUNT(q.qcstatus) "
		String sql = "SELECT *,MONTH(q.qcdate), COUNT(q.qcstatus) "
				+ "FROM quotecontracts q "
				+ "WHERE q.qcstatus=3 "
				+ "GROUP BY MONTH(q.qcdate)";
	
		Session session = factory.getCurrentSession();
		List<QuoteReportBean> qrList =null;
//		List<QuoteContractBean> qcList=null;	
		qrList = session.createSQLQuery(sql)
						.addEntity(QuoteContractBean.class)
						.getResultList();	
		System.out.println(qrList);
		return qrList;
		/*
		//SELECT q FROM QuoteContractBean as q; //HQL
		//SELECT * FROM quotecontracts; //SQL
		Criteria criteria = session.createCriteria(QuoteContractBean.class);
		
		List<QuoteReportBean> qrBeanList = criteria.list();//eager loading
		*/
		

		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<QuoteContractBean>  getYearQuotes2(int p_Id) {
		//and (MONTH(q.qcdate)=9)
		String sql = "SELECT MONTH(q.qcdate), COUNT(q.qcstatus) "
				+ "FROM QuoteContractBean q "
				+ "WHERE q.qcstatus=:status and q.p_Id = :pid"
				+ "GROUP BY MONTH(q.qcdate)";
		String hql = "FROM QuoteContractBean qc WHERE qc.p_Id = :pid";
		Session session = factory.getCurrentSession();
		
		List<QuoteContractBean> qrList = session.createQuery(hql)
//										.setParameter("status", status)
										.setParameter("pid", p_Id)
										.getResultList();	
		
//		List<QuoteReportBean> qrList = (List<QuoteReportBean>)session.createQuery(hql)
//										.setParameter("status", status)
//										.setParameter("pid", p_Id)
//										.getResultList();	
		System.out.println(qrList);
		return qrList;
		/*
		//SELECT q FROM QuoteContractBean as q; //HQL
		//SELECT * FROM quotecontracts; //SQL
		Criteria criteria = session.createCriteria(QuoteContractBean.class);
		
		List<QuoteReportBean> qrBeanList = criteria.list();//eager loading
		 */
		
		
		
	}

}



