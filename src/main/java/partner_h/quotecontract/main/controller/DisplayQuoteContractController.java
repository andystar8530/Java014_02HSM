 package partner_h.quotecontract.main.controller;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;
import partner_h.quotecontract.main.model.QuoteContractBean;
import partner_h.quotecontract.main.model.QuoteContractItemBean;
import partner_h.quotecontract.main.service.QuoteContractService;
//import partner_h.quotecontract.main.model.ServiceItem;
//import partner_h.quotecontract.main.service.ServiceItemService;


@Controller
@RequestMapping("quotecontract")
@SessionAttributes({"LoginOK","partnerBean","quoteList","quoteBean"})//裝入屬性物件中，與jsp頁面識別字有關

public class DisplayQuoteContractController {

	@Autowired
	ServletContext context;
	
	@Autowired
	PartnerService partnerService;
	
	@Autowired
	QuoteContractService qcservice;
	
	String p_storeName;
//	@Autowired
//	ServiceItemService serviceItemService;
	
	
	//合約列表
	@GetMapping("/quoteContractList")
	protected String quoteContractList(Model model) {
		
		//抓取會員的資料
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");

		//透過合作商的ID,找到清單-報價單
		List<QuoteContractBean> qcbs = qcservice.getPartnerQuotes(partnerBean.getP_id());
		model.addAttribute("quoteList", qcbs);//將清單放入找出的合約清單放入quoteList識別字中
		return "partner_h/quoteContractList";
	}
	
	//合約狀態列表(未簽約)
	@GetMapping("quoteContractStatusList/undone")
	protected String getUndoneStatusQuotes(Model model) {
		int status = 0;
		//抓取會員的資料
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");

		//透過合作商的ID,找到清單-報價單
			
		List<QuoteContractBean> qcbs = qcservice.getStatusQuotes((partnerBean.getP_id()), status);
		model.addAttribute("quoteList", qcbs);//將清單放入找出的合約清單放入quoteList識別字中
		return "partner_h/quoteContractList";
	}
	
	//合約狀態列表(已簽約)
	@GetMapping("quoteDoneContractStatusList/done")
	protected String getStatusQuotes(
			Model model) {
		int status = 2;
		//抓取會員的資料
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");

		//透過合作商的ID,找到清單-報價單
			
		List<QuoteContractBean> qcbs = qcservice.getStatusQuotes((partnerBean.getP_id()), status);
		model.addAttribute("quoteList", qcbs);//將清單放入找出的合約清單放入quoteList識別字中
		return "partner_h/quoteContractList";
	}
	
	
	//單筆合約明細
	@GetMapping({"quoteDetail","quoteDoneContractStatusList/quoteDetail","quoteContractStatusList/quoteDetail"})
	protected String quoteDetail(Model model,
			@RequestParam("p_id") Integer p_id,
			@RequestParam("qcId") Integer qcId) {
		/*
		@RequestParam("參數名") 型態 變數名稱
			請求參數獲少量的表單資料，依照參數的型態自動轉型		
		*/
		QuoteContractBean qcb = qcservice.getQuote(qcId);	
		model.addAttribute("quoteBean",qcb);	
		p_storeName = qcb.getP_storeName();
		System.out.println("get_p_storeName:"+p_storeName);
		return "partner_h/quoteContractInfo";
	}
	
	
/* 有bindingResult
	@PostMapping("quoteDetail/")
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
	@PostMapping("quoteDetail")
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
		bean.setP_storeName(p_storeName);
		qcservice.updateQuote(bean);
		redirectAttributes.addFlashAttribute("SUCCESS", "修改成功!!!");
		String p_storeName1 = bean.getP_storeName();
		System.out.println("post_p_storeName:"+p_storeName);
		System.out.println("post_p_storeName1:"+p_storeName1);
		return "redirect:quoteContractList";
	}

	//新增單筆報價合約
	@GetMapping("insertQuote")
	public String getQuoteForm(Model model) {
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
		QuoteContractBean quoteBean = new QuoteContractBean();
		quoteBean.setP_Id(partnerBean.getP_id());
		quoteBean.setP_storeName(partnerBean.getP_storeName());
		quoteBean.setP_Signature(partnerBean.getP_stamp());
		quoteBean.setCostPerHour(partnerBean.getP_hRate());
		model.addAttribute("quoteBean",quoteBean);
		return "partner_h/quoteContractInsert";		 
	}
	
	@PostMapping(value="/insertQuote")
	public String add(
			Model model,
			@ModelAttribute("quoteBean") QuoteContractBean bean,
			RedirectAttributes redirectAttributes
			) {
//		QuoteContractItemBean qciBean = new QuoteContractItemBean();
//		qciBean.setQuoteContractBean(bean);
//		//找到對應的serviceItem物件
//		ServiceItem serviceItem = serviceItemService.getServiceItem(qciBean.getServiceItem().getSiId());
//		qciBean.setServiceItem(serviceItem);
		qcservice.save(bean);
		
		redirectAttributes.addFlashAttribute("SUCCESS", "新增成功!!!");
		return "redirect:quoteContractList";

	}

	@ModelAttribute("quoteBean")
	public QuoteContractBean getQuoteBean(
			@PathVariable(value="p_id", required = false) Integer p_id,  
			@PathVariable(value="qcId", required = false) Integer qcId
			) {
		QuoteContractBean bean= null;
		if(qcId == null) {
			bean = new QuoteContractBean();
			bean.setP_Id(p_id);
//			bean.setQcContent();
//			bean.setQcDate();		
		}
		return bean;
	}	
}
