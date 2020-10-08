package partner_h.quotecontract.template.service;

import partner_h.quotecontract.template.model.ContractTemplateBean;

public interface ContractTemplateService {
	//修改範本內容
	void updateTemplate(ContractTemplateBean bean);

	//獲得1個ContractTemplate
	ContractTemplateBean getTemplateBean(int p_id);

	//新增
	Object save(ContractTemplateBean bean);
	

}
