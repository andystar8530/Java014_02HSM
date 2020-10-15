package partner_h.quotecontract.main.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _01_register.model.MemberBean;
import partner_h.quotecontract.main.dao.QuoteContractDao;
//import partner_h.quotecontract.main.dao.QuoteContractItemDao;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;

@Service
@Transactional
												 
public class QuoteContractServiceImpl implements QuoteContractService {

	@Autowired
	private QuoteContractDao qcdao;
	
//	@Autowired
//	private QuoteContractItemDao qcidao;

	public QuoteContractServiceImpl() {
	}

	//依訂單號查詢
	@Transactional
	@Override
	public QuoteContractBean getQuote(int qcId) {
		QuoteContractBean qcb = qcdao.getQuote(qcId);
//		Set<QuoteContractItemBean> items = qcb.getItems();
		return qcb;
	}
	
	//依合作商ID 查詢 單一筆報價???
	@Transactional
	@Override
	public QuoteContractBean getP_Id(int p_Id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	//查詢 所有報價單
	@Transactional
	@Override
	public List<QuoteContractBean> getAllQuotes() {
		List<QuoteContractBean> list = null;
		list = qcdao.getAllQuotes();
		return list;
	}

	//查詢 合作商多筆報價
	@Transactional
	@Override
	public List<QuoteContractBean> getPartnerQuotes(int p_Id) {
		List<QuoteContractBean> list = null;
		list = qcdao.getPartnerQuotes(p_Id);
		return list;
	}



	//依合約名稱 查詢 單一筆報價
	@Transactional
	@Override
	public QuoteContractBean getQcName(String qcName) {
		QuoteContractBean bean = null;
		bean = qcdao.getQcName(qcName);
		return bean;
	}




	@Override
	public Object save(QuoteContractBean bean) {
//		Set<QuoteContractItemBean> items = bean.getItems();
//		for(QuoteContractItemBean qciBean :items) {
//			qcidao.save(qciBean);
//		}
		return qcdao.save(bean);
	}

	@Override
	public void updateQuote(QuoteContractBean bean) {
//		Set<QuoteContractItemBean> items = bean.getItems();
//		for(QuoteContractItemBean qciBean :items) {
//			qcidao.updateQuoteItem(qciBean);
//	}
	qcdao.updateQuote(bean);
}

	@Override
	public List<QuoteContractBean> getStatusQuotes(int p_Id, int status) {
		List<QuoteContractBean> list = null;
		list = qcdao.getStatusQuotes(p_Id,status);
		return list;
	}

	@Override
	public QuoteContractBean getQuoteContractBeanById(int id) {
		return qcdao.getQuoteContractBeanById(id);
	}

	@Override
	public void updateQuoteContractBean(QuoteContractBean bean) {
		qcdao.updateQuoteContractBean(bean);
		
	}

	@Override
	public MemberBean getMemberId(int id) {
		
		return qcdao.getMemberId(id);
	}



}
