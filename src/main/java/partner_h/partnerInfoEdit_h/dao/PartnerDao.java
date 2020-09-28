package partner_h.partnerInfoEdit_h.dao;

import java.util.List;

import partner_h.partnerInfoEdit_h.model.PartnerBean;



public interface PartnerDao {
	

	//由一id取得某合作商資料
	PartnerBean getPartner(int p_id) ;

	//更新合作商資料
	public int updatePartner(PartnerBean pb); 
	
	//新增合作商資料//參考老師saveMember(MemberBean mb)
	public int savePartner(PartnerBean pb);
//	
	public boolean idExists(String p_mId);
	
	
	public PartnerBean queryPartner(int p_mId) ;

	//取得所有服務類型
	public List<String> getServiceList();
	
	//依照服務類型來查詢店家
	public List<PartnerBean> getPartnerByService(String p_service);
	
	
	
	//依照服務區域來查詢店家
	public List<PartnerBean> getPartnerByArea(int p_area);
}