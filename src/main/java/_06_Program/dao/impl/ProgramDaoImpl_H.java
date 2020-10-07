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
		String hql = "FROM ProgramBean ORDER BY prm_Createdate DESC";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProgramBean> getProgramsByPid(Integer prm_Pid) {
		List<ProgramBean> list = new LinkedList<>();
		String hql = "FROM ProgramBean WHERE prm_Pid =:prm_Pid ORDER BY prm_Createdate DESC";
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql)
				.setParameter("prm_Pid", prm_Pid)
				.getResultList();
		return list; 
	}

	@Override
	public ProgramBean getProgramByKey(Integer prm_Id) {
		Session session = factory.getCurrentSession();
		ProgramBean programBean = session.get(ProgramBean.class,prm_Id);
		return programBean;
	}

	@Override
	public void addProgram(ProgramBean programBean) {
		Session session = factory.getCurrentSession();
		
		programBean.setPrm_Createdate(new java.sql.Timestamp(System.currentTimeMillis()));
		programBean.setPrm_Editdate(new java.sql.Timestamp(System.currentTimeMillis()));
		programBean.setPrm_Status("未審核");
		session.save(programBean);
		
	}

	@Override
	public void updateProgram(ProgramBean programBean) {
		Session session = factory.getCurrentSession();
		session.merge(programBean);
		
	}

	@Override
	public int deleteProgramByKey(Integer prm_Id) {
		int n = 0 ;
		Session session = factory.getCurrentSession();
		session.delete(getProgramByKey(prm_Id));
		n++;
		return n ;
		
	}
	
}
