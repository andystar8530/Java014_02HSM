package partner_h._01_profolios.service;

import java.util.List;

import partner_h._01_profolios.model.PortfoliosDetailsBean;

public interface PortfoliosDetailsService {

	//查詢(由作品集Id查詢詳細資料)
	public  List<PortfoliosDetailsBean> getPfDetailsBypfmId(int pfmId);
	
	//新增
	void addPortfolioDetails(PortfoliosDetailsBean pfdBean);
	
	//修改
	int updatePortfolio(PortfoliosDetailsBean pfdBean);
	
	//刪除
	int deletePortfolio(PortfoliosDetailsBean pfdBean);
	
	public PortfoliosDetailsBean getPortfolioDetailsBypfdId(int pfdId);
}
