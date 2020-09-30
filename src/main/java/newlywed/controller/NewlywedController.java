package newlywed.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;

@Controller
@RequestMapping("/newlywed_h")
public class NewlywedController {

	@Autowired
	NewlywedService newlywedService;
	
	@GetMapping("/newlywed")
	public String getEmptyForm(Model model) {
//      NewlywedBean newlywedBean =new NewlywedBean();
//      model.addAttribute("NewlywedBean", newlywedBean);
      return "/newlywed_h/newlywed";
	}
	
	@GetMapping("/newlywedInfo")
	public String sendEmptyForm(Model model) {
      NewlywedBean newlywedBean =new NewlywedBean();
      model.addAttribute("NewlywedBean", newlywedBean);
      return "/newlywed_h/newlywedInfo";
	}

	@PostMapping("/newlyedwedInfo")
	public String processFormData(@ModelAttribute("NewlywedBean") NewlywedBean bean,
			                       BindingResult result ,Model model,HttpServletRequest request) {
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setCreatetime(registerTime);
		
		
		if (newlywedService.idExists(bean.getN_nickname())) {
			result.rejectValue("N_id", "", "暱稱已存在，請重新輸入");
			return "/newlywed_h/newlywedInfo";
		}
		
		try {
			newlywedService.saveNewlyed(bean);
		} 
//		catch (org.hibernate.exception.ConstraintViolationException e) {
//			result.rejectValue("memberId", "", "帳號已存在，請重新輸入");
//			return inputDataForm;
//		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("N_id", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return "/newlywed_h/newlywedInfo";
		}
		return "redirect:/";
	}
	
}
