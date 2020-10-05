package _06_Program.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _06_Program.dao.ProgramDao;
import _06_Program.model.ProgramBean;

@Repository
public class ProgramDaoImpl_H implements ProgramDao{

	
	@Autowired
	SessionFactory factory;

	public ProgramDaoImpl_H() {
		
	}
	
	//取全部的方案
	@SuppressWarnings("unchecked")
	@Override
	public List<ProgramBean> getAllPrograms() {
		List<ProgramBean> list = new LinkedList<>();
		String hql = "FROM ProgramBean";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
}
