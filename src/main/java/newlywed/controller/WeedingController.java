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
@SessionAttributes({ "LoginOK", "NewlywedBean" })
public class WeedingController {
	@Autowired
	NewlywedService newlywedService;

	@Autowired
	MemberService memberService;

	@GetMapping("/wedding")
	public String getEmptyForm(Model model) {
		NewlywedBean newlywedBean = new NewlywedBean();
		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");

		newlywedBean = newlywedService.queryNewlywed(mb.getM_No());

//    newlywedBean.setN_nickname(mb.getM_Id());

		model.addAttribute("NewlywedBean", newlywedBean);
		return "/newlywed_h/wedding";
	}

	@PostMapping("/wedding")
	public String processFormData(@ModelAttribute("NewlywedBean") NewlywedBean bean, BindingResult result, Model model,
			HttpServletRequest request) {

		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		bean.setCreatetime(registerTime);

		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
		bean.setMemberBean(mb);
		bean.setN_MID(mb.getM_No());
System.out.println(bean);
//		if (newlywedService.idExists(bean.getN_nickname())) {
//			result.rejectValue("N_nickname", "", "暱稱已存在，請重新輸入");
//			return "/newlywed_h/wedding";
//		}

		try {
			newlywedService.saveNewlyed(bean);
		}
//catch (org.hibernate.exception.ConstraintViolationException e) {
//result.rejectValue("memberId", "", "帳號已存在，請重新輸入");
//return inputDataForm;
//} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("N_nickname", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return "/newlywed_h/wedding";
		}
		return "redirect:/newlywed_h/newlywed";
	}
	@ModelAttribute
	   public void getBudget(Model model) {
	      Map<String, String> budget = new HashMap<String, String>();
	      budget.put("1", "20萬~~50萬");
	      budget.put("2", "50萬~~100萬");
	      budget.put("3", "100萬~~150萬");
	     model.addAttribute("budget",budget);
	   }
	@ModelAttribute
	   public void getWeddingList(Model model) {
	      Map<Integer, String> weddingList = new HashMap<Integer, String>();
	      weddingList.put(1, "婚禮布置");
	      weddingList.put(2, "婚禮攝影");
	      weddingList.put(3, "婚禮主持");
	      weddingList.put(4, "新娘秘書");
	     model.addAttribute("weddingList",weddingList);
	   }
}