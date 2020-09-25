package newlywed.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;

@Controller
@RequestMapping("/newlywed")
public class NewlywedController {

	@Autowired
	NewlywedService newlywedService;
	
	@GetMapping("/newlywedInfo")
	public String sendEmptyForm(Model model) {
      NewlywedBean newlywedBean =new NewlywedBean();
      model.addAttribute("NewlywedBean", newlywedBean);
      return "/newlywed_h/newlywedInfo";
	}

	
	
}