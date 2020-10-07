package support.member.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import _03_listProducts.model.ProductBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

public class MemberBeanValidator implements Validator{

	boolean insertMode = true; 
	
	
	public MemberBeanValidator() {

	}
	
	public MemberBeanValidator(boolean insertMode) {
		this.insertMode = insertMode;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return ProductBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ProductBean ProductBean = (ProductBean)target;
		//傳入Spring MVC的path屬性
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_storeName", "","名稱不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_info", "","簡介不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_bankAcc", "","銀行帳號不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_hRate", "","預估時薪不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "p_lineId", "","LineId不能空白");
//		ValidationUtils.rejectIfEmpty(errors, "covImage", "", "必須挑選圖片");
//		ValidationUtils.rejectIfEmpty(errors, "staImage", "", "必須挑選圖片");
		
//		if(ProductBean.getP_area() == -1) {
//			errors.rejectValue("p_area", "", "必須挑選服務區域");
//		}
//		if(ProductBean.getP_service().equals("-1")) {
//			errors.rejectValue("p_service", "", "必須挑選服務類型");
//		}
//		
//		if(insertMode) {
//			if (ProductBean.getCovImage().isEmpty()) {
//			errors.rejectValue("covImage", "", "必須挑選圖片");
//			}
//			if (ProductBean.getStaImage().getSize() == 0) {
//			errors.rejectValue("staImage", "", "必須挑選圖片");
//			}
//		}
		
	}

}
