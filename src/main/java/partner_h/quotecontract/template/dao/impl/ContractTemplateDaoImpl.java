package partner_h.quotecontract.template.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h.quotecontract.template.dao.ContractTemplateDao;
import partner_h.quotecontract.template.model.ContractTemplateBean;

@Repository//存取資料庫的DAO必須加上此註釋
public class ContractTemplateDaoImpl  implements ContractTemplateDao{
	
	
	@Autowired//尋找所有受控管的bean
	private SessionFactory factory;
	int p_id=0;
	
	public ContractTemplateDaoImpl() {
	}


	//修改範本內容
	@Override
	public void updateTemplate(ContractTemplateBean bean) {
		Session session = factory.getCurrentSession();
        session.update(bean);
		
	}
	
	//獲得1個ContractTemplate
	@Override
	public ContractTemplateBean getTemplateBean(int p_id) {
		ContractTemplateBean ctbean = null;
		Session session = factory.getCurrentSession();
//		String hql = "FROM ContractTemplateBean c WHERE c.partner = :p_id";
		String hql = "FROM ContractTemplateBean c WHERE c.partner = :p_id";
		@SuppressWarnings("unchecked")
		List<ContractTemplateBean> beans = 
		(List<ContractTemplateBean>) session.createQuery(hql)
											.setParameter("p_id", p_id)
											.getResultList();
		if (beans.size() > 0) {
			ctbean = beans.get(0);
		}
		return ctbean;
	}

	//新增範本
	@Override
	public Object save(ContractTemplateBean bean) {
		Session session = factory.getCurrentSession();
        return session.save(bean);//臨時狀態儲存至永續
	}




	

}
