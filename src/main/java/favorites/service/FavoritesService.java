package favorites.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import favorites.dao.FavoritesDao;
import favorites.model.FavoritesBean;
import partner_h.partnerInfoEdit_h.model.PartnerBean;
@Transactional
@Service
public class FavoritesService {
	@Autowired
	FavoritesDao dao;
	@Autowired
	SessionFactory factory;
	
	public void saveFavorites(FavoritesBean fb) {
		dao.saveFavorites(fb);
	}
	public List<PartnerBean> queryFavorites(Integer id){
		List<FavoritesBean> li=dao.queryFavorites(id);
		List<PartnerBean> pbli=new ArrayList<>();
		for(FavoritesBean fb:li) {
			pbli.add(fb.getPartnerBean());
		}
		return pbli;
	}
}
