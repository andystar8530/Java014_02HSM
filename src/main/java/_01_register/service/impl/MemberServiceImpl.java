package _01_register.service.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_register.dao.MemberDao;
import _01_register.model.MemberBean;
import _01_register.service.MemberService;
import _04_ShoppingCart.model.OrderBean;
@Transactional
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao  memberDao;
	
	@Autowired
	SessionFactory factory;
	
	public MemberServiceImpl() {
	}
	
	@Override
	public int saveMember(MemberBean mb) {
		int n = 0;
		memberDao.saveMember(mb);
		n++;
		return n;
	}
	@Override
	public boolean idExists(String id) {
		boolean exist = false;
		exist = memberDao.idExists(id);
		return exist;
	}
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
		mb = memberDao.queryMember(id);
		return mb;
	}
//	@Override
//	public void updateUnpaidOrderAmount(OrderBean ob) {
//		dao.updateUnpaidOrderAmount(ob);
//	}
	
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
		mb = memberDao.checkIdPassword(userId, password);
		return mb;
	}
	
	public MemberBean get(Integer pk) {
		MemberBean mb=null;
		mb=memberDao.get(pk);
		return mb;
	}

	@Override
	public void update(MemberBean memberBean) {
		memberDao.update(memberBean);
	}

}
