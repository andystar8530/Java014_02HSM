package _06_Program.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import _06_Program.model.ProgramBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

public class ProgramValidator implements Validator{
	boolean insertMode = true; 
	public ProgramValidator() {
		
	}
	public ProgramValidator(boolean insertMode) {
		this.insertMode = insertMode;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return ProgramBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ProgramBean programBean = (ProgramBean)target;
		//傳入Spring MVC的path屬性
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "prm_Title", "","名稱不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "prm_Content", "","簡介不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "prm_Detail", "","說明不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "prm_Price", "","價錢不能空白");
		
		if(insertMode) {
			if (programBean.getPrm_MultipartImage().isEmpty()) {
			errors.rejectValue("prm_MultipartImage", "", "必須挑選圖片");
			}
		}
		
	}

}
