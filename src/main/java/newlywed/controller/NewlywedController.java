package newlywed.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;

@Controller
@RequestMapping("/newlywed_h")
@SessionAttributes({"LoginOK"})
public class NewlywedController {

	@Autowired
	NewlywedService newlywedService;
	@Autowired
	MemberService memberSerivce;
	
//	@GetMapping("/newlywed")
//	public String getEmptyForm(Model model) {
//      NewlywedBean newlywedBean =new NewlywedBean();
//     
//      
//     model.addAttribute("NewlywedBean", newlywedBean);
//      return "/newlywed_h/newlywed";
//	}
	
	@GetMapping("/newlywedInfo")
	public String sendEmptyForm(Model model) {
      NewlywedBean newlywedBean =new NewlywedBean();
      model.addAttribute("NewlywedBean", newlywedBean);
      return "/newlywed_h/newlywedInfo";
	}

	@PostMapping("/newlywedInfo")
	public String processFormData(@ModelAttribute("NewlywedBean") NewlywedBean bean,
			                       BindingResult result ,Model model,HttpServletRequest request) {
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setCreatetime(registerTime);
		
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		bean.setMemberBean(mb);
		bean.setN_MID(mb.getM_No());
		
		
		if (newlywedService.idExists(bean.getN_nickname())) {
			result.rejectValue("N_nickname", "", "暱稱已存在，請重新輸入");
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
			result.rejectValue("N_nickname", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return "/newlywed_h/newlywedInfo";
		}
		return "redirect:/newlywed_h/newlywed";
	}
	@ModelAttribute
	   public void getFreeTime(Model model) {
	      Map<String, String> freeTime = new HashMap<String, String>();
	      freeTime.put("早上9點到中午12點", "早上9點到中午12點");
	      freeTime.put("下午1點到晚上6點", "下午1點到晚上6點");
	      freeTime.put("晚上六點到晚上10點", "晚上六點到晚上10點");
	     model.addAttribute("FreeTime",freeTime);
	   }
	@ModelAttribute
	public void getGender(Model model) {
		Map<String, String> gender = new HashMap<>();
		gender.put("0", "男生");
		gender.put("1", "女生");
		model.addAttribute("gender", gender);
	}
	
}
