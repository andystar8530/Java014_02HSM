package newlywed.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _01_register.model.MemberBean;
import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.service.QuoteContractService;

@Controller
@RequestMapping({"quote"})
@SessionAttributes({"LoginOK"})
public class NewlyQuoteController {
	
	@Autowired
	NewlywedService newlywedService;
	
	@Autowired
	QuoteContractService qcservice;
	
	@Autowired
	PartnerService partnerService;
	
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
	
	
	//quote/askingQuote/${programBean.partnerBean2.p_id}
	
	//新人新增單筆報價合約(帶出資料)
//		@GetMapping("/askingQuote/{p_id}")
		@GetMapping("/askingQuote")
//		@GetMapping({"/askingQuote","/askingQuote/"})
		public String getAskingQuoteForm(Model model,
				HttpServletRequest request, HttpServletResponse reponse,
				@RequestParam(value="p_id", required = false) Integer p_id
				) {
			System.out.println("p_id: "+p_id);
			MemberBean mb = (MemberBean) model.getAttribute("LoginOK");//新人會員資料
//			p_id=13;
			QuoteContractBean quoteBean = new QuoteContractBean();
			NewlywedBean nb = newlywedService.queryNewlywed(mb.getM_No());//新人資料
			quoteBean.setN_Name(mb.getM_Name());
			quoteBean.setM_Id(mb.getM_Id());
			if(p_id!=null) {
				PartnerBean pb = partnerService.getPartner(p_id);//合作商
				quoteBean.setP_Id(p_id);//合作商id
				quoteBean.setP_storeName(pb.getP_storeName());//合作商店名稱
				quoteBean.setP_Signature(pb.getP_stamp());
				quoteBean.setCostPerHour(pb.getP_hRate());
			}
			model.addAttribute("quoteBean",quoteBean);
			return "newlywed_h/newlywedInsert";
			       
		}
		//新增單筆報價合約(更新資料)
		@PostMapping(value="/askingQuote")
		public String add(
				Model model,
				@ModelAttribute("quoteBean") QuoteContractBean bean,
				RedirectAttributes redirectAttributes
				) {
//			QuoteContractItemBean qciBean = new QuoteContractItemBean();
//			qciBean.setQuoteContractBean(bean);
//			//找到對應的serviceItem物件
//			ServiceItem serviceItem = serviceItemService.getServiceItem(qciBean.getServiceItem().getSiId());
//			qciBean.setServiceItem(serviceItem);
			if(bean.getP_storeName()==null) {
				PartnerBean pb = partnerService.getPartner(bean.getP_Id());
				
				bean.setP_storeName(pb.getP_storeName());
				bean.setP_Signature(pb.getP_stamp());
				bean.setCostPerHour(pb.getP_hRate());
			}
			qcservice.save(bean);
			int p_id = bean.getP_Id();
			redirectAttributes.addFlashAttribute("SUCCESS", "新增成功!!!");
			 return "redirect:/quote/quoteAllList";

		}

		@ModelAttribute("quoteBean")
		public QuoteContractBean getQuoteBean(
				@PathVariable(value="p_id", required = false) Integer p_id  
				) {
			QuoteContractBean bean= null;
			
				bean = new QuoteContractBean();
				bean.setP_Id(p_id);
//				bean.setQcContent();
//				bean.setQcDate();		

			return bean;
		}
}
		
