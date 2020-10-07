package support.member.dao;

import java.util.Map;

import _01_register.model.MemberBean;
import _03_listProducts.model.ProductBean;

public interface BgMemberInfoDao {
//	查詢修改相關(id)
	MemberBean getSupMemberById(int id);
	
//	查詢會員相關
	Map<Integer,MemberBean> getSupPageMember(int pageNo);
	long getRecordCounts();
	int getRecordsPerPage();
	int getTotalPages();
	void setRecordsPerPage(int recordsPerPage);
	void setSelected(String selected);
	
//	儲存修改後
	void updateSupPageMember(MemberBean bean);
	

}