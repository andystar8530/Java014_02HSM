package _01_register.dao.impl;

import java.sql.Connection;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _01_register.dao.MemberDao;
import _01_register.model.MemberBean;
// 本類別使用為標準的Hibernate+Spring技術來存取資料庫。
@Repository
public class MemberDaoImpl_Hibernate implements MemberDao {
	
	@Autowired
	SessionFactory factory;
	
	public MemberDaoImpl_Hibernate() {
	}
	// 儲存MemberBean物件，將參數mb新增到Member表格內。
	public int saveMember(MemberBean mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);n++;
		return mb.getM_No();
	}
	// 判斷參數id(會員帳號)是否已經被現有客戶使用，如果是，傳回true，表示此id不能使用，
	// 否則傳回false，表示此id可使用。
	@Override
	public boolean idExists(String id) {
		Session session = factory.getCurrentSession();
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.m_Id = :mid";
		@SuppressWarnings("unchecked")
		List<MemberBean> beans = (List<MemberBean>) session.createQuery(hql)
										.setParameter("mid", id)
										.getResultList();
		
		if (beans.size() > 0) {
			exist = true;
		}
		return exist;
	}
	// 由參數 id (會員帳號) 到Member表格中 取得某個會員的所有資料，傳回值為一個MemberBean物件，
	// 如果找不到對應的會員資料，傳回值為null。
	@Override
	public MemberBean queryMember(String id) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.m_Id = :mid";
		@SuppressWarnings("unchecked")
		List<MemberBean> beans = (List<MemberBean>) session.createQuery(hql)
										.setParameter("mid", id)
										.getResultList();
		if (beans.size() > 0) {
			mb = beans.get(0);
		}
		return mb;

	}
	// 檢查使用者在登入時輸入的帳號與密碼是否正確。如果正確，傳回該帳號所對應的MemberBean物件，
	// 否則傳回 null。
	@Override
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.m_Id = :mid and m.m_Password = :pwsd";
		Session session = factory.getCurrentSession();
		try {
			mb = (MemberBean)session.createQuery(hql)
								.setParameter("mid", userId)
								.setParameter("pwsd", password)
								.getSingleResult();
		} catch(NoResultException ex) {
			;
		} catch(NonUniqueResultException ex) {
			throw new RuntimeException("帳號資料有誤(NonUnique)，應重建初始資料");
		} 	
		return mb;
	}
	
	public MemberBean get(Integer pk) {
		MemberBean mb=null;
		Session session=factory.getCurrentSession();
		mb=(MemberBean) session.get(MemberBean.class,pk);
		return mb;
	}
	
	
	/*
	 * 功能：更新客戶的未付款訂購金額。
	 * 說明：處理客戶訂單時，[訂單的總金額 + 該客戶的未付款餘額]不能超過限額，
	 * 此限額定義在 GlobalService類別的常數: ORDER_AMOUNT_LIMIT
	 * 步驟：
	 * 1. 取出Member表格內的 Member#unpaid_amount欄位(未付款餘額) 
	 * 2. unpaid_amount加上本訂單的總金額後，檢查該數值是否超過限額
	 *    (GlobalService.ORDER_AMOUNT_LIMIT)。 
	 *    如果超過限額， 則
	 *    		該訂單不予處裡， 丟出UnpaidOrderAmountExceedingException，
	 * 	    否則更新Member表格的unpaid_amount欄位: Member#unpaid_amount += currentAmount;
	 */
//	@Override
//	public void updateUnpaidOrderAmount(OrderBean ob) {
//		double currentAmount = ob.getTotalAmount(); // 取出該訂單的總金額
//		Double unpaidAmount = 0.0;
//		MemberBean mb = null;
//		// 讀取Member表格中，該客戶的未付款金額(unpaid_amount)
//		String hql = "FROM MemberBean m WHERE m.m_Id = :mid";
//		Session session = factory.getCurrentSession();
//		
//		try {
//			mb = (MemberBean)session.createQuery(hql)
//								.setParameter("mid", ob.getMemberId())
//								.getSingleResult();
//		} catch(NoResultException ex) {
//			
//			throw new MemberNotFoundException("會員:" + ob.getMemberId() + "找不到");
//		} catch(NonUniqueResultException ex) {
//			;
//		} 	
//		unpaidAmount = mb.getUnpaid_amount();
//		
//        // 如果該客戶的最新未付款總額 大於 公司規定之允許未付款總額
//		if (currentAmount + unpaidAmount > GlobalService.ORDER_AMOUNT_LIMIT) {
//			throw new UnpaidOrderAmountExceedingException("未付款金額超過限額: " + (currentAmount + unpaidAmount));
//		} else {
//			;
//		}
//		// 更新Member表格之未付款餘額欄位 unpaid_amount
//		String hql2 = "UPDATE MemberBean m SET m.unpaid_amount = m.unpaid_amount + :amt " 
//		            + " WHERE m_Id = :mid";
//		session.createQuery(hql2)
//				.setParameter("amt", currentAmount)
//				.setParameter("mid", ob.getMemberId())
//				.executeUpdate();
//	}
	
	@Override
	public void setConnection(Connection conn) {
		throw new RuntimeException("本類別為提供此功能");
	}
	@Override
	public void update(MemberBean memberBean) {
		if (memberBean != null && memberBean.getM_Id() != null) 	{
			Session session = factory.getCurrentSession();
			session.update(memberBean);
		}
	}
}
