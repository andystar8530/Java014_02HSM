package _07_show.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import _06_Program.model.ProgramBean;
import _06_Program.service.ProgramService;
import _07_show.service.ShowService;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.service.PortfoliosService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;

@Controller
@SessionAttributes({"pbList","programList","portfolioList","categoryList"})
public class ShowController {
	
	@Autowired
	PartnerService pService;
	@Autowired
	PortfoliosService pfService;
	@Autowired
	ProgramService pgService;
	@Autowired
	ShowService showService;
	
	
	@GetMapping("/getALLByService/{category}")
	public String getALLItems(
			@PathVariable String category , 
			Model model			
			) {
		//找該服務項目的合作商
		List<PartnerBean> pbList = showService.getPartnersByService(category);
		Collections.shuffle(pbList);

		//找該服務項目的方案
		List<ProgramBean> programList = showService.getProgramsByService(category);
		Collections.shuffle(programList);
		//找該服務項目的作品集
		List<PortfoliosBean> portfolioList = showService.getPortfoliosByService(category);
		Collections.shuffle(portfolioList);
		
		model.addAttribute("pbList", pbList);
		model.addAttribute("programList", programList);
		model.addAttribute("portfolioList", portfolioList);
		
		return "_07_show/showPartners";
		
	}
	
		@ModelAttribute("categoryList")
		public List<String> getCategory(Model model){
			 List<String> list = showService.getAllCategories();
			 model.addAttribute("categoryList", list);
			return list;
		}
}
