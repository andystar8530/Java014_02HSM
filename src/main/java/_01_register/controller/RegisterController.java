package _01_register.controller;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import _00_init.util.GlobalService;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _01_register.validator.MemberBeanValidator;

@Controller
@RequestMapping("/_01_register")

public class RegisterController {
	
	String rootDirectory = "d:\\images";
	String inputDataForm = "_01_register/registerForm"; 
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/register")   
	public String sendingEmptyForm(Model model) {
		MemberBean memberBean = new MemberBean();
//		memberBean.setM_Password("Do!ng123");
//		memberBean.setM_Password1("Do!ng123");
//		memberBean.setM_Id("rockstar@rock.star");
		model.addAttribute("memberBean", memberBean);
		return inputDataForm;
	}
	
	@PostMapping("/register")
	public String processFormData(
			@ModelAttribute("memberBean") MemberBean bean,
			BindingResult result, Model model,
			HttpServletRequest request,
			RedirectAttributes redirectAtt
			
			) {
		MemberBeanValidator validator = new MemberBeanValidator();
		validator.validate(bean, result);
		if (result.hasErrors()) {
//          下列敘述可以理解Spring MVC如何處理錯誤			
//			List<ObjectError> list = result.getAllErrors();
//			for (ObjectError error : list) {
//				System.out.println("有錯誤：" + error);
//			}
			return inputDataForm;
		}
		
//		不用傳圖片
//		MultipartFile picture = bean.getMemberMultipartFile();
//		String originalFilename = picture.getOriginalFilename();
//		
//		String ext = "";
//		if (originalFilename.lastIndexOf(".") > -1) {
//			ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		}
//		
//		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
//			bean.setM_FileName(originalFilename);
//		}
//		// 建立Blob物件，交由 Hibernate 寫入資料庫
//		if (picture != null && !picture.isEmpty()) {
//			try {
//				byte[] b = picture.getBytes();
//				Blob blob = new SerialBlob(b);
//				bean.setM_Propic(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
		// 檢查 memberId是否重複
		if (memberService.idExists(bean.getM_Id())) {
			result.rejectValue("m_Id", "", "帳號已存在，請重新輸入");
			return inputDataForm;
		}
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		Timestamp editTime = new Timestamp(System.currentTimeMillis());
		bean.setM_CreateTime(registerTime);
		bean.setM_EditTime(editTime);
		bean.setM_Name("會員");
		bean.setM_Email(bean.getM_Id());
		bean.setM_Status(0);
		
		bean.setM_Password(GlobalService.getMD5Endocing(
				GlobalService.encryptString(bean.getM_Password())));
		

		
		try {
			int n = memberService.saveMember(bean);
			if (n == 1) {
				String farewellMessage = "<Font color='red'>新增成功，請開始使用本系統</Font>";
				redirectAtt.addFlashAttribute("FlashMSG_farewell", farewellMessage);
			}
		} 
//		catch (org.hibernate.exception.ConstraintViolationException e) {
//			result.rejectValue("mId", "", "帳號已存在，請重新輸入");
//			return inputDataForm;
//		} 
		catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
			result.rejectValue("mId", "", "發生異常，請通知系統人員..." + ex.getMessage());
			return inputDataForm;
		}
		// 將上傳的檔案移到指定的資料夾, 目前註解此功能
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists())
//				imageFolder.mkdirs();
//			File file = new File(imageFolder, "MemberImage_" + bean.getMemberId() + ext);
//			picture.transferTo(file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		return "redirect:/";
		
	}
	
	@ModelAttribute
	public void commonData(Model model) {
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("0", "新人");
		genderMap.put("1", "合作商");
		model.addAttribute("genderMap", genderMap);
	}
	
//	@ModelAttribute
//	public MemberBean prepareMemberBean(HttpServletRequest req) {
//		MemberBean memberBean = new MemberBean();
//		memberBean.setTotalAmt(0.0);
//		memberBean.setUnpaid_amount(0.0);
//		memberBean.setUserType("M");
//		return memberBean;
//	}
}
