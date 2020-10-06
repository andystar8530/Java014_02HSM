package _06_Program.service;

import java.util.List;

import _06_Program.model.ProgramBean;

public interface ProgramService {
	
		//查詢全部記錄  
		List<ProgramBean> getAllPrograms();
		
		//查詢單一合作商(依prm_Pid)的所有方案
		List<ProgramBean> getProgramsByPid(Integer prm_Pid);
		
		//根據方案pk取得該方案	
		ProgramBean getProgramByKey(Integer prm_Id);
		
		//新增方案
		void addProgram(ProgramBean programBean);
		
		//修改方案
		void updateProgram(ProgramBean programBean);
		
		//刪除方案
		int deleteProgramByKey(Integer prm_Id);
}
