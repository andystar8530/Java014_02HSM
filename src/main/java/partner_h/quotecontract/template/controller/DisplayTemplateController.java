package partner_h.quotecontract.template.controller;

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

import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.quotecontract.template.model.ContractTemplateBean;
import partner_h.quotecontract.template.service.ContractTemplateService;

@Controller
@RequestMapping("template")
@SessionAttributes({"LoginOK","partnerBean"})
public class DisplayTemplateController {
	@Autowired
	ContractTemplateService ctService;

	//查詢單筆合約範本 
	@SuppressWarnings("null")
	@GetMapping("editTemplate")
	protected String editTemplate(Model model
			) {
		System.out.println("合約範本是我");
		PartnerBean pb = (PartnerBean) model.getAttribute("partnerBean");
		ContractTemplateBean ctb = ctService.getTemplateBean(pb.getP_id());
		if(ctb == null) {
			String ctContent ="我是合約我是合約我是合約我是合約";
			ctb.setPartner(pb);
			ctb.setCtContent(ctContent);
			ctService.save(ctb);
		}
		model.addAttribute("contractTemplate",ctb);
		return "partner_h/contractTemplateEdit";	
	}
	
	@PostMapping("editTemplate")
	//按下儲存見的單筆合約範本
	public String updateTemplate(Model model,
			@ModelAttribute ContractTemplateBean bean,
			RedirectAttributes redirectAttributes
			) {
	ctService.updateTemplate(bean);
	redirectAttributes.addFlashAttribute("SUCCESS", "修改成功!!!");
	return "partner_h/contractTemplateEdit";
	}
	
}
