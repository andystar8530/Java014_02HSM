package partner.quotecontract.template.service;

import partner.quotecontract.template.model.ContractTemplateBean;

public interface TemplateService {
	ContractTemplateBean getContractTemplateBean(int p_MId);
	ContractTemplateBean queryTemplateBean(String p_MId);
	int saveContractTemplate(ContractTemplateBean ctb);
	
}
