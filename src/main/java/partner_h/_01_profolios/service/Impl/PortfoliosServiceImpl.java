package partner_h._01_profolios.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import partner_h._01_profolios.dao.PortfoliosDao;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h._01_profolios.service.PortfoliosService;
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
	public List<String> getAllPFCategory() {
		return pfDao.getAllPFCategory();
	}

	@Override
	public List<PortfoliosBean> getProductsByCategory(String category) {
		return pfDao.getProductsByCategory(category);
	}

	@Override
	public PortfoliosBean getProductById(int pfmId) {
		return pfDao.getProductById(pfmId);
	}

	@Override
	public void addProduct(PortfoliosBean product) {
		// TODO Auto-generated method stub
		
	}

}
