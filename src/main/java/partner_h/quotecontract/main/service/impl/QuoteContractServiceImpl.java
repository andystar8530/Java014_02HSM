package partner_h.quotecontract.main.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partner_h.quotecontract.main.dao.QuoteContractDao;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;

@Service
@Transactional

public class QuoteContractServiceImpl implements QuoteContractService {

	@Autowired
	private QuoteContractDao qcdao;

	public QuoteContractServiceImpl() {
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

	//依合作商ID 查詢 單一筆報價???
	@Transactional
	@Override
	public QuoteContractBean getP_Id(int p_Id) {
		// TODO Auto-generated method stub
		return null;
	}

	//依合約名稱 查詢 單一筆報價
	@Transactional
	@Override
	public QuoteContractBean getQcName(String qcName) {
		QuoteContractBean bean = null;
		bean = qcdao.getQcName(qcName);
		return bean;
	}

	@Transactional
	@Override
	public QuoteContractBean getQuote(int qcId) {
		QuoteContractBean qcb = qcdao.getQuote(qcId);
		return qcb;
	}

	@Override
	public Object save(QuoteContractBean bean) {
		return qcdao.save(bean);
	}

	@Override
	public void updateQuote(QuoteContractBean bean) {
		 qcdao.updateQuote(bean);
	}
	


	
}
