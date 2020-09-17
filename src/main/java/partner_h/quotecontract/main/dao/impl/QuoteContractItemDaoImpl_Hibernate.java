package partner_h.quotecontract.main.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partner_h.quotecontract.main.dao.QuoteContractItemDao;


@Repository
public class QuoteContractItemDaoImpl_Hibernate implements QuoteContractItemDao{

	@Autowired
	SessionFactory factory;
	
	public QuoteContractItemDaoImpl_Hibernate() {
		
	}
}
