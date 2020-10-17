 package _01_register.controller;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import _00_init.util.RegisterSmtp;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _01_register.validator.MemberBeanValidatorUpdata;
import _02_login.model.LoginBean;



@Controller
//@RequestMapping("/crm")
@SessionAttributes({"LoginOK","memberBean"}) 
public class MemberController {
	String noImage = "/images/NoImage.png";
	String noImageFemale = "/images/NoImage_Female.jpg";
	String noImageMale = "/images/NoImage_Male.png";
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext context;
	

	
	//合作商帳號修改
	// 當使用者需要修改時，本方法送回含有會員資料的表單，讓使用者進行修改
	// 由這個方法送回修改記錄的表單...
	@GetMapping(value = "/crm/{id}")
	public String showDataForm(@PathVariable("id") Integer id, Model model) {
		MemberBean memberBean = memberService.get(id);
		model.addAttribute(memberBean);
		return "/partner_h/p_memberForm";
	}
	
	// 當將瀏覽器送來修改過的會員資料時，由本方法負責檢核，若無誤則寫入資料庫
		@PostMapping("/crm/{id}")
		// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
		// 
		public String modify(
				@ModelAttribute("memberBean") MemberBean memberBean,
				BindingResult result, 
				Model model,
				@PathVariable Integer id, 
				HttpServletRequest request) {
			//取原先 MemberBean 的值。
			MemberBean memberBeanUpd = memberService.get(id);
			MemberBeanValidatorUpdata validator = new MemberBeanValidatorUpdata();
			validator.validate(memberBean, result);
			
			
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), memberBean=" + memberBean);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "/partner_h/p_memberForm";
			}

			MultipartFile picture = memberBean.getMemberMultipartFile();

			if (picture.getSize() == 0) {
				// 表示使用者並未挑選圖片
//				Member original = memberService.get(id);
//				member.setImage(original.getImage());
			} else {
				String originalFilename = picture.getOriginalFilename();
				if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
					memberBean.setM_FileName(originalFilename);
					memberBeanUpd.setM_FileName(memberBean.getM_FileName());
				}

				// 建立Blob物件
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();
						Blob blob = new SerialBlob(b);
						memberBean.setM_Propic(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
					memberBeanUpd.setM_Propic(memberBean.getM_Propic());
				}
			}
			

			//更新項目
			memberBeanUpd.setM_Email(memberBean.getM_Email());
			memberBeanUpd.setM_Name(memberBean.getM_Name());
			memberBeanUpd.setM_Phone(memberBean.getM_Phone());
			if(memberBeanUpd.getM_EditTime() == null ){
				memberBeanUpd.setM_Socialnum(memberBean.getM_Socialnum());
			}
			memberBeanUpd.setM_Add(memberBean.getM_Add());

			
			//更新時間
			Timestamp editTime = new Timestamp(System.currentTimeMillis());
			memberBeanUpd.setM_EditTime(editTime);
			memberService.update(memberBeanUpd);
			model.addAttribute("LoginOK", memberBeanUpd);
			return "/partner_h/partner_h";
		}
		
		
		
		//新人帳號修改
		// 當使用者需要修改時，本方法送回含有會員資料的表單，讓使用者進行修改
		// 由這個方法送回修改記錄的表單...
		@GetMapping(value = "/nrm/{id}")
		public String showDataFormN(@PathVariable("id") Integer id, Model model) {
			MemberBean memberBean = memberService.get(id);
			model.addAttribute(memberBean);
			return "/newlywed_h/n_memberForm";
		}
		
		// 當將瀏覽器送來修改過的會員資料時，由本方法負責檢核，若無誤則寫入資料庫
		@PostMapping("/nrm/{id}")
		// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
		// 
		public String modifyN(
				@ModelAttribute("memberBean") MemberBean memberBean, 
				BindingResult result, 
				Model model,
				@PathVariable Integer id, 
				HttpServletRequest request) {
			//取原先 MemberBean 的值。
			MemberBean memberBeanUpd = memberService.get(id);
			MemberBeanValidatorUpdata validator = new MemberBeanValidatorUpdata();
			validator.validate(memberBean, result);
			
			
			if (result.hasErrors()) {
				System.out.println("result hasErrors(), memberBean=" + memberBean);
				List<ObjectError> list = result.getAllErrors();
				for (ObjectError error : list) {
					System.out.println("有錯誤：" + error);
				}
				return "/newlywed_h/n_memberForm";
			}
			
			MultipartFile picture = memberBean.getMemberMultipartFile();
			
			if (picture.getSize() == 0) {
				// 表示使用者並未挑選圖片
//				Member original = memberService.get(id);
//				member.setImage(original.getImage());
			} else {
				String originalFilename = picture.getOriginalFilename();
				if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
					memberBean.setM_FileName(originalFilename);
					memberBeanUpd.setM_FileName(memberBean.getM_FileName());
				}
				
				// 建立Blob物件
				if (picture != null && !picture.isEmpty()) {
					try {
						byte[] b = picture.getBytes();
						Blob blob = new SerialBlob(b);
						memberBean.setM_Propic(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
					memberBeanUpd.setM_Propic(memberBean.getM_Propic());
				}
			}
			
			
			//更新項目
			memberBeanUpd.setM_Email(memberBean.getM_Email());
			memberBeanUpd.setM_Name(memberBean.getM_Name());
			memberBeanUpd.setM_Phone(memberBean.getM_Phone());
			memberBeanUpd.setM_Socialnum(memberBean.getM_Socialnum());
			memberBeanUpd.setM_Add(memberBean.getM_Add());
			
			
			//更新時間
			Timestamp editTime = new Timestamp(System.currentTimeMillis());
			memberBeanUpd.setM_EditTime(editTime);
			
			memberService.update(memberBeanUpd);
			model.addAttribute("LoginOK", memberBeanUpd);
			return "/newlywed_h/newlywed";
		}
}
