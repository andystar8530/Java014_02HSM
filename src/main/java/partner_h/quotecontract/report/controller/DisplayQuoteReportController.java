package partner_h.quotecontract.report.controller;

import java.util.Calendar;
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
		@SuppressWarnings("null")
		@GetMapping("/year2")	
		protected String getYearQuoteReport2(Model model) {
			System.out.println("載入到每月營收報表中囉");
			PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
			System.out.println(partnerBean.getP_id());
			List<QuoteContractBean> qcBean = qrService.getYearQuotes2(partnerBean.getP_id());
		System.out.println("qrBean長度"+qcBean.size());
		
		
		Integer revenue = null;
		Integer count=0;
		Integer profit=0;
		Integer cost=0;
		Integer month = null;
		Integer exmonth = null;
		int n=0;
		List<QuoteReportBean> qrList = null;
		QuoteReportBean qrBean = null;
		
		Calendar calendar=Calendar.getInstance();//java.sql.date 取月份
		for(int i=0;i<qcBean.size();i++) {
			calendar.setTime(qcBean.get(i).getQcExecutionDate());//服務日期塞入 calender型態中
			month = calendar.get(Calendar.MONTH);//服務日期取月份
			if(exmonth != month) {
				if (revenue!=null) { //單月
					qrBean.setMonth(month);
					qrBean.setQuoteCount(count);//單據筆數
					qrBean.setQrRevenue(revenue);//收入總和
					qrBean.setQrAvgRev(revenue/count);//收入平均
					qrBean.setQrCost(cost);//成本總和
					qrBean.setQrAvgCost(cost/count);//成本平均
					qrBean.setQrProfit(profit);//利潤總和
					qrBean.setQrAvgPro(profit/count);//平均利潤
					qrList.set(n, qrBean);
					n++;
				}									
				revenue =0;
					profit=0;
					cost=0;
					count=0;
					exmonth =month;
			}
			count++;
			revenue += qcBean.get(i).getQcTotalAmount();//取收入
			profit  += qcBean.get(i).getQcProfit();     //取利潤
			cost    += qcBean.get(i).getCostTotal();    //取成本	
		}
		
				qrBean.setMonth(month);
				qrBean.setQuoteCount(count);//單據筆數
				qrBean.setQrRevenue(revenue);//收入總和
				qrBean.setQrAvgRev(revenue/count);//收入平均
				qrBean.setQrCost(cost);//成本總和
				qrBean.setQrAvgCost(cost/count);//成本平均
				qrBean.setQrProfit(profit);//利潤總和
				qrBean.setQrAvgPro(profit/count);//平均利潤
				qrList.set(n, qrBean);
		
		
		
		
		System.out.println(qrList.size());
		
		
		
		for(int i=0; i<qcBean.size();i++) {
			System.out.println("第"+i+"筆");
//			System.out.println(qrBean.get(i).getMonth());
		}
			return "partner_h/quoteReport";
	}	
}
