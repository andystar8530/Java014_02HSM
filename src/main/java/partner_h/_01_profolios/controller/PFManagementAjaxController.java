package partner_h._01_profolios.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.service.PortfoliosService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;

@Controller
@SessionAttributes({"partnerBean","pfmId","p_id","portfolio"})
public class PFManagementAjaxController {

	@Autowired
	PortfoliosService portfoliosService;
	@Autowired
	PartnerService pService;
	


	
//	public PFManagementAjaxController() {
//	}

	@GetMapping("/getPfListByPartnerId")
	@ResponseBody
	public List<PortfoliosBean>  getPfListByPartnerId(Model model){
		PartnerBean pb = (PartnerBean) model.getAttribute("partnerBean");
		List<PortfoliosBean> pfBeanList = null;
		
		pfBeanList = portfoliosService.getPortfoliosByPartnerId(pb.getP_id());
		return pfBeanList;
	}
	
	//先到管理頁面
	@GetMapping("/showPortfoliosManagement")
	public String showPortfoliosManagement(Model model) {
		return "partner_h/_01_portfolios/portfoliosManagement";
	}
	
	//先到單一作品集編輯頁面
	@GetMapping("/portfolioEdit/{pfmId}")
	public String showPortfolioInfo(Model model,
					@PathVariable Integer pfmId) {
		model.addAttribute("pfmId",pfmId);
		Integer p_id = ((PartnerBean)model.getAttribute("partnerBean")).getP_id();
		PortfoliosBean pfBean = portfoliosService.getPortfolioById(pfmId);
		model.addAttribute("portfolio", pfBean);
		model.addAttribute("p_id",p_id);
		
		return "partner_h/_01_portfolios/editPortfolio";
	}
	//載入使用者原資料
//	@GetMapping(value="/portfolioUpdate",produces = {"application/json"})
//	public @ResponseBody PortfoliosBean getPortfolioByPId(
//				@RequestParam Integer pfmId 
//			) {
//		PortfoliosBean pfBean = portfoliosService.getPortfolioById(pfmId);
//		return pfBean;
//	}
	
//	@GetMapping("/portfolioUpdate")
//	public String getPortfolioByPId(Model model , 
//			@RequestParam Integer pfmId
//			) {
//		
//	}
	
	
	//修改資料
	@PutMapping(value="/portfolioUpdate"
			,consumes = {"application/json"} 
			,produces = {"application/json"})
	public @ResponseBody Map<String , String> updatePortfolio(
				@RequestBody PortfoliosBean pfBean 
			){

		Map<String , String> map = new HashMap<>();
		try {
			System.out.println("try 更新資料-----------");

			pfBean.setPartnerBean(pService.getPartner(pfBean.getP_id()));
			
			portfoliosService.updatePortfolio(pfBean);
			
			
			map.put("success", "更新成功");
			System.out.println("更新資料成功");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("fail","更新失敗");
			System.out.println("更新資料失敗");
		}
		return map;
	}
	
	private void copyUnupdateField(PortfoliosBean pfBean0, PortfoliosBean pfBean) {
		pfBean.setExtra(pfBean0.getExtra());
	}
	
	//依鍵值刪除單筆作品集
	@DeleteMapping(value= "/portfolio/{pfmId}")
	public @ResponseBody Map<String , String> deletePortfolio (
			@PathVariable(required = true)Integer pfmId){
		
		Map<String , String> map = new HashMap<>();
		try {
			portfoliosService.deletePortfolioById(pfmId);
			map.put("success", "刪除成功");
			System.out.println("刪除成功");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("fail","刪除失敗");
			System.out.println("刪除失敗");
		}
		return map ;
	}
	
}
