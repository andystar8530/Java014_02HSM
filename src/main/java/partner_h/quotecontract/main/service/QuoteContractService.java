package partner_h.quotecontract.main.service;

import java.util.List;

import partner_h.quotecontract.main.model.QuoteContractBean;

public interface QuoteContractService {
	//依訂單號查詢
	QuoteContractBean getQuote(int qcId);
	
	//查詢 所有報價單
	List<QuoteContractBean> getAllQuotes();
	
	//查詢 合作商多筆報價
	List<QuoteContractBean> getPartnerQuotes(int p_Id);
}
