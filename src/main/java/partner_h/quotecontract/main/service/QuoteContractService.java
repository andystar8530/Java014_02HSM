package partner_h.quotecontract.main.service;

import java.util.List;

import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.model.QuoteContractItemBean;

public interface QuoteContractService {
	//依訂單號查詢
	QuoteContractBean getQuote(int qcId);
	
	//依合作商ID 查詢 單一筆報價???
	QuoteContractBean getP_Id(int p_Id);
	
	//依合約名稱 查詢 單一筆報價
	QuoteContractBean getQcName(String qcName);
	
	//查詢 所有報價單
	List<QuoteContractBean> getAllQuotes();
	
	//查詢 合作商多筆報價
	List<QuoteContractBean> getPartnerQuotes(int p_Id);
	
	//新增報價
	Object save(QuoteContractBean bean);
	
	//修改報價
	void updateQuote(QuoteContractBean bean);
	
	//查詢 未簽約所有報價單
	List<QuoteContractBean> getStatusQuotes(int p_Id,int status);
	

	
}
