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
				+ "GROUP BY MONTH(q.qcdate)";
	
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
	public List<QuoteReportBean>  getYearQuotes2(int p_Id) {
		//and (MONTH(q.qcdate)=9)
		int status=3;
		String sql = "SELECT MONTH(q.qcdate), COUNT(q.qcstatus) "
				+ "FROM QuoteContractBean q "
				+ "WHERE q.qcstatus=:status and q.p_Id = :pid"
				+ "GROUP BY MONTH(q.qcdate)";
		String hql = "FROM QuoteContractBean qc WHERE qc.p_Id = :pid and qc.qcStatus =:status";
		Session session = factory.getCurrentSession();
		
		List<QuoteContractBean> qcList = session.createQuery(hql)
										.setParameter("pid", p_Id)
										.setParameter("status", status)
										.getResultList();	
		System.out.println(qcList);	
		Integer revenue = null;
		Integer count=0;
		Integer profit=0;
		Integer cost=0;
		Integer month = null;
		Integer exmonth = null;
		int n=0;
		List<QuoteReportBean> qrList = null;
		QuoteReportBean qrBean = null;
		
		Calendar calendar=Calendar.getInstance();//java.sql.date 取月份
		for(int i=0;i<qcList.size();i++) {
			calendar.setTime(qcList.get(i).getQcExecutionDate());//服務日期塞入 calender型態中
			month = calendar.get(Calendar.MONTH);//服務日期取月份
			if(exmonth != month) {
				if (revenue ==0) { //單月
					qrBean.setMonth(month);
					qrBean.setQuoteCount(count);//單據筆數
					qrBean.setQrRevenue(revenue);//收入總和
					qrBean.setQrAvgRev(revenue/count);//收入平均
					qrBean.setQrCost(cost);//成本總和
					qrBean.setQrAvgCost(cost/count);//成本平均
					qrBean.setQrProfit(profit);//利潤總和
					qrBean.setQrAvgPro(profit/count);//平均利潤
					qrList.set(n, qrBean);
					n++;
				}									
					revenue =0;
					profit=0;
					cost=0;
					count=0;
					exmonth =month;
			}
			count++;
			revenue += qcList.get(i).getQcTotalAmount();//取收入
			profit  += qcList.get(i).getQcProfit();     //取利潤
			cost    += qcList.get(i).getCostTotal();    //取成本	
		}
		
				qrBean.setMonth(month);
				qrBean.setQuoteCount(count);//單據筆數
				qrBean.setQrRevenue(revenue);//收入總和
				qrBean.setQrAvgRev(revenue/count);//收入平均
				qrBean.setQrCost(cost);//成本總和
				qrBean.setQrAvgCost(cost/count);//成本平均
				qrBean.setQrProfit(profit);//利潤總和
				qrBean.setQrAvgPro(profit/count);//平均利潤
				qrList.set(n, qrBean);

		
		return qrList;
	}
}



