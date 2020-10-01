package partner_h._01_profolios.dao;

import java.util.List;

import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.model.PortfoliosDetailsBean;

public interface PortfoliosDetailDao {
	
	//查詢(由作品集Id查詢詳細資料)
	public  List<PortfoliosDetailsBean> getPfDetailsBypfmId(int pfmId);
	
	//新增
	void addPortfolioDetails(PortfoliosDetailsBean pfdBean);
	
	//修改
	int updatePortfolioDetail(PortfoliosDetailsBean pfdBean);
	
	//刪除
	int deletePortfolioDetail(PortfoliosDetailsBean pfdBean);
	
	public PortfoliosDetailsBean getPortfolioDetailsBypfdId(int pfdId);
	
	//

}