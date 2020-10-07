package support.member.service;

import java.util.Map;

import _01_register.model.MemberBean;
import _03_listProducts.model.ProductBean;

public interface BgMemberInfoService {
//	查詢修改相關(id)
	MemberBean getSupMemberById(int id);
	
//	查詢會員相關
	Map<Integer,MemberBean> getSupPageMember(int pageNo);
	long getRecordCounts();
	int getRecordsPerPage();
	int getTotalPages();
	void setRecordsPerPage(int recordsPerPage);
	void setSelected(String selected);
	
//	存取修改後商品
	void updateSupPageMember(MemberBean bean);
}