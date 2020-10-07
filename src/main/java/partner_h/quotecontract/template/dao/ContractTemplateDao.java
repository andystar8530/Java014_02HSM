package partner_h.quotecontract.template.dao;

import partner_h.quotecontract.template.model.ContractTemplateBean;

public interface ContractTemplateDao {

	//修改範本內容
	void updateTemplate(ContractTemplateBean bean);

	//獲得1個ContractTemplate
	ContractTemplateBean getTemplateBean(int p_id);

	//新增
	Object save(ContractTemplateBean bean);
}
