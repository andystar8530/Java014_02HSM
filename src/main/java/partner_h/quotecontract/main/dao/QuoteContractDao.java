package partner_h.quotecontract.main.dao;


import java.util.List;

import partner_h.quotecontract.main.model.QuoteContractBean;


public interface QuoteContractDao {
	
	//依訂單號查詢
	QuoteContractBean getQuote(int qcId);
	
	//新增報價
	void insertQuote(QuoteContractBean qcb);
	
	//依合作商ID 查詢 單一筆報價
	QuoteContractBean getP_Id(int p_Id);
	
	//依合約名稱 查詢 單一筆報價
	QuoteContractBean getQcName(String qcName);
	
	//查詢 所有報價單
	List<QuoteContractBean> getAllQuotes();
	
	//查詢 合作商多筆報價
	List<QuoteContractBean> getPartnerQuotes(int p_Id);
	
	

}
