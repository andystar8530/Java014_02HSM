package partner_h.partnerInfoEdit_h.service;


import java.util.List;

import partner_h.partnerInfoEdit_h.model.PartnerBean;



public interface PartnerService {
	
	// 依pmId來查詢單筆記錄
	PartnerBean getPartner(int p_id) ;//由一id取得某合作商資料
	
	public PartnerBean queryPartner(int p_mId) ;


	
	public int updatePartner(PartnerBean mb); 
	
	public int savePartner(PartnerBean pb);//參考老師saveMember(MemberBean mb)
	
	public boolean idExists(String p_mId);
	
	//取得所有服務類型
	public List<String> getServiceList();
		
	//依照服務類型來查詢店家
	public List<PartnerBean> getPartnerByService(String p_service);
	

	
	//依照服務區域來查詢店家
	public List<PartnerBean> getPartnerByArea(int p_area);
}
