package support.program.service.impl;

import java.util.Map;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _06_Program.model.ProgramBean;
import support.program.dao.BgProgramInfoDao;
import support.program.service.BgProgramInfoService;

@Transactional
@Service
public class BgProgramInfoServiceImpl implements BgProgramInfoService {
	@Autowired
	BgProgramInfoDao dao;

	@Autowired
	SessionFactory factory;
	
	public BgProgramInfoServiceImpl() {
	}
	

	@Override
	public ProgramBean getSupProgramById(int id) {
		return dao.getSupProgramById(id);	
	}

	@Override
	public Map<Integer, ProgramBean> getSupPageProgram(int ProgramPageNo) {
		Map<Integer, ProgramBean> map = null;
		map = dao.getSupPageProgram(ProgramPageNo);
		return map;
	}

	@Override
	public long getRecordCounts() {
		return dao.getRecordsPerPage();
	}

	@Override
	public int getRecordsPerPage() {
		// TODO Auto-generated method stub
		return 0;
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
	public void updateSupPageProgram(ProgramBean bean) {
		dao.updateSupPageProgram(bean);
	}


}
