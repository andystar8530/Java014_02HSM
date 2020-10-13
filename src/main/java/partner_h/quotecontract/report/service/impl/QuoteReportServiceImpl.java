package partner_h.quotecontract.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.report.dao.QuoteReportDao;
import partner_h.quotecontract.report.model.QuoteReportBean;
import partner_h.quotecontract.report.service.QuoteReportService;


@Service
@Transactional
public class QuoteReportServiceImpl implements QuoteReportService {
	
	@Autowired
	QuoteReportDao qrdao;
	
	@Override
	public List<QuoteReportBean>  getYearQuotes(int p_Id, int status) {
		List<QuoteReportBean> list = null;
		list = qrdao.getYearQuotes(p_Id,status);
		return list;
	}
	
	
	@Override
	public List<QuoteReportBean>  getYearQuotes2(int p_Id) {
		List<QuoteReportBean> list = null;
		list = qrdao.getYearQuotes2(p_Id);
		return list;
	}

}
