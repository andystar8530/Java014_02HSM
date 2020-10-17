package _01_register.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _01_register.model.MemberBean;

public class MemberBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean mb = (MemberBean) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Id", 	"", "帳號欄不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Name", 		"", "姓名欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Password", 	"", "密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Password1", 	"", "確認密碼欄不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Code", 	"", "請選擇新人或合作商");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Add", 	"", "地址欄不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Email", 		"", "電子郵件欄不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "m_Phone", 		"", "電話欄不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "memberMultipartFile", "", "必須挑選圖片");
		if (mb.getM_Id().length()<5) {
			errors.rejectValue("m_Id","", "帳號欄不能小於五個字元");
		}
		
		if (! mb.getM_Password().equals(mb.getM_Password1())) {
			errors.rejectValue("m_Password","", "密碼欄與確認密碼不一致");
		}
		
		String format = "\\p{Alpha}\\w{2,25}[@][a-z0-9]{3,}[.]\\p{Lower}{2,}";
		if (! mb.getM_Id().matches(format))
		{ 
			errors.rejectValue("m_Id","", "Email名稱不合法");
		} 
//		System.out.println("mb.getMemberMultipartFile().getSize()=" + mb.getMemberMultipartFile().getSize());
//		if (mb.getMemberMultipartFile().getSize() == 0) {
//			errors.rejectValue("memberMultipartFile", "", "必須挑選圖片");
//		}
	}

}
