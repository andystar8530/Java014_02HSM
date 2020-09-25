package _04_forum.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


import _04_forum.model.ForumBean;

@Component
public class ForumBeanValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return ForumBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ForumBean forumBean = (ForumBean) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fTitle", "", "請輸入文章標題");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "fText" , "", "請輸入文章內文");
		
		if(forumBean.getfCategory()<0) {
			errors.rejectValue("fCategory", "", "必須挑選文章類型");
		}
		
	}

}
