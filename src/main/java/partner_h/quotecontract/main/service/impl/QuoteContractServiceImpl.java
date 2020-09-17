package partner_h.quotecontract.main.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ch01_h_register.dao.MemberDao;
import partner.partnerInfoEdit.dao.PartnerDao;
import partner_h.quotecontract.main.dao.QuoteContractDao;
import partner_h.quotecontract.main.dao.QuoteContractItemDao;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;


@Service
public class QuoteContractServiceImpl implements QuoteContractService {

	@Autowired
	private QuoteContractItemDao qcidao;
	@Autowired
	private QuoteContractDao qcdao;
	@Autowired
	private PartnerDao pdao;
	@Autowired
	private MemberDao mdao;
	
	public QuoteContractServiceImpl() {
	}
	
	//依訂單號查詢
	@Transactional	
	@Override
	public QuoteContractBean getQuote(int qcId) {
		QuoteContractBean bean = null;
		bean = qcdao.getQuote(qcId);
		return bean;
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
	
	
}
