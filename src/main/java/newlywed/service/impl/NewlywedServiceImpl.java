package newlywed.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import newlywed.dao.NewlywedDao;
import newlywed.dao.impl.NewlywedDaoImpl;
import newlywed.model.NewlywedBean;
import newlywed.service.NewlywedService;


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


}
