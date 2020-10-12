package partner_h.quotecontract.report.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import partner_h.quotecontract.report.dao.QuoteReportDao;
import partner_h.quotecontract.report.model.QuoteReportBean;
import partner_h.quotecontract.report.service.QuoteReportService;


@Service
@Transactional
public class QuoteReportServiceImpl implements QuoteReportService {
	
	QuoteReportDao qrdao;
	
	@Override
	public List<QuoteReportBean>  getYearQuotes(int p_Id, int status) {
		List<QuoteReportBean> list = null;
		list = qrdao.getYearQuotes(p_Id,status);
		return list;
	}

}
