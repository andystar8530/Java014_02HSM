package partner_h.quotecontract.main.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import ch01_h_register.model.MemberBean;
import partner.partnerInfoEdit.model.PartnerBean;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;


@Controller
@RequestMapping("quotecontract")
@SessionAttributes({"LoginOK","pageNo","QuoteContractList","partnerBean"})//裝入屬性物件中，與jsp頁面識別字有關

public class DisplayQuoteContractController {

	@Autowired
	ServletContext context;
	@Autowired
	QuoteContractService qcservice;
	
	@GetMapping("quoteContractList")
	protected String quoteContractList(Model model) {
		
		//抓取會員的資料
		MemberBean memberBean = (MemberBean)model.getAttribute("LoginOK");
		PartnerBean partnerBean =(PartnerBean)model.getAttribute("partnerBean");
		if(memberBean==null) {
			return "redirect:/登錄畫面";
		}
		//透過合作商的ID,找到報價單相應的清單
		List<QuoteContractBean> qcbs = qcservice.getPartnerQuotes(partnerBean.getP_id());
		model.addAttribute("quoteList", qcbs);//將清單放入找出的合約清單放入quoteList識別字中
		return "partner_h/quoteContractList.jsp";
	}
	
	
	
	
	
}
