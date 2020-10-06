package _06_Program.dao;

import java.util.List;

import _06_Program.model.ProgramBean;

public interface ProgramDao {

	//查詢全部記錄  
	List<ProgramBean> getAllPrograms();
}
