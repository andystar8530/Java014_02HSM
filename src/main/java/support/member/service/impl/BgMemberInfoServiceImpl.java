package support.member.service.impl;

import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _01_register.model.MemberBean;
import support.member.dao.BgMemberInfoDao;
import support.member.service.BgMemberInfoService;




@Transactional
@Service
public class BgMemberInfoServiceImpl implements BgMemberInfoService {
	@Autowired
	BgMemberInfoDao dao;

	@Autowired
	SessionFactory factory;

	 public BgMemberInfoServiceImpl() {
	}
	

	@Override
	public MemberBean getSupMemberById(int id) {
		return dao.getSupMemberById(id);		
	}

	@Override
	public Map<Integer, MemberBean> getSupPageMember(int MemberpageNo) {
		Map<Integer, MemberBean> map = null;
		map = dao.getSupPageMember(MemberpageNo);
		return map;
	}

	@Override
	public long getRecordCounts() {
		return dao.getRecordCounts();
	}

	@Override
	public int getRecordsPerPage() {
		return dao.getRecordsPerPage();
	}

	@Override
	public int getTotalPages() {
		int n = 0;
		n = dao.getTotalPages();
		return n;
	}

	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		dao.setRecordsPerPage(recordsPerPage);		
	}

	@Override
	public void setSelected(String selected) {
		dao.setSelected(selected);
	}


	@Override
	public void updateSupPageMember(MemberBean bean) {
		dao.updateSupPageMember(bean);
	}

	

}
