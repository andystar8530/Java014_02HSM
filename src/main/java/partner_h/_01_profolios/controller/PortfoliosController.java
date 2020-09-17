package partner_h._01_profolios.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.service.PortfoliosService;

@Controller
public class PortfoliosController {
	
	@Autowired
	PortfoliosService pfService;
	
	@GetMapping(value="/portfolios")
	public String getAllPortfolios (Model model) {
		
		List<PortfoliosBean> allPortfolios = pfService.getAllPortfolios();
		
		model.addAttribute("allPortfolios" , allPortfolios);
		
		return "partner_h/portfolios";
	}
	
	@RequestMapping("/portfolio")
	public String getPortfoliosById(@RequestParam("pfmId") Integer pfmId ,Model model) {
		model.addAttribute("portfolio", pfService.getProductById(pfmId));
		return "partner_h/portfolioDetail";
	}
}
