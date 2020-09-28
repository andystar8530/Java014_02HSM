package partner_h._01_profolios.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import partner_h._01_profolios.model.PortfoliosAll;
import partner_h._01_profolios.model.PortfoliosBean;


public class PortfoliosValidator implements Validator{

	public PortfoliosValidator() {
	
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return PortfoliosBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		PortfoliosAll portfoliosAll = (PortfoliosAll)target;
		//傳入Spring MVC的path屬性
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "portfoliosBean.pfmName", "","名稱不能空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "portfoliosBean.pfmInfo", "","簡介不能空白");
	
		if( portfoliosAll.getPortfoliosBean().getPfService().equals("-1")) {
			errors.rejectValue("portfoliosBean.pfService", "", "必須挑選服務類型");
		}
		
		
	}

}
