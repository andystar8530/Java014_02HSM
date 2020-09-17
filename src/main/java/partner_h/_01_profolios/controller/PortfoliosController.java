package partner_h._01_profolios.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
		model.addAttribute("portfolio", pfService.getPortfolioById(pfmId));
		return "partner_h/portfolioDetail";
	}
	
	@RequestMapping("/queryByService")
	public String getServiceList(Model model) {
		List<String> list  = pfService.getAllPServices();
		model.addAttribute("serviceList" , list);
		return "partner_h/types/service";
	}
	
	@RequestMapping("/portfolios/{service}")
	public String getPortfoliosByService(@PathVariable("service") String service, Model model ) {
		List<PortfoliosBean> portfolios = pfService.getPortfoliosByService(service);
		model.addAttribute("portfolios", portfolios);
		return "partner_h/portfolios";
	}
	
	
	
	
	//空白表單
	@GetMapping("/portfolio/add")
	public String getAddPortfolioForm(Model model) {
		PortfoliosBean pfBean = new PortfoliosBean();
		model.addAttribute("portfoliosBean",pfBean);
		return "partner_h/addPortfolio";
	}
	
	//取得使用者填寫之表單
	@PostMapping("/portfolio/add")
	public String processAddNewPortfolioForm(
			@ModelAttribute("portfoliosBean") PortfoliosBean pfBean) {
		pfService.addPortfolio(pfBean);
		return "redirect:/partner_h/portfolios";
	}
}
