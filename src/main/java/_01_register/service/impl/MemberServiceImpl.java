package _01_register.service.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_register.dao.MemberDao;
import _01_register.dao.impl.MemberDaoImpl;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;

@Transactional
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao  dao;
	
	@Autowired
	SessionFactory factory;
	
	public MemberServiceImpl() {
		dao=new MemberDaoImpl();
	}

	
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
		dao.saveMember(mb);
		n++;
		return n;
	}
	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		exist = dao.idExists(id);
		return exist;
	}
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
		mb = dao.queryMember(id);
		return mb;
	}
//	@Override
//	public void updateUnpaidOrderAmount(OrderBean ob) {
//		dao.updateUnpaidOrderAmount(ob);
//	}
	
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
		mb = dao.checkIdPassword(userId, password);
		return mb;
	}


	
	public MemberBean get(Integer pk) {
		MemberBean mb=null;
		mb=dao.get(pk);
		return mb;
	}
}
