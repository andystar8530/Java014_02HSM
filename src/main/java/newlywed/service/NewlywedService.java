package newlywed.service;

import java.util.List;

import newlywed.model.NewlywedBean;
import partner_h.quotecontract.main.model.QuoteContractBean;

public interface NewlywedService {
	
     boolean idExists(String id);
	
	 int saveNewlyed(NewlywedBean nb); 
	
	 NewlywedBean queryNewlywed(Integer id);
	 
	 //依會員帳號查詢所有報價單
	 List<QuoteContractBean> getNewlyQuotes(String m_Id);
	 
	 //依會員帳號與狀態查詢
	 List<QuoteContractBean> getNewlyStatusQuotes(String m_Id,int status);

	 
}
