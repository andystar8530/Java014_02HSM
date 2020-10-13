package partner_h.quotecontract.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;
import partner_h.quotecontract.report.model.QuoteReportBean;
import partner_h.quotecontract.report.service.QuoteReportService;

@Controller
@RequestMapping("quotReport")
@SessionAttributes({"LoginOK","partnerBean"})//裝入屬性物件中，與jsp頁面識別字有關

public class DisplayQuoteReportController {

	@Autowired
	PartnerService partnerService;
	
	@Autowired
	QuoteContractService qcService;
	
	@Autowired
	QuoteReportService qrService;
	
	//每月營業收入、利潤加總、結案單數
	@GetMapping("/year")	
	protected String getYearQuoteReport(Model model) {
		System.out.println("載入到每月營收報表中囉");
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
		System.out.println(partnerBean.getP_id());
		List<QuoteReportBean> qrBean = qrService.getYearQuotes((partnerBean.getP_id()),3);
		System.out.println("qrBean長度"+qrBean.size());
		for(int i=0; i<qrBean.size();i++) {
			System.out.println(i+"次: "+qrBean.get(i));
		}
		return "partner_h/quoteReport";
	}

		//每月營業收入、利潤加總、結案單數
		@GetMapping("/year2")	
		protected String getYearQuoteReport2(Model model) {
			System.out.println("載入到每月營收報表中囉");
			PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
			System.out.println(partnerBean.getP_id());
			List<QuoteReportBean> qrBean = qrService.getYearQuotes2(partnerBean.getP_id());
		System.out.println("qrBean長度"+qrBean.size());
		for(int i=0; i<qrBean.size();i++) {
			System.out.println("第"+i+"筆");
			System.out.println(qrBean.get(i).getMonth());
		}
			return "partner_h/quoteReport";
	}	
}
