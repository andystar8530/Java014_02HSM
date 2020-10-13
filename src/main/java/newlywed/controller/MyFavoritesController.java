package newlywed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import favorites.dao.FavoritesDao;
import favorites.model.FavoritesBean;
import favorites.service.FavoritesService;
import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;

@Controller
@SessionAttributes({"LoginOK"})
public class MyFavoritesController {
	@Autowired 
	NewlywedService newlywedService;
	
	@Autowired
	PartnerService partnerService;
	
	@Autowired
	FavoritesService favoritesService;
	
	@GetMapping("getFavorites")
	public String getFavorites(Model model,
			@RequestParam("p_id") Integer p_id ) {
      NewlywedBean newlywedBean =new NewlywedBean();
      PartnerBean partnerBean = new  PartnerBean();
      //PortfoliosBean pb = (PortfoliosBean) model.getAttribute("pb");
      MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
      
      newlywedBean=newlywedService.queryNewlywed(mb.getM_No());
//      newlywedBean.setN_favorite(p_id);
//      newlywedBean.setMemberBean(mb);
      partnerBean= partnerService.getPartner(p_id);
//      newlywedService.saveNewlyed(newlywedBean);
//      newlywedBean.setN_nickname(mb.getM_Id());
      FavoritesBean fb=new FavoritesBean();
      fb.setNewlywedBean(newlywedBean);
      fb.setPartnerBean(partnerBean);
      favoritesService.saveFavorites(fb);
     model.addAttribute("NewlywedBean", newlywedBean);
      return "redirect:/showPartnerDetail/"+p_id;
	}

}
