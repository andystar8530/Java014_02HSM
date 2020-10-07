package _07_show.dao;

import java.util.List;

import _06_Program.model.ProgramBean;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;

public interface ShowDao {

		//根據服務類型找到partner
		public List<PartnerBean>getPartnersByService(String category);
				
		//找所有分類
		public List<String> getAllCategories();
		
		//根據服務類型找到方案
		public List<ProgramBean>getProgramsByService(String category);
				
		//根據服務類型找到作品集
		public List<PortfoliosBean>getPortfoliosByService(String category);
		
}
