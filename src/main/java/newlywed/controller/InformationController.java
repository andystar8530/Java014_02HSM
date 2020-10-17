package newlywed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;

@Controller
@SessionAttributes({"LoginOK","NewlywedBean"})
public class InformationController {
	
	@Autowired 
	NewlywedService newlywedService;
	
	@Autowired 
	MemberService memberService;

	@GetMapping("/newlywed_h/newlywed")
	public String getEmptyForm(Model model) {
      NewlywedBean newlywedBean =new NewlywedBean();
      MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
      
      newlywedBean=newlywedService.queryNewlywed(mb.getM_No());
      
//      newlywedBean.setN_nickname(mb.getM_Id());
     
     model.addAttribute("NewlywedBean", newlywedBean);
      return "/newlywed_h/newlywed";
	}
	
	
}
