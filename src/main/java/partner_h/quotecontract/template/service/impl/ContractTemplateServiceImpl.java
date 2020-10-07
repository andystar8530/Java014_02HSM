package partner_h.quotecontract.template.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partner_h.quotecontract.template.dao.ContractTemplateDao;
import partner_h.quotecontract.template.model.ContractTemplateBean;
import partner_h.quotecontract.template.service.ContractTemplateService;

@Service
@Transactional
public class ContractTemplateServiceImpl implements ContractTemplateService {

	@Autowired
	private ContractTemplateDao ctdao;
	
	@Override
	public void updateTemplate(ContractTemplateBean bean) {
		ctdao.updateTemplate(bean);

	}

	@Override
	public ContractTemplateBean getTemplateBean(int p_id) {
		ContractTemplateBean ctb = ctdao.getTemplateBean(p_id);
		return ctb;
	}

	@Override
	public Object save(ContractTemplateBean bean) {
		return ctdao.save(bean);
	}

}
