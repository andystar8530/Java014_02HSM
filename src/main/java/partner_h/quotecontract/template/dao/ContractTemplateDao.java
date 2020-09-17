package partner_h.quotecontract.template.dao;

import java.sql.Connection;

import partner_h.quotecontract.template.model.ContractTemplateBean;

public interface ContractTemplateDao {

	
	public ContractTemplateBean queryBean(String p_MId);
		
	int updateContract(ContractTemplateBean bean, long sizeInBytes);

	public void setConnection(Connection con);

	ContractTemplateBean getContractTemplateBean(int p_Id);
	int saveContractTemplate(ContractTemplateBean ctb);
}
