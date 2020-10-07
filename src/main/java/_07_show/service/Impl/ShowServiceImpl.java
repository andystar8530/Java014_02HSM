package _07_show.service.Impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _06_Program.model.ProgramBean;
import _07_show.dao.ShowDao;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
@Service
@Transactional
public class ShowServiceImpl implements ShowService{

	@Autowired
	ShowDao dao;
	//根據服務類型找到partner
			public List<PartnerBean>getPartnersByService(String category){
				return dao.getPartnersByService(category);
			}
			
			
			@Override
			public List<String> getAllCategories() {
				return dao.getAllCategories();
			}


			@Override
			public List<ProgramBean> getProgramsByService(String category) {
				return dao.getProgramsByService(category);
			}


			@Override
			public List<PortfoliosBean> getPortfoliosByService(String category) {
				return dao.getPortfoliosByService(category);
			}

}
