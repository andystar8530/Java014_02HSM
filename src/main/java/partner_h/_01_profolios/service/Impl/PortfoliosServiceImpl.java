package partner_h._01_profolios.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import partner_h._01_profolios.dao.PortfoliosDao;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.service.PortfoliosService;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
@Service
@Transactional
public class PortfoliosServiceImpl implements PortfoliosService {
	@Autowired
	PortfoliosDao pfDao;
	@Override
	public List<PortfoliosBean> getAllPortfolios() {
		return pfDao.getAllPortfolios();
	}

	@Override
	public void updatePortfolio(PortfoliosBean pfBean) {
		 pfDao.updatePortfolio(pfBean);
		
	}

	@Override
	public List<String> getAllPServices() {
		return pfDao.getAllPServices();
	}

	@Override
	public List<PortfoliosBean> getPortfoliosByService(String pfService) {
		return pfDao.getPortfoliosByService(pfService);
	}

	@Override
	public PortfoliosBean getPortfolioById(int pfmId) {
		return pfDao.getPortfolioById(pfmId);
	}

	@Override
	public void addPortfolio(PortfoliosBean pfBean) {
		 pfDao.addPortfolio(pfBean);
		
	}

	@Override
	public PartnerBean getPartnerById(int p_id) {
		return pfDao.getPartnerById(p_id);
	}
	

}
