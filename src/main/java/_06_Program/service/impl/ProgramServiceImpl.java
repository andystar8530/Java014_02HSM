package _06_Program.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _06_Program.dao.ProgramDao;
import _06_Program.model.ProgramBean;
import _06_Program.service.ProgramService;

@Service
public class ProgramServiceImpl implements ProgramService{
	@Autowired
	ProgramDao dao;
	
	//查詢全部記錄
	@Transactional
	@Override
	public List<ProgramBean> getAllPrograms() {
		return dao.getAllPrograms();
	}
}
