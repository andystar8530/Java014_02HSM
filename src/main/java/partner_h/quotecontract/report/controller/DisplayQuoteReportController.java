package partner_h.quotecontract.report.controller;

import java.util.ArrayList;
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
@SessionAttributes({"LoginOK","partnerBean","QuoteReportBean","qrList"})//裝入屬性物件中，與jsp頁面識別字有關

public class DisplayQuoteReportController {


	
	@Autowired
	PartnerService partnerService;
	
	@Autowired
	QuoteContractService qcService;
	
	@Autowired
	QuoteReportService qrService;
	
	//每月營業收入、利潤加總、結案單數
//	@GetMapping("/year")	
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
		@GetMapping("/year")	
		protected String getYearQuoteReport2(Model model) {
			System.out.println("載入到每月營收報表中囉");
			PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
//			QuoteReportBean qrBean = (QuoteReportBean) model.getAttribute("QuoteReportBean");
			
			System.out.println(partnerBean.getP_id());
			List<QuoteContractBean> qcBean = qrService.getYearQuotes2(partnerBean.getP_id());
		System.out.println("qcBean長度"+qcBean.size());
		
		Integer revenue = 0;
		Integer count=0;
		Integer profit=0;
		Integer cost=0;
		Integer month = 0;
		Integer exRecMonth = 0;
		int index=0; 
		List<QuoteReportBean> qrList = new ArrayList<QuoteReportBean>();
//		QuoteReportBean qrBean = null;
		
				
		Calendar calendar=Calendar.getInstance();//java.sql.date 取月份
		for(int i=0;i<qcBean.size();i++) {

			calendar.setTime(qcBean.get(i).getQcExecutionDate());//服務日期塞入 calender型態中
			System.out.println(qcBean.get(i).getQcExecutionDate());
			month = calendar.get(Calendar.MONTH);//服務日期取月份
			month=month+1;
			if(i==0) {
				exRecMonth = month;
			}
			System.out.println("第"+i+"筆: "+month+"月");
			
			if(i!=0 && exRecMonth != month) {
				QuoteReportBean qrBean = new QuoteReportBean();
				//寫入 quoteRepotBean
					qrBean.setMonth(exRecMonth); //單筆月份
					qrBean.setQuoteCount(count);//單據筆數
					qrBean.setQrRevenue(revenue);//收入總和
					qrBean.setQrAvgRev(revenue/count);//收入平均
					qrBean.setQrCost(cost);//成本總和
					qrBean.setQrAvgCost(cost/count);//成本平均
					qrBean.setQrProfit(profit);//利潤總和
					qrBean.setQrAvgPro(profit/count);//平均利潤
					qrList.add(qrBean);
					index++;// list quoteRepotBean 的index
				
				//累計歸零，月份複製
					revenue =0;
					profit=0;
					cost=0;
					count=0;
					exRecMonth =month;
			}
			
			
			count++;//計算單月份訂單筆數
			System.out.println("test"+qcBean.get(i).getQcTotalAmount());
			revenue += qcBean.get(i).getQcTotalAmount();//取收入
			profit  += qcBean.get(i).getQcProfit();     //取利潤
			cost    += qcBean.get(i).getCostTotal();    //取成本	
	
			
		}
				QuoteReportBean qrBean = new QuoteReportBean();
				qrBean.setMonth(month);
				qrBean.setQuoteCount(count);//單據筆數
				qrBean.setQrRevenue(revenue);//收入總和
				qrBean.setQrAvgRev(revenue/count);//收入平均
				qrBean.setQrCost(cost);//成本總和
				qrBean.setQrAvgCost(cost/count);//成本平均
				qrBean.setQrProfit(profit);//利潤總和
				qrBean.setQrAvgPro(profit/count);//平均利潤
				qrList.add(qrBean);
		
		System.out.println("qrList長度:"+qrList.size());
		
		
	for(int i=0;i<qrList.size();i++) {	
			System.out.println(i+"筆 服務月份:"+qrList.get(i).getMonth()+"月  收入金額:"+qrList.get(i).getQrRevenue()+" 收入平均金額:"+qrList.get(i).getQrAvgRev());	
		}
		
		model.addAttribute("qrList", qrList);
			return "partner_h/quoteReport";
	}	
}
