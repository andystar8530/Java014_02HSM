package partner_h.partnerInfoEdit_h.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;

@Controller
public class showPartner {

	@Autowired
	PartnerService pService;
	
	@GetMapping(value="/showParnter/{p_id}")
	public String showParnter(Model model,
			@PathVariable Integer p_id
			) {
		PartnerBean partnerBean = pService.getPartner(p_id);
		model.addAttribute("partnerBean", partnerBean);
		
		return "/partner_h/_02_partners/showPartner";
	}


}
