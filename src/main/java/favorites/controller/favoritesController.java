package favorites.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import favorites.service.FavoritesService;
import newlywed.model.NewlywedBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

@Controller
@SessionAttributes({"LoginOK"})
public class favoritesController {
 @Autowired FavoritesService favoritesService;
 
 @Autowired 
	MemberService memberService;
 
 @GetMapping("/newlywed_h/favorites")
	public String getForm(Model model) {
	 
	 MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
	 List<PartnerBean> pbli=favoritesService.queryFavorites(mb.getM_No());
	 
//   
//   newlywedBean=newlywedService.queryNewlywed(mb.getM_No());
   
//   newlywedBean.setN_nickname(mb.getM_Id());
   
	 model.addAttribute("pbli", pbli);
   return "/newlywed_h/MyFavorites";
	}
}
