package newlywed.dao;


import java.util.List;

import newlywed.model.NewlywedBean;
import partner_h.quotecontract.main.model.QuoteContractBean;

    public interface NewlywedDao {
   
	public boolean idExists(String id);
	
	public int saveNewlyed(NewlywedBean nb); 
	
	public NewlywedBean queryNewlywed(Integer id);
	
	 //依會員帳號查詢所有報價單
	 public List<QuoteContractBean> getNewlyQuotes(String m_Id);
	 
	 //依會員帳號與狀態查詢
	 public List<QuoteContractBean> getNewlyStatusQuotes(String m_Id,int status);
	
}
