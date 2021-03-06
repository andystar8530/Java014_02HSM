package partner_h._01_profolios.dao;

import java.util.List;

import partner_h._01_profolios.model.PortfoliosBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;



public interface PortfoliosDao {
	
	//取得所有作品集
	List<PortfoliosBean> getAllPortfolios();
	
	//更新作品集
	void updatePortfolio(PortfoliosBean pfBean);
	
	//取得所有服務項目
	List<String> getAllPServices();
	
	//藉由商家服務項目取得該分類作品集
	List<PortfoliosBean> getPortfoliosByService(String pfService);
	
	//依照商家Id取得該作品集
	public List<PortfoliosBean> getPortfoliosByPartnerId(int p_id);
	
	//經由作品集pk取得該作品集
	public PortfoliosBean getPortfolioById(int pfmId);
	
	//新增產品資料的3個方法
	void addPortfolio(PortfoliosBean portfolio);
	
	PartnerBean getPartnerById(int p_id);
	
	//依鍵值刪除作品集
	public void deletePortfolioById(int pfmId);
}
