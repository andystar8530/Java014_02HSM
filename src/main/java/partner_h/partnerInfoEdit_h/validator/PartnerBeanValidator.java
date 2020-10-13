package partner_h.partnerInfoEdit_h.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import partner_h.partnerInfoEdit_h.model.PartnerBean;

public class PartnerBeanValidator implements Validator{

	boolean insertMode = true; 
	
	
	public PartnerBeanValidator() {

	}
	
	public PartnerBeanValidator(boolean insertMode) {
		this.insertMode = insertMode;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return PartnerBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		PartnerBean partnerBean = (PartnerBean)target;
		//傳入Spring MVC的path屬性		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_storeName", "","店家名稱不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_info", "","店家簡介不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_bankAcc", "","銀行帳號不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_hRate", "","預估時薪不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_lineId", "","LineID不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "covImage", "", "必須挑選圖片");
//		ValidationUtils.rejectIfEmpty(errors, "staImage", "", "必須挑選圖片");
		
		if(partnerBean.getP_area() == -1) {
			errors.rejectValue("p_area", "", "服務區域必須挑選");
		}
		if(partnerBean.getP_service().equals("-1")) {
			errors.rejectValue("p_service", "", "服務類型必須挑選");
		}
		
		if(insertMode) {
			if (partnerBean.getCovImage().isEmpty()) {
			errors.rejectValue("covImage", "", "必須挑選圖片");
			}
			if (partnerBean.getStaImage().getSize() == 0) {
			errors.rejectValue("staImage", "", "必須挑選圖片");
			}
		}
		
	}

}
