package _06_Program.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _06_Program.dao.ProgramDao;
import _06_Program.model.ProgramBean;
import _06_Program.service.ProgramService;

@Service
@Transactional
public class ProgramServiceImpl implements ProgramService{
	@Autowired
	ProgramDao dao;
	
	//查詢全部記錄
	@Override
	public List<ProgramBean> getAllPrograms() {
		return dao.getAllPrograms();
	}

	@Override
	public List<ProgramBean> getProgramsByPid(Integer prm_Pid) {
		return dao.getProgramsByPid(prm_Pid);
	}

	@Override
	public ProgramBean getProgramByKey(Integer prm_Id) {
		return dao.getProgramByKey(prm_Id);
	}

	@Override
	public void addProgram(ProgramBean programBean) {	
		dao.addProgram(programBean);
		
	}

	@Override
	public void updateProgram(ProgramBean programBean) {
		dao.updateProgram(programBean);
		
	}

	@Override
	public int deleteProgramByKey(Integer prm_Id) {
		return dao.deleteProgramByKey(prm_Id);
	}
}
