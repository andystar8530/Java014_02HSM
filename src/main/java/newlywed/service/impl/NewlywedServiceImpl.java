package newlywed.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import newlywed.dao.NewlywedDao;
import newlywed.dao.impl.NewlywedDaoImpl;
import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;
import partner_h.quotecontract.main.model.QuoteContractBean;


@Transactional
@Service
public class NewlywedServiceImpl implements NewlywedService {
	
	@Autowired
	NewlywedDao dao;
	@Autowired
	SessionFactory factory;
	
	public NewlywedServiceImpl() {
		dao=new NewlywedDaoImpl();
	}

	@Override
	public boolean idExists(String id) {
		boolean exists = false;
		exists = dao.idExists(id);
		return exists;
	}

	@Override
	public int saveNewlyed(NewlywedBean nb) {
		int n = 0;
		dao.saveNewlyed(nb);
		n++;
		return n;
	}

	@Override
	public NewlywedBean queryNewlywed(Integer id) {
		NewlywedBean nb = null;
		nb=dao.queryNewlywed(id);
		return nb;
	}

	@Override
	public List<QuoteContractBean> getNewlyQuotes(String m_Id) {
		List<QuoteContractBean> list = null;
		list = dao.getNewlyQuotes(m_Id);
		return list;
	}

	@Override
	public List<QuoteContractBean> getNewlyStatusQuotes(String m_Id, int status) {
		List<QuoteContractBean> list = null;
		list = dao.getNewlyStatusQuotes(m_Id, status);
		return list;
	}


}
