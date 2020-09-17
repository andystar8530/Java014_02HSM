package partner.quotecontract.template.service.impl;

import partner.quotecontract.template.dao.ContractTemplateDao;
import partner.quotecontract.template.dao.impl.ContractTemplateDaoImpl_Jdbc;
import partner.quotecontract.template.model.ContractTemplateBean;
import partner.quotecontract.template.service.TemplateService;

public class TemplateServiceImpl implements TemplateService {
	
	ContractTemplateDao dao;
	public TemplateServiceImpl() {
		this.dao = new ContractTemplateDaoImpl_Jdbc();
	}
	
	@Override
	public ContractTemplateBean getContractTemplateBean(int p_Id) {
		return dao.getContractTemplateBean(p_Id);
	}

	@Override
	public ContractTemplateBean queryTemplateBean(String p_Id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int saveContractTemplate(ContractTemplateBean ctb) {
		return dao.saveContractTemplate(ctb);
	}

}
