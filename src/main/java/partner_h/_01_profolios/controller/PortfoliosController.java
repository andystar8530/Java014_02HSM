package partner_h._01_profolios.controller;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

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
import org.springframework.web.multipart.MultipartFile;

import partner_h._01_profolios.model.PortfoliosAll;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.model.PortfoliosDetailsBean;
import partner_h._01_profolios.service.PortfoliosDetailsService;
import partner_h._01_profolios.service.PortfoliosService;
import partner_h._01_profolios.validator.PortfoliosValidator;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Controller
@SessionAttributes({"partnerBean","portfoliosAll","portfolios","portfoliosBean","portfolioDetailsBean","pfdBeanList"})
public class PortfoliosController {
	
	@Autowired
	PortfoliosService pfService;
	@Autowired
	PortfoliosDetailsService pfdService;
	@Autowired
	ServletContext servletContext;
	@GetMapping(value="/portfolios")
	public String getAllPortfolios (Model model) {
		
		List<PortfoliosBean> allPortfolios = pfService.getAllPortfolios();
		// 送空白表單
		PortfoliosBean pfBean = new PortfoliosBean();
		model.addAttribute("portfoliosBean",pfBean);
		
		model.addAttribute("allPortfolios" , allPortfolios);
		
		return "partner_h/portfolios";
	}
	
	
	@RequestMapping("/portfolio")
	public String getPortfoliosById(@RequestParam("pfmId") Integer pfmId ,Model model) {
		model.addAttribute("portfolio", pfService.getPortfolioById(pfmId));
		List<PortfoliosDetailsBean> pfdBeanList = pfdService.getPfDetailsBypfmId(pfmId);
		model.addAttribute("pfdBeanList", pfdBeanList);
		return "partner_h/portfolioDetail";
	}
	
	@RequestMapping("/queryByService")
	public String getServiceList(Model model) {
		List<String> list  = pfService.getAllPServices();
		model.addAttribute("serviceList" , list);
		return "partner_h/types/service";
	}
	//作品集分類
	@ModelAttribute("serviceList")
	public List<String> getServiceListItems(Model model) {
		List<String> list  = pfService.getAllPServices();
		return list;
	}
	@RequestMapping("/portfolios/{service}")
	public String getPortfoliosByService(@PathVariable("service") String service, Model model ) {
		List<PortfoliosBean> portfolios = pfService.getPortfoliosByService(service);
		model.addAttribute("portfolios", portfolios);
		return "partner_h/portfolios";
	}
	
	
	
	
	//空白表單
//	@GetMapping("/portfolio/add")
//	public String getAddPortfolioForm(Model model) {
//		PortfoliosBean pfBean = new PortfoliosBean();
//		model.addAttribute("portfoliosBean",pfBean);
//		return "partner_h/portfolios";
//	}
	
	
	@GetMapping("/portfoliosByPartnerId")
	public String portfoliosByPartnerId(Model model) {
		// 送空白表單
		PortfoliosAll portfoliosAll = new PortfoliosAll();
		
		model.addAttribute("portfoliosAll",portfoliosAll);
		//放原本的作品集
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
		model.addAttribute("portfolios", pfService.getPortfoliosByPartnerId(partnerBean.getP_id()));
		return "partner_h/portfolios";
	}
	
	
	//取得使用者填寫之表單
	@PostMapping("/portfolios")
	public String processAddNewPortfolioForm(
			Model model,
			@ModelAttribute("portfoliosAll") PortfoliosAll portfoliosAll ,
			BindingResult result,
			HttpServletRequest request
			) {
		//驗證
		PortfoliosValidator portfoliosValidator = new PortfoliosValidator();
		portfoliosValidator.validate(portfoliosAll, result);
		if(result.hasErrors()) {
			model.addAttribute("inputError","inputError");
			return "partner_h/portfolios";
		}
		
		PartnerBean partnerBean = (PartnerBean) model.getAttribute("partnerBean");
		portfoliosAll.getPortfoliosBean().setPfmStatus("1");
		portfoliosAll.getPortfoliosBean().setPfService(partnerBean.getP_service());
		portfoliosAll.getPortfoliosBean().setP_id(partnerBean.getP_id());
		//新增作品集主檔
		pfService.addPortfolio(portfoliosAll.getPortfoliosBean());
		PortfoliosDetailsBean pfdBean = null;
		//取得圖片
//		System.out.println("取得圖片開始");
		List<MultipartFile> files = portfoliosAll.getPortfoliosDetailsBean().getPortfoliosImages();
//		System.out.println("取得圖片結束");
		System.out.println("files = " + files);
		List<String> fileNames = new ArrayList<>();
		
		if(files != null && files.size()>0) {
			System.out.println("files != null" + files);
			for(MultipartFile multipartFile : files) {
				String fileName = multipartFile.getOriginalFilename();
				fileNames.add(fileName);
				
//				File imageFile = new File(request.getServletContext().getRealPath("/images"),fileName);
								
//				try {
//					multipartFile.transferTo(imageFile);
//					
//				} catch (IllegalStateException e) {
//					e.printStackTrace();
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
				pfdBean = portfoliosAll.getPortfoliosDetailsBean();
				pfdBean.setPfdName(fileName);
				//建立Blob物件，交由hibernate寫入資料庫
				if(multipartFile != null  && !multipartFile.isEmpty() ) {
					
					try {
						byte[]b = multipartFile.getBytes();
						Blob blob = new SerialBlob(b);
						pfdBean.setPfdPic(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("圖片上傳發生異常"+ e.getMessage());
					}
				}
				
				pfdBean.setPfmId(portfoliosAll.getPortfoliosBean().getPfmId());
	
				pfdService.addPortfolioDetails(pfdBean);
				System.out.println(pfdBean.getPfdName());
				System.out.println(pfdBean.getPfmId());
				
				}
		
		}
		model.addAttribute("portfoliosAll",portfoliosAll);
		model.addAttribute("portfolioDetailsBean", pfdBean);
//		partnerBean = (PartnerBean) model.getAttribute("partnerBean");
//		model.addAttribute("portfolios", pfService.getPortfoliosByPartnerId(partnerBean.getP_id()));
		return "redirect:/portfoliosByPartnerId";
	}
	

	
	
	
	
}
