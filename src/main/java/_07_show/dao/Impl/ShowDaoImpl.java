package _07_show.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _06_Program.model.ProgramBean;
import _07_show.dao.ShowDao;
import partner_h._01_profolios.model.PortfoliosBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
import partner_h.partnerInfoEdit_h.service.PartnerService;
@Repository
@SessionAttributes({"category"})
public class ShowDaoImpl implements ShowDao {

	@Autowired
	PartnerService pService;
	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<PartnerBean> getPartnersByService(String category) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PartnerBean WHERE p_service = :p_service";
		 List<PartnerBean> pbList = session.createQuery(hql)
				 					.setParameter("p_service", category)
				 					.getResultList();
		 
		 return pbList; 
	}
	@Override
	public List<String> getAllCategories(){
		List<String> category = new ArrayList<>();
		category.add("婚禮佈置");
		category.add("婚禮攝影");
		category.add("新娘秘書");
		category.add("婚禮主持");
		return category;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ProgramBean> getProgramsByService(String category) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProgramBean WHERE prm_Category = :prm_Category";
		 List<ProgramBean> list = session.createQuery(hql)
				 					.setParameter("prm_Category", category)
				 					.getResultList();
		 
		 return list; 
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PortfoliosBean> getPortfoliosByService(String category) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PortfoliosBean WHERE pfService = :pfService";
		 List<PortfoliosBean> list = session.createQuery(hql)
				 					.setParameter("pfService", category)
				 					.getResultList();
		 
		 return list; 
	}
	
}
