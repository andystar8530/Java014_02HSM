package newlywed.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _01_register.model.MemberBean;
import newlywed.service.NewlywedService;
import partner_h.quotecontract.main.dao.QuoteContractDao;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;

@Controller
@RequestMapping("quote")
@SessionAttributes({"LoginOK"})
public class NewlyQuoteController {
	
	@Autowired
	NewlywedService newlywedService;
	
	@Autowired
	QuoteContractService qcservice;
	
	@GetMapping("quoteAllList")
	protected String getNewlyQuotes(Model model) {
	      MemberBean mb = (MemberBean) model.getAttribute("LoginOK");	
	      int status = 1;
//		 List<QuoteContractBean> qcb = newlywedService.getNewlyQuotes((mb.getM_Id()));
		 List<QuoteContractBean> qcb = newlywedService.getNewlyStatusQuotes((mb.getM_Id()), status);
		 model.addAttribute("quoteList",qcb);
		return "newlywed_h/quoteContractList";
	}
	
	

	//單筆合約明細
	@GetMapping("newlyQuoteDetail")
	protected String quoteDetail(Model model,
			@RequestParam("m_Id") String m_Id,
			@RequestParam("qcId") Integer qcId) {
		/*
		@RequestParam("參數名") 型態 變數名稱
			請求參數獲少量的表單資料，依照參數的型態自動轉型		
		*/
		QuoteContractBean qcb = qcservice.getQuote(qcId);	
		model.addAttribute("quoteBean",qcb);	
		return "newlywed_h/quoteContractInfo";
	}
	
	
/* 有bindingResult
	@PostMapping("ewlyQuoteDetail/")
	public String quoteDetail2(
			@ModelAttribute("QuoteBean") QuoteContractBean bean
//			, BindingResult bindingResult
			) {

	new CustomerValidator().validate(bean,bindingResult);
 	if(bindingResult.hasErrors()){
 		List<ObjectError> list = bindingResult.getAllErrors();
 		for(ObjectError error :list){
 			System.out.println(error);
 		}
 		System.out.println("當表單資料有誤時, bean===>"+bean);
 		return "編輯畫面";
 	}

		System.out.println("修改合約"+bean);
		qcservice.updateQuote(bean);	
		return "partner_h/quoteContractInfo";
	}
*/	

	//Update儲存後
	@PostMapping("newlyQuoteDetail")
	public String UpdateQuoteDetail(
			@ModelAttribute QuoteContractBean bean,
			Model model,
			@RequestParam("p_id") Integer p_id,
			@RequestParam("qcId") Integer qcId,
			RedirectAttributes redirectAttributes
//			BindingResult result, 
			) {
		System.out.println("修改合約"+bean);
		bean.setP_Id(p_id);
		qcservice.updateQuote(bean);
		redirectAttributes.addFlashAttribute("SUCCESS", "修改成功!!!");
		return "redirect:newlywed_h/quoteContractList";
	}
	
	
	
	
	
}
