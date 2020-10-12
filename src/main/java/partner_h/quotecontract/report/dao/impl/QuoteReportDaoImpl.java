package partner_h.quotecontract.report.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.SimpleExpression;
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
		String sql = "SELECT MONTH(q.qcdate), COUNT(q.qcstatus) "
				+ "FROM quotecontracts q "
				+ "WHERE q.qcstatus=3 "
				+ "GROUP BY MONTH(q.qcdate)";
	
		Session session = factory.getCurrentSession();
		List<QuoteReportBean> qrList =null;
//		List<QuoteContractBean> qcList=null;	
		qrList = session.createSQLQuery(sql)
						.addEntity(QuoteContractBean.class)
						.getResultList();	
		return qrList;
		/*
		//SELECT q FROM QuoteContractBean as q; //HQL
		//SELECT * FROM quotecontracts; //SQL
		Criteria criteria = session.createCriteria(QuoteContractBean.class);
		
		List<QuoteReportBean> qrBeanList = criteria.list();//eager loading
		*/
		

		
	}

}



