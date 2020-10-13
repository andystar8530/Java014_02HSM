package partner_h.partnerInfoEdit_h.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import _06_Program.model.ProgramBean;
import _06_Program.service.ProgramService;
import newlywed.service.NewlywedService;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.service.PortfoliosService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;

@Controller
@SessionAttributes({"partnerBean","pfBeanList","programList","newlyewdBean"})
public class showPartnerController {

	@Autowired
	PartnerService pService;
	@Autowired
	PortfoliosService pfService;
	@Autowired
	ProgramService pgService;
	@Autowired 
	NewlywedService newlywedService;
	
	@GetMapping(value="/showPartnerDetail/{p_id}")
	public String showParnter(Model model,
			@PathVariable Integer p_id
			) {
		PartnerBean partnerBean = pService.getPartner(p_id);
		model.addAttribute("partnerBean", partnerBean);
		
		List<PortfoliosBean> pfBeanList = pfService.getPortfoliosByPartnerId(p_id);
		List<ProgramBean> programList = pgService.getProgramsByPid(p_id);
		model.addAttribute("pfBeanList", pfBeanList);	
		model.addAttribute("programList", programList);
		model.addAttribute("p_id", p_id);
		return "partner_h/_02_partners/showPartner";
	}


}
