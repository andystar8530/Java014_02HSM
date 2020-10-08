package support.program.service;

import java.util.Map;

import _06_Program.model.ProgramBean;

public interface BgProgramInfoService {

//	查詢修改相關(id)
	ProgramBean getSupProgramById(int id);
	
//	查詢會員相關
	Map<Integer,ProgramBean> getSupPageProgram(int programPageNo);
	long getRecordCounts();
	int getRecordsPerPage();
	int getTotalPages();
	void setRecordsPerPage(int recordsPerPage);
	void setSelected(String selected);
	
//	存取修改後商品
	void updateSupPageProgram(ProgramBean bean);
}