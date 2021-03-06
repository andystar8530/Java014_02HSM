package partner_h.quotecontract.report.dao;

import java.util.List;

import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.report.model.QuoteReportBean;

public interface QuoteReportDao {
	//依合作商ID 查詢 每月營業收入、利潤加總、結案筆數
	List<QuoteReportBean>  getYearQuotes(int p_Id,int status);

	//依合作商ID 查詢 每月營業收入、利潤加總、結案筆數
	List<QuoteContractBean>  getYearQuotes2(int p_Id);
	
}
