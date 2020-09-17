package partner_h._01_profolios.dao;

import java.util.List;

import partner_h._01_profolios.model.PortfoliosBean;



public interface PortfoliosDao {
	
	//取得所有作品集
	List<PortfoliosBean> getAllPortfolios();
	
	//更新作品集
	void updatePortfolio(PortfoliosBean pfBean);
	
	//取得作品集分類
	List<String> getAllPFCategory();
	
	//藉由分類取得該分類作品集
	List<PortfoliosBean> getProductsByCategory(String category);
	
	//經由作品集pk取得該作品集
	public PortfoliosBean getProductById(int pfmId);
	
	//新增產品資料的3個方法
	void addProduct(PortfoliosBean product);
	
//	CompanyBean getCompanyById(int companyId);
	
//	List<CompanyBean> getCompanyList();
}
