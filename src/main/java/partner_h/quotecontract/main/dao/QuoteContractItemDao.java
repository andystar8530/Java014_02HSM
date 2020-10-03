package partner_h.quotecontract.main.dao;

import java.util.List;

import partner_h.quotecontract.main.model.QuoteContractItemBean;

public interface QuoteContractItemDao {
	double findItemAmount(QuoteContractItemBean qcItemBean);
	
	//依訂單號查詢多筆紀錄
	List<QuoteContractItemBean> getQuote(int qcId);
	
}
