package partner_h._01_profolios.service.Impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partner_h._01_profolios.dao.PortfoliosDetailDao;
import partner_h._01_profolios.model.PortfoliosDetailsBean;
import partner_h._01_profolios.service.PortfoliosDetailsService;
@Service
@Transactional
public class PortfoliosDetailsServiceImpl implements PortfoliosDetailsService {

	@Autowired
	PortfoliosDetailDao dao ;
	
	@Override
	public List<PortfoliosDetailsBean> getPfDetailsBypfmId(int pfmId) {
		return dao.getPfDetailsBypfmId(pfmId);
	}

	@Override
	public void addPortfolioDetails(PortfoliosDetailsBean pfdBean) {
		 dao.addPortfolioDetails(pfdBean);
		
	}

	@Override
	public int updatePortfolio(PortfoliosDetailsBean pfdBean) {
		return dao.updatePortfolio(pfdBean);
	}

	@Override
	public int deletePortfolio(PortfoliosDetailsBean pfdBean) {
		return dao.deletePortfolio(pfdBean);
	}

	@Override
	public PortfoliosDetailsBean getPortfolioDetailsBypfdId(int pfdId) {
		return dao.getPortfolioDetailsBypfdId(pfdId);
	}

}
