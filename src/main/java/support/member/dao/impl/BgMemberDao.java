package support.member.dao.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import _01_register.model.MemberBean;
import _03_listProducts.model.ProductBean;
import support.mall.util.GlobalService;
import support.member.dao.BgMemberInfoDao;

@Transactional
@Service
public class BgMemberDao implements BgMemberInfoDao {

	@Autowired
	SessionFactory factory;

	// 預設值每頁顯示20筆
	private int recordsPerPage = GlobalService.IMAGE_FILENAME_LENGTH;
	private int MembertotalPages = -1;
	String selected = "";

	// 取id
	@Override
	public MemberBean getSupMemberById(int id) {
		MemberBean bean = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean cb WHERE cb.m_No = :id";
		try {
			bean = (MemberBean) session.createQuery(hql).setParameter("id", id).getSingleResult();
		} catch (NoResultException e) {
			; // 表示查無紀錄
		}
		return bean;
	}
	
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<Integer, MemberBean> getSupPageMember(int MemberpageNo) {
		Map<Integer, MemberBean> map = new LinkedHashMap<>();
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		int startRecordNo = (MemberpageNo - 1) * recordsPerPage;
		List<MemberBean> list = session.createQuery(hql).setFirstResult(startRecordNo).setMaxResults(recordsPerPage)
				.getResultList();
		for (MemberBean bean : list) {
			map.put(bean.getM_No(), bean);
			System.out.println("Map的bean" + bean);
		}
		return map;
	}

	@Override
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT count(*) FROM MemberBean";
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
		MembertotalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return MembertotalPages;
	}

	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;

	}

	@Override
	public void setSelected(String selected) {
		this.selected = selected;

	}

	//	修改會員狀態
	@Override
	public void updateSupPageMember(MemberBean bean) {
		Session session = factory.getCurrentSession();
		session.update(bean);
	}


}
