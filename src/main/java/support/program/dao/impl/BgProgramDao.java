package support.program.dao.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _06_Program.model.ProgramBean;
import support.mall.util.GlobalService;
import support.program.dao.BgProgramInfoDao;

@Repository
public class BgProgramDao implements BgProgramInfoDao {

	@Autowired
	SessionFactory factory;
	//預設值每頁顯示20筆
	private int recordsPerPage = GlobalService.IMAGE_FILENAME_LENGTH;
	private int ProgramtotalPages = -1;
	
	String selected = "";

	@Override
	public ProgramBean getSupProgramById(int id) {
		ProgramBean bean = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM ProgramBean cb WHERE cb.prm_Id = :id";
		try {
			bean = (ProgramBean) session.createQuery(hql).setParameter("id", id).getSingleResult();
		} catch (NoResultException e) {
			; // 表示查無紀錄
		}
		return bean;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, ProgramBean> getSupPageProgram(int programPageNo) {
		Map<Integer, ProgramBean> map = new LinkedHashMap<>();
		String hql = "FROM ProgramBean";
		Session session = factory.getCurrentSession();
		int startRecordNo = (programPageNo - 1) * recordsPerPage;
		List<ProgramBean> list = session.createQuery(hql).setFirstResult(startRecordNo).setMaxResults(recordsPerPage)
				.getResultList();
		for (ProgramBean bean : list) {
			map.put(bean.getPrm_Id(), bean);
		}
		return map;
	}

	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM ProgramBean";
		Session session = factory.getCurrentSession();
		count = (Long) session.createQuery(hql).getSingleResult();
		return count;
	}

	@Override
	public int getRecordsPerPage() {
		return recordsPerPage;
	}

	@Override
	public int getTotalPages() {
		ProgramtotalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return ProgramtotalPages;
	}

	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
		
	}

	@Override
	public void setSelected(String selected) {
		this.selected = selected;
		
	}

	//	修改更新狀態
	@Override
	public void updateSupPageProgram(ProgramBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);		
	}
	
	



}
